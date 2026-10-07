---
name: proposta-sob-medida
description: Transforma a conversa com o cliente (leitura da call, transcrição, anotações, mensagens ou ficha de investigação) em uma proposta comercial personalizada, na identidade visual da empresária, com três opções de investimento, pronta para revisar no navegador e salvar em PDF. Use quando ela disser "proposta", "orçamento", "montar proposta para", "mandar proposta" ou depois de uma call de diagnóstico.
---

# Proposta sob medida

Você monta propostas que fazem o cliente pensar "ela me ouviu". Uma proposta sob medida usa as palavras do cliente, responde ao medo dele e deixa a decisão fácil.

## Regras

- **Só entre aspas o que o cliente realmente disse** (está na transcrição, nas mensagens ou no formulário). Leitura sua aparece como leitura, sem aspas.
- O preço vem de `4-precos/precos.md`, seção "Decisão". Se não houver preço decidido, pare e indique `/preco-com-clareza`. Nunca invente preço.
- Não invente resultado, número, prazo, depoimento, case ou garantia. Comprometa-se com o que ela entrega, não com o que o cliente vai faturar.
- O escopo diz o que **está** e o que **não está** incluído.
- A proposta é escrita na voz dela (`minha-voz.md`), no registro mais estruturado: primeira pessoa, sem gíria.

## Etapa 1 — Reunir o material

Leia, nesta ordem, o que existir:
1. `3-diagnosticos/[cliente]/leitura-da-call.md` (principal)
2. Transcrição, anotações ou mensagens em `3-diagnosticos/[cliente]/` ou `5-propostas/[cliente]/`
3. `1-leads/investigacoes/` (ficha do lead)
4. `4-precos/precos.md` (pacotes e decisão)
5. `0-meu-negocio/perfil-do-negocio.md`, `identidade-visual.md` e o logo

Se não houver nada da conversa, faça 5 perguntas, uma por vez: dor principal, objetivo, medo ou experiência ruim anterior, prazo, faixa de investimento sinalizada.

## Etapa 2 — Mostrar a leitura antes de escrever

Apresente em uma tabela curta e peça confirmação:

| O cliente disse | Vira na proposta |
|---|---|
| Dor: "…" | título do diagnóstico |
| Objetivo: "…" | a frase da capa |
| Medo: "…" | compromisso concreto no escopo (ex.: relatório mensal, reunião fixa, prazo por etapa) |
| Orçamento: "…" | qual das 3 opções será a recomendada |

## Etapa 3 — Escrever a proposta (10 seções)

1. **Capa:** nome do cliente, a frase-objetivo, data e validade (padrão: 10 dias)
2. **O que você me contou:** 3 a 5 falas reais do cliente, entre aspas
3. **Diagnóstico:** onde está o gargalo, em até 3 pontos, cada um ligado a uma evidência
4. **Onde queremos chegar:** o que muda ao final do período, de forma observável, sem garantir número
5. **Como eu vou fazer:** o método em 3 a 5 etapas
6. **O que está incluído e o que não está**
7. **Linha do tempo:** semana a semana no primeiro mês, depois por mês
8. **Meus compromissos com você:** a resposta direta ao medo que ele contou
9. **Investimento:** 3 opções lado a lado, a do meio marcada como "recomendada para você", com o que muda entre elas e as condições de pagamento que ela informou
10. **Próximo passo:** como dizer sim, em até 3 passos (ex.: "me responde com a opção escolhida → te envio o contrato → marcamos o início")

## Etapa 4 — Gerar o arquivo

1. Crie a pasta `5-propostas/[nome-do-cliente]/`.
2. Copie `modelos/proposta.html` para `5-propostas/[nome-do-cliente]/proposta.html`.
3. Preencha o conteúdo das seções do modelo. Mantenha a estrutura e as classes.
4. Aplique a identidade: troque as variáveis de cor no bloco `:root` do modelo pelas cores de `identidade-visual.md`; se houver logo, copie para a pasta da proposta e aponte a tag `<img class="logo">` para ele. Sem identidade definida, mantenha o padrão neutro do modelo.
5. Abra no navegador (`open` no Mac, `start` no Windows).

Explique: para gerar o PDF, ela clica em **"Salvar em PDF"** no topo, escolhe "Salvar como PDF", tamanho A4 e marca "gráficos de fundo".

## Etapa 5 — Revisar e registrar

1. Pergunte o que ajustar. Repita até ela aprovar.
2. Quando ela disser que enviou: em `6-vendas/negocios.csv`, `etapa = proposta`, `valor_mensal`/`meses`/`valor_total` da opção recomendada, `proxima_acao = conversar sobre a proposta`, `data_proxima_acao` = data combinada para a apresentação (ou hoje + 2 dias úteis). Registre em `contatos.csv` (`tipo = proposta`) e regenere `7-painel/dados.js`.

Recomendação: sempre que possível, **apresente a proposta em uma conversa curta** (15 minutos) em vez de só mandar o PDF. Proposta enviada sem conversa vira silêncio com facilidade.

Próximo passo: `/depois-da-proposta monta o que fazer depois de enviar a proposta para [cliente]`.
