#!/usr/bin/env bash
# Comercial Inteligente — conexão com o Apify
#
# Uso:
#   bash ferramentas/apify.sh <maps|instagram> <entrada.json> <saida.json> [limite_usd]
#
#   maps       Google Maps Scraper (empresas, contatos, nota, avaliações)
#   instagram  Instagram Profile Scraper (bio, seguidores, posts recentes de perfis públicos)
#   limite_usd teto de gasto desta execução, em dólares (padrão: 1.00)
#
# A chave é lida do arquivo .env (APIFY_TOKEN=...) e nunca é exibida.
# Funciona no macOS e no Windows (Git Bash). Precisa apenas de curl.

set -u

ATOR="${1:-}"
ENTRADA="${2:-}"
SAIDA="${3:-}"
LIMITE="${4:-1.00}"

falhar() { echo "ERRO: $1" >&2; exit 1; }

[ -n "$ATOR" ] && [ -n "$ENTRADA" ] && [ -n "$SAIDA" ] || falhar "uso: bash ferramentas/apify.sh <maps|instagram> <entrada.json> <saida.json> [limite_usd]"

case "$ATOR" in
  maps)      ATOR_ID="nwua9Gu5YrADL7ZDj" ;;  # Google Maps Scraper
  instagram) ATOR_ID="dSCLg0C3YEZ83HzYX" ;;  # Instagram Profile Scraper
  *) falhar "ator desconhecido '$ATOR'. Use maps ou instagram." ;;
esac

[ -f "$ENTRADA" ] || falhar "arquivo de entrada não encontrado: $ENTRADA"
command -v curl >/dev/null 2>&1 || falhar "o comando curl não está disponível neste computador."

RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
ENV="$RAIZ/.env"
[ -f "$ENV" ] || falhar "arquivo .env não encontrado na pasta do projeto. Copie .env.exemplo para .env e cole a sua chave do Apify depois de APIFY_TOKEN="

TOKEN="$(grep -E '^APIFY_TOKEN=' "$ENV" | head -1 | cut -d= -f2- | tr -d '\r"'"'"' ')"
[ -n "$TOKEN" ] || falhar "a linha APIFY_TOKEN= do arquivo .env está vazia. Cole a chave do Apify logo depois do sinal de igual e salve."

API="https://api.apify.com/v2"
DIR_SAIDA="$(dirname "$SAIDA")"
mkdir -p "$DIR_SAIDA"
TMP="$DIR_SAIDA/.apify-resposta.tmp"

pegar() { # pegar <campo> <arquivo> → primeiro valor de texto do campo JSON
  grep -o "\"$1\":\"[^\"]*\"" "$2" | head -1 | sed "s/\"$1\":\"\(.*\)\"/\1/"
}
pegar_numero() {
  grep -o "\"$1\":[0-9.]*" "$2" | head -1 | sed "s/\"$1\"://"
}

echo "Iniciando a busca no Apify ($ATOR), com teto de US\$ $LIMITE..."
CODIGO=$(curl -s -o "$TMP" -w "%{http_code}" -X POST \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  --data-binary @"$ENTRADA" \
  "$API/acts/$ATOR_ID/runs?maxTotalChargeUsd=$LIMITE&waitForFinish=60")

case "$CODIGO" in
  201|200) ;;
  401|403) rm -f "$TMP"; falhar "o Apify recusou a chave (código $CODIGO). Confira se a chave no .env está completa e correta." ;;
  402)     rm -f "$TMP"; falhar "sem saldo no Apify (código 402). Confira o uso do mês em Billing no site do Apify." ;;
  *)       MSG=$(pegar message "$TMP"); rm -f "$TMP"; falhar "o Apify respondeu com código $CODIGO. ${MSG:-}" ;;
esac

EXECUCAO=$(pegar id "$TMP")
DATASET=$(pegar defaultDatasetId "$TMP")
STATUS=$(pegar status "$TMP")
[ -n "$EXECUCAO" ] || { rm -f "$TMP"; falhar "não consegui identificar a execução no Apify."; }

TENTATIVAS=0
while [ "$STATUS" = "READY" ] || [ "$STATUS" = "RUNNING" ] || [ "$STATUS" = "TIMING-OUT" ] || [ "$STATUS" = "ABORTING" ]; do
  TENTATIVAS=$((TENTATIVAS + 1))
  [ "$TENTATIVAS" -le 20 ] || { rm -f "$TMP"; falhar "a busca passou de 20 minutos. Ela continua no Apify (execução $EXECUCAO). Tente baixar depois."; }
  echo "Buscando... (status: $STATUS)"
  curl -s -o "$TMP" -H "Authorization: Bearer $TOKEN" "$API/actor-runs/$EXECUCAO?waitForFinish=60"
  STATUS=$(pegar status "$TMP")
done

CUSTO=$(pegar_numero usageTotalUsd "$TMP")

if [ "$STATUS" != "SUCCEEDED" ]; then
  rm -f "$TMP"
  falhar "a busca terminou com status $STATUS (execução $EXECUCAO). Se o teto de gasto foi atingido, os resultados parciais podem estar no Apify."
fi

CODIGO=$(curl -s -o "$SAIDA" -w "%{http_code}" -H "Authorization: Bearer $TOKEN" \
  "$API/datasets/$DATASET/items?format=json&clean=true")
rm -f "$TMP"
[ "$CODIGO" = "200" ] || falhar "a busca terminou, mas não consegui baixar os resultados (código $CODIGO)."

REGISTROS=$(grep -o '"title":' "$SAIDA" | wc -l | tr -d ' ')
[ "$ATOR" = "instagram" ] && REGISTROS=$(grep -o '"username":' "$SAIDA" | wc -l | tr -d ' ')

echo "OK: busca concluída."
echo "Execução: $EXECUCAO"
echo "Registros (aprox.): $REGISTROS"
echo "Custo informado pelo Apify: US\$ ${CUSTO:-não informado}"
echo "Resultado salvo em: $SAIDA"
