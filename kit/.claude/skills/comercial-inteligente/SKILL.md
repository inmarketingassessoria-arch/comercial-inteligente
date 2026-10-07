---
name: comercial-inteligente
description: Painel de bordo do método Comercial Inteligente. Mostra em que etapa a empresária está, o que já foi construído, o que falta e qual é o próximo passo. Use quando ela disser "por onde começo", "onde eu parei", "o que falta", "qual o próximo passo", "me ajuda com o meu comercial" ou abrir o projeto pela primeira vez.
---

# Painel de bordo — Comercial Inteligente

Você orienta a empresária dentro do método. Não executa as etapas aqui: diagnostica onde ela está e indica a próxima skill, com o comando pronto para ela usar.

## Passo 1 — Verificar o estado do projeto

Confira a existência e o conteúdo destes itens, sem pedir nada a ela:

| # | Etapa | Está pronta quando… |
|---|---|---|
| 0 | Instalação | as skills aparecem em `.claude/skills/` e existe `CLAUDE.md` |
| 1 | Raio-x do negócio | `0-meu-negocio/perfil-do-negocio.md` e `cliente-ideal.md` existem |
| 2 | Chave do Apify | `.env` existe e a linha `APIFY_TOKEN=` não está vazia (confira só se está preenchida, **sem ler nem mostrar o valor**: use `grep -c '^APIFY_TOKEN=.\+' .env`) |
| 3 | Mapa de leads | `1-leads/leads.csv` tem pelo menos uma linha além do cabeçalho |
| 4 | Investigação | existe ao menos um arquivo em `1-leads/investigacoes/` |
| 5 | Voz + primeira conversa | `0-meu-negocio/minha-voz.md` existe e há arquivos em `2-conversas/` |
| 6 | Call de diagnóstico | há arquivos em `3-diagnosticos/` |
| 7 | Preço | `4-precos/precos.md` existe |
| 8 | Proposta | há ao menos uma pasta em `5-propostas/` |
| 9 | Depois da proposta | há arquivo `depois-da-proposta.md` em alguma pasta de `5-propostas/` |
| 10 | Painel | `7-painel/painel.html` e `7-painel/dados.js` existem |
| 11 | Ritual semanal | há arquivos em `6-vendas/semanas/` |

Se `6-vendas/negocios.csv` tiver linhas, conte também: negócios por etapa e quantos têm `data_proxima_acao` igual ou anterior a hoje.

## Passo 2 — Mostrar o mapa

Responda neste formato, curto:

```
Comercial Inteligente — onde você está

✅ 1. Raio-x do negócio
✅ 2. Chave do Apify
⏳ 3. Mapa de leads   ← você está aqui
⬜ 4. Investigação
⬜ 5. Primeira conversa
⬜ 6. Call de diagnóstico
⬜ 7. Preço com clareza
⬜ 8. Proposta sob medida
⬜ 9. Depois da proposta
⬜ 10. Painel de vendas
⬜ 11. Ritual semanal
```

Se houver negócios no funil, acrescente: "Hoje você tem X retornos para fazer" e os nomes.

## Passo 3 — Indicar o próximo passo

Dê **um** próximo passo, com o comando pronto para copiar. Exemplos:

- Sem raio-x: `/raio-x-do-negocio vamos montar o perfil do meu negócio`
- Sem chave do Apify: oriente a seguir `material-de-apoio/01-guia-de-instalacao.md`, parte "Chave do Apify", e diga que a chave é colada direto no arquivo `.env`, nunca no chat.
- Sem leads: `/mapa-de-leads quero encontrar até 30 leads para a minha oferta principal`
- Com leads, sem investigação: `/investigar-lead investiga os 3 primeiros da classe A`
- E assim por diante, seguindo a ordem do método.

Exceções:
- Etapas 6 (call) e 8 (proposta) dependem de um lead que respondeu. Se ninguém respondeu ainda, recomende seguir para `/preco-com-clareza` (que não depende de lead) e voltar às retomadas.
- Se houver retornos vencidos, priorize: "antes de avançar, você tem retornos para hoje" e indique `/ritual-semanal`.

## Passo 4 — Se for a primeira vez

Se nada existir ainda (etapa 1 pendente), apresente o método em 6 linhas antes do mapa:

> O Comercial Inteligente é o seu departamento comercial de IA, aqui no seu computador. São 4 fases: **Clareza** (entender o seu negócio e o seu cliente ideal), **Prospecção ativa** (encontrar e pesquisar empresas que precisam de você), **Conversa** (abordar com mensagens na sua voz e conduzir a call) e **Fechamento** (preço, proposta e retomadas). Um painel acompanha tudo. A IA executa e mostra o raciocínio; você aprova e decide. Bora começar pelo raio-x do seu negócio.
