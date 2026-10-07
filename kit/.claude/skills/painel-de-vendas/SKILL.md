---
name: painel-de-vendas
description: Monta e mantém o painel de vendas local (funil arrastável, quem precisa de retorno, leads, faturamento, despesas, sobra e meta) a partir das planilhas do projeto, e atualiza as planilhas quando a empresária conta o que aconteceu ("a clínica X fechou", "mandei mensagem para Y", "paguei uma ferramenta"). Use quando ela disser "painel", "dashboard", "funil", "pipeline", "faturamento", "meta do mês", "lança uma despesa", "fechou", "perdi", "atualiza o painel" ou "abre o painel".
---

# Painel de vendas

O painel é um arquivo que abre no navegador e mostra o comercial inteiro em um lugar. Ele não é um aplicativo: não tem login, não fica na internet, não manda mensagens e não se conecta ao WhatsApp. Os dados moram nas planilhas do projeto, e o painel lê e grava nelas.

## Montar o painel (primeira vez)

1. Garanta que as planilhas existem com os cabeçalhos do `CLAUDE.md` (seção 5): `6-vendas/negocios.csv`, `contatos.csv`, `despesas.csv`, `metas.csv`. Crie as que faltarem só com o cabeçalho.
2. Preencha com o que já existe:
   - leads com `status = no-funil` sem negócio correspondente → crie o negócio;
   - propostas em `5-propostas/` sem negócio → crie com `etapa = proposta`;
   - pergunte, uma coisa por vez: **contratos ativos** (cliente, valor por mês, meses, data de início), **despesas fixas do mês** (descrição e valor) e **meta do mês**.
3. Rode `bash ferramentas/atualizar-painel.sh`. Ele cria `7-painel/painel.html` (cópia de `modelos/painel.html`) e gera `7-painel/dados.js`.
4. Aplique a identidade visual de `0-meu-negocio/identidade-visual.md`: troque **só** as variáveis do bloco `:root` no topo de `7-painel/painel.html` (cores e fontes). Não altere o resto do arquivo.
5. Abra no navegador (`open 7-painel/painel.html` no Mac, `start 7-painel/painel.html` no Windows).

## O tour (explique em linguagem simples)

- **Hoje:** faturamento do mês, sobra (entradas menos despesas), valor na mesa (propostas e negociações abertas), taxa de fechamento e **quem precisa de retorno hoje**. O botão "feito" registra o retorno e pede a próxima ação.
- **Funil:** 8 etapas (mapeado, abordado, em conversa, diagnóstico, proposta, negociação, ganho, perdido). Arrastar para "ganho" pede o valor e os meses; arrastar para "perdido" pede o motivo.
- **Leads:** a lista do mapa com Índice de Fit e classe, e o botão "levar para o funil".
- **Financeiro:** entradas do mês (contratos recorrentes aparecem em cada mês do contrato), despesas (recorrentes repetem todo mês), meta.

**Para gravar o que ela muda no painel:** abrir no **Chrome ou Edge**, clicar em **"Conectar pasta do projeto"** e escolher a pasta principal do projeto (a que tem o `CLAUDE.md`). O navegador pede permissão para editar; ela aceita. A partir daí, cada mudança vai direto para as planilhas. No Safari ou no Firefox o painel funciona só em modo leitura; nesse caso, ela usa **"Copiar alterações para o Claude"** e cola aqui, e você grava.

## Atualizar conversando

Ela pode só contar. Traduza para a planilha certa, confirme o que mudou e rode o script:

| Ela diz | Você faz |
|---|---|
| "A clínica X fechou por R$ 3.800 por mês, 3 meses" | `negocios.csv`: etapa `ganho`, valor_mensal `3800.00`, meses `3`, valor_total `11400.00`, fechado_em hoje |
| "Mandei mensagem para Y hoje" | `contatos.csv` + negócio: `ultimo_contato` hoje, próxima ação e data (retomada seguinte) |
| "Z pediu para voltar em novembro" | `data_proxima_acao` para a data combinada, `proxima_acao` "retomar conversa" |
| "Perdi W, fechou com outra pessoa" | etapa `perdido`, `motivo_perda` "escolheu outra pessoa" |
| "Paguei R$ 120 de ferramenta" | `despesas.csv`: data de hoje, valor `120.00`, pergunte a categoria e se é recorrente |
| "Minha meta de novembro é R$ 18 mil" | `metas.csv`: `2026-11`, `18000.00` |

Antes de gravar, confirme valores ambíguos (por mês ou total? quantos meses?). Depois de gravar: `bash ferramentas/atualizar-painel.sh` e diga em uma linha o que mudou no placar.

## Se a pasta estiver conectada

Quando ela edita no painel com a pasta conectada, as planilhas já mudam. Antes de alterar uma planilha a pedido dela, **leia a versão atual do arquivo** para não sobrescrever o que ela fez no painel.
