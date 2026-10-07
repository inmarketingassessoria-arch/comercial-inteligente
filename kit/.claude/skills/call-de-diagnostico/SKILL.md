---
name: call-de-diagnostico
description: Prepara e aproveita a call com o lead — formulário para ele responder antes, roteiro da call personalizado com a ficha de investigação e, depois da call, a leitura organizada (palavras do cliente, dores, objetivo, medos, critérios de decisão, orçamento) com a recomendação de seguir, nutrir ou encerrar. Use quando ela disser "marquei uma call", "reunião com o lead", "roteiro de reunião", "como conduzir a call", "formulário" ou trouxer a transcrição ou as anotações de uma conversa.
---

# Call de diagnóstico

Você prepara a empresária para conduzir a conversa mais importante do processo, e depois transforma o que o cliente disse na matéria-prima da proposta. Quem conduz a call é ela.

A call serve para **entender antes de propor**: o cliente fala mais, ela pergunta e escuta. A proposta só é feita se fizer sentido para os dois lados.

## Modo 1 — Antes da call

Leia `1-leads/investigacoes/` (ficha do lead), `2-conversas/` (o que já foi dito) e `0-meu-negocio/perfil-do-negocio.md`.

### 1. Formulário prévio (opcional, recomendado para ofertas de maior valor)

Escreva de 5 a 7 perguntas curtas que o lead responde antes da call, com a mensagem de envio na voz dela. Base:
- O que te fez topar essa conversa agora?
- Como funciona hoje [área da oferta] no seu negócio?
- O que já tentou para resolver e como foi?
- Se isso estivesse resolvido daqui a 3 meses, o que teria mudado?
- Quem mais participa dessa decisão?
- Existe um prazo ou momento importante pela frente?

Ofereça montar o formulário no Google Forms (ela cria e cola as perguntas) ou mandar as perguntas pelo WhatsApp.

### 2. Roteiro da call (30 a 40 minutos)

Grave `3-diagnosticos/L00X-nome/roteiro.md` com:

| Bloco | Tempo | Objetivo | Perguntas sugeridas |
|---|---|---|---|
| Abertura | 3 min | combinar a agenda: "vou te fazer algumas perguntas, depois te conto como posso ajudar, e no fim a gente vê se faz sentido seguir" | — |
| Situação | 8 min | como funciona hoje | personalizadas pela ficha |
| Impacto | 8 min | o que isso custa em tempo, dinheiro, energia | "o que acontece quando…?", "quanto isso pesa no mês?" |
| Tentativas | 5 min | o que já fez e por que não funcionou | revela medos e critérios |
| Visão de sucesso | 5 min | como seria o cenário ideal, nas palavras dele | "se desse certo, como você saberia?" |
| Decisão | 5 min | quem decide, prazo, faixa de investimento | "tem uma faixa de investimento em mente?", "quem mais precisa estar nessa decisão?" |
| Próximo passo | 3 min | combinar data de envio **e** data de apresentação da proposta | "te mando até quinta e a gente conversa 15 minutos na sexta para eu te apresentar?" |

Inclua:
- 3 perguntas específicas tiradas da ficha de investigação.
- Os pontos de atenção da ficha (o que não dizer).
- Lembrete: **peça autorização para gravar** se for usar transcrição ("posso gravar só para não perder nada do que você me contar?").
- Atualize o negócio em `6-vendas/negocios.csv` para `etapa = diagnostico`, com a data da call em `data_proxima_acao`.

### 3. Até o dia da call (para a pessoa comparecer)

Entre o agendamento e a call, escreva na voz dela **no máximo 2 mensagens**, cada uma com algo útil, não só um lembrete:

| Quando | Mensagem |
|---|---|
| Logo após marcar | Confirmação com dia, horário e link, e **uma** coisa para a pessoa pensar antes ("se puder, separa 2 minutos para lembrar o que mais te incomoda em [área]") |
| Na véspera ou 2 h antes | Lembrete curto + um conteúdo pequeno que responde a uma dúvida comum de quem está nessa situação (um exemplo, um bastidor, um antes e depois real dela). Nunca depoimento ou número inventado: se ela não tiver material real, envie só o lembrete |

Se a pessoa faltar: uma mensagem gentil oferecendo dois horários novos. Se faltar de novo, a etapa volta para `em-conversa` e entra nas retomadas.

## Modo 2 — Depois da call

Peça o material: transcrição (`.txt`, `.docx` ou colada), anotações, áudio já transcrito, prints da conversa ou as respostas do formulário. Salve em `3-diagnosticos/L00X-nome/` (ou no nome do cliente, se não veio da prospecção).

Se não houver material registrado, faça 6 perguntas, uma por vez: qual a dor principal, o que ele quer alcançar, o que ele teme, o que já tentou, quem decide e quanto pretende investir, e qual o prazo.

Grave `3-diagnosticos/L00X-nome/leitura-da-call.md`:

```
# Leitura da call — [cliente] · AAAA-MM-DD

## Nas palavras do cliente (só falas reais, entre aspas)
- Dor: "..."
- Objetivo: "..."
- Medo: "..."
- Sobre investimento: "..."

## O que eu entendi (leitura, não fala do cliente)
- Problema central:
- Causa provável:
- O que ele valoriza:

## Critérios de decisão
Quem decide · prazo · faixa de investimento sinalizada · o que precisa ver para dizer sim

## Encaixe com a minha oferta
Qual oferta resolve · o que fica fora do escopo · riscos

## Recomendação
SEGUIR para proposta / NUTRIR (ainda não é o momento: quando voltar e com o quê) / ENCERRAR (motivo)
```

**Regra:** só vai entre aspas o que está no material. Se a fala foi resumida nas anotações, escreva "segundo as anotações" e não use aspas.

Mostre a leitura e peça confirmação: "foi isso que você ouviu? quer corrigir algo?".

Atualize `6-vendas/negocios.csv` (decisor, observações, `proxima_acao`) e registre a call em `contatos.csv`.

Próximo passo: se ainda não houver `4-precos/precos.md`, `/preco-com-clareza`; senão, `/proposta-sob-medida monta a proposta para [cliente] a partir da leitura da call`.
