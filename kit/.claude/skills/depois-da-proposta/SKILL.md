---
name: depois-da-proposta
description: Monta o plano do que fazer depois de enviar uma proposta — para cada cenário (sem resposta, "está caro", "vou pensar", "preciso falar com alguém", "agora não", sumiu, sim, não) o próximo passo, quando agir e a mensagem pronta na voz da empresária — e registra a data do próximo contato no funil. Também ajuda a responder uma objeção que acabou de chegar. Use quando ela disser "mandei a proposta", "o cliente não respondeu", "ele disse que está caro", "vai pensar", "objeção", "como respondo", "o cliente sumiu" ou "fechou".
---

# Depois da proposta

A venda raramente se perde no "não". Ela se perde no silêncio. Você garante que cada proposta tenha um próximo passo com data e uma resposta preparada para cada reação.

## Regras

- Toda retomada traz algo novo ou útil. Nunca "só passando para saber se viu".
- **Desconto tira escopo, nunca margem.** A saída para "está caro" é a opção menor, não o mesmo trabalho por menos.
- Sem pressão: nada de prazo falso, escassez inventada ou "só hoje". Prazo só se for real (agenda, validade da proposta).
- No máximo 4 retomadas sem resposta. Depois, encerramento elegante.
- Todas as mensagens na voz dela (`minha-voz.md`) e com o contexto real do cliente (leitura da call, proposta).

## A resposta a uma objeção, em 4 passos

Use sempre esta estrutura, adaptada à voz dela:

1. **Acolher:** reconhecer sem discutir ("faz todo sentido olhar com cuidado").
2. **Perguntar o que está por trás:** uma pergunta aberta que revela a objeção real ("o que pesa mais: o valor do mês, o compromisso de 3 meses ou o momento?").
3. **Responder à objeção real:** com informação, alternativa de escopo ou um compromisso concreto da proposta.
4. **Convidar ao próximo passo:** uma pergunta simples ("quer que eu te mostre como fica começando pela opção essencial?").

## Modo 1 — Plano completo (logo depois de enviar)

Leia `5-propostas/[cliente]/proposta.html`, `3-diagnosticos/[cliente]/leitura-da-call.md` e `4-precos/precos.md`.

Monte a tabela com datas reais calculadas a partir do envio:

| Cenário | Sinal | O que fazer | Quando | Mensagem pronta |
|---|---|---|---|---|
| Proposta enviada | — | propor 15 minutos para apresentar | no envio | ✓ |
| Leu e não respondeu | visualizado, sem resposta | lembrete leve com uma pergunta fácil | 2 dias úteis | ✓ |
| Silêncio | nenhuma resposta ao lembrete | enviar algo útil ligado à dor dele, sem cobrar | 5 dias | ✓ |
| "Está caro" | pediu desconto ou achou alto | 4 passos + opção menor | na hora | ✓ |
| "Vou pensar" | adiou | 4 passos: perguntar o que falta e combinar uma data | na hora | ✓ |
| "Preciso falar com [sócio/equipe]" | outra pessoa decide | oferecer resumo de 1 página ou conversa com os dois | até 1 dia | ✓ |
| "Agora não é o momento" | timing | perguntar quando faz sentido e combinar a volta | na hora | ✓ |
| Sumiu | 4 retomadas sem resposta | encerramento com porta aberta | 15 dias | ✓ |
| Disse não | recusou | agradecer e pedir, em uma linha, o que pesou | na hora | ✓ |
| Disse sim | aceitou | contrato → pagamento → reunião de início, em 3 passos | na hora | ✓ |

Use as palavras e o medo que o cliente contou na call. Se ele temia "sumirem", a mensagem de silêncio reforça o compromisso de acompanhamento da proposta.

Grave `5-propostas/[cliente]/depois-da-proposta.md` e:
- em `6-vendas/negocios.csv`: `proxima_acao` e `data_proxima_acao` do primeiro passo;
- regenere `7-painel/dados.js`.

## Modo 2 — Objeção que acabou de chegar

Se ela colar a resposta do cliente:
1. Identifique o cenário e a objeção real provável (pode haver mais de uma).
2. Escreva a resposta pelos 4 passos, em até 6 linhas, e uma versão alternativa mais curta.
3. Diga o próximo passo e a data, e atualize o funil.

## Registrar o desfecho

- **Ganho:** `etapa = ganho`, confirme `valor_mensal`, `meses`, `valor_total` e `fechado_em`. Parabenize com sobriedade e lembre do próximo passo de entrega.
- **Perdido:** `etapa = perdido` e `motivo_perda` (preço, momento, escolheu outra pessoa, sem resposta, pediu para não ser contatado, outro). Esse motivo ensina o próximo ciclo.
- **Nutrir:** `etapa = negociacao` com `data_proxima_acao` na data combinada para voltar.

Registre o contato em `contatos.csv` e regenere `7-painel/dados.js`.
