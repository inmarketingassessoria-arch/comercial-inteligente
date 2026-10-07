#!/usr/bin/env bash
# Comercial Inteligente — atualiza a fotografia do painel a partir das planilhas
#
# Uso: bash ferramentas/atualizar-painel.sh
#
# Lê 1-leads/leads.csv e 6-vendas/*.csv e grava 7-painel/dados.js.
# Na primeira vez, copia modelos/painel.html para 7-painel/painel.html.

set -u
RAIZ="$(cd "$(dirname "$0")/.." && pwd)"
cd "$RAIZ" || exit 1

mkdir -p 7-painel
[ -f 7-painel/painel.html ] || cp modelos/painel.html 7-painel/painel.html

escapar() { # conteúdo seguro para uma string JavaScript entre crases
  [ -f "$1" ] || { printf ''; return; }
  sed -e 's/\\/\\\\/g' -e 's/`/\\`/g' -e 's/\${/\\${/g' -e 's/\r$//' "$1"
}

EMPRESA=""
if [ -f 0-meu-negocio/perfil-do-negocio.md ]; then
  EMPRESA="$(grep -m1 -i 'nome do negócio' 0-meu-negocio/perfil-do-negocio.md | sed -e 's/.*:\**[[:space:]]*//' -e 's/\*//g' -e 's/"//g' -e 's/\r$//')"
fi

{
  echo "// Gerado por ferramentas/atualizar-painel.sh em $(date '+%Y-%m-%d %H:%M'). Não edite à mão."
  echo "window.DADOS_INFO = { empresa: \"$EMPRESA\", geradoEm: \"$(date '+%Y-%m-%d %H:%M')\" };"
  echo "window.DADOS_CSV = {"
  echo "leads: \`$(escapar 1-leads/leads.csv)\`,"
  echo "negocios: \`$(escapar 6-vendas/negocios.csv)\`,"
  echo "contatos: \`$(escapar 6-vendas/contatos.csv)\`,"
  echo "despesas: \`$(escapar 6-vendas/despesas.csv)\`,"
  echo "metas: \`$(escapar 6-vendas/metas.csv)\`"
  echo "};"
} > 7-painel/dados.js

contar() { [ -f "$1" ] && echo $(( $(grep -c . "$1") - 1 )) || echo 0; }
echo "OK: painel atualizado."
echo "Leads: $(contar 1-leads/leads.csv) · Negócios: $(contar 6-vendas/negocios.csv) · Despesas: $(contar 6-vendas/despesas.csv)"
echo "Abra: 7-painel/painel.html"
