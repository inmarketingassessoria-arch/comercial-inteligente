#!/usr/bin/env bash
# Gera o ZIP do Comercial Inteligente para entregar às mentoradas.
#
# Uso: bash scripts/gerar-kit.sh [versão]
# Exemplo: bash scripts/gerar-kit.sh 1.0.0
#
# Saída: dist/comercial-inteligente-v<versão>.zip
# Dentro do ZIP a pasta se chama meu-comercial-inteligente/

set -eu
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
VERSAO="${1:-$(date '+%Y.%m.%d')}"
NOME="meu-comercial-inteligente"
TMP="$RAIZ/dist/.montagem"; rm -rf "$TMP"
trap 'rm -rf "$TMP"' EXIT

mkdir -p "$TMP/$NOME" "$RAIZ/dist"
cp -R "$RAIZ/kit/." "$TMP/$NOME/"

# Nunca entregar chave, dados de teste ou lixo do sistema
rm -f "$TMP/$NOME/.env"
find "$TMP/$NOME" \( -name ".DS_Store" -o -name ".apify-resposta.tmp" \) -delete
rm -rf "$TMP/$NOME/1-leads/busca"/* "$TMP/$NOME/7-painel/painel.html" "$TMP/$NOME/7-painel/dados.js"
for f in 1-leads/leads.csv 6-vendas/negocios.csv 6-vendas/contatos.csv 6-vendas/despesas.csv 6-vendas/metas.csv; do
  head -1 "$RAIZ/kit/$f" > "$TMP/$NOME/$f"
done

# Mantém as pastas vazias que as skills esperam
for d in 0-meu-negocio/mensagens 1-leads/busca 1-leads/investigacoes 2-conversas 3-diagnosticos 4-precos 5-propostas 6-vendas/semanas 7-painel; do
  mkdir -p "$TMP/$NOME/$d"
  [ -n "$(ls -A "$TMP/$NOME/$d")" ] || touch "$TMP/$NOME/$d/.manter"
done

chmod +x "$TMP/$NOME/ferramentas/"*.sh
echo "$VERSAO" > "$TMP/$NOME/VERSAO.txt"

ZIP="$RAIZ/dist/comercial-inteligente-v$VERSAO.zip"
rm -f "$ZIP"
(cd "$TMP" && zip -qr "$ZIP" "$NOME")

if grep -rIl -E "apify_api_[A-Za-z0-9]{8,}" "$TMP/$NOME" >/dev/null 2>&1; then
  echo "ATENÇÃO: encontrei uma chave preenchida dentro do kit. O ZIP foi apagado." >&2
  rm -f "$ZIP"; exit 1
fi

echo "OK: $ZIP"
echo "Arquivos: $(cd "$TMP" && find "$NOME" -type f | wc -l | tr -d ' ')"
