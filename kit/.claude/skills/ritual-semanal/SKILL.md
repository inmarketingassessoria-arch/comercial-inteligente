---
name: ritual-semanal
description: Revisão comercial de 20 minutos, uma vez por semana — mostra o placar do mês, registra o que aconteceu, prepara as mensagens de quem precisa de retorno na voz da empresária, escolhe os próximos leads para abastecer o funil, calcula quanto falta para a meta e entrega o plano da semana dia a dia. Use quando ela disser "ritual semanal", "revisão da semana", "plano da semana", "o que eu faço essa semana", "segunda-feira" ou "o que está pendente".
---

# Ritual semanal

O sistema só funciona se for usado toda semana. Este ritual leva cerca de 20 minutos e termina com um plano claro. Recomende sempre o mesmo dia e horário (por exemplo, segunda às 9h).

## Bloco 1 — Placar (2 min)

Leia `6-vendas/*.csv` (se a pasta do painel estiver conectada, as planilhas já refletem o que ela mudou lá). Mostre:
- faturamento do mês, meta e quanto falta;
- sobra do mês (entradas menos despesas);
- valor na mesa (propostas e negociações abertas);
- quantos negócios em cada etapa;
- **quantos fechamentos faltam para a meta**: (meta − faturamento) ÷ ticket médio, arredondado para cima. Se não houver ticket médio, use o preço-alvo de `4-precos/precos.md`.

## Bloco 2 — O que aconteceu (5 min)

Compare `ultimo_contato` e etapas com o que estava pendente. Pergunte **só o que as planilhas não mostram**, uma pergunta por vez:
- alguém respondeu, fechou ou disse não e ainda não foi registrado?
- alguma call aconteceu? (se sim, ofereça `/call-de-diagnostico` no modo depois da call)
- teve despesa nova?

Se ela disser "está tudo atualizado no painel", não pergunte nada: siga.

Atualize as planilhas com as respostas.

## Bloco 3 — Quem precisa de retorno (5 min)

Liste os negócios abertos com `data_proxima_acao` até o fim desta semana. Para cada um, escreva a mensagem pronta, na voz dela, usando o que já existe em `2-conversas/` e `5-propostas/` (a retomada certa, a resposta à objeção, o encerramento). Respeite o limite de 4 retomadas sem resposta: no limite, a mensagem é de encerramento e o negócio vai para `perdido` com motivo `sem resposta` quando ela enviar.

## Bloco 4 — Abastecer o funil (3 min)

Sugira os próximos leads para a primeira mensagem: classe A, depois B, com `status` `mapeado` ou `investigado`. Quantidade padrão: 5 por semana (ela ajusta). Se restarem menos de 10 leads classe A ou B sem contato, recomende um novo `/mapa-de-leads`. Os que ainda não foram investigados entram no plano com o passo `/investigar-lead` antes da mensagem.

## Bloco 5 — Meta (1 min)

Diga em uma frase se a meta é viável no ritmo atual e o que mudaria o jogo (mais abordagens, apresentar as propostas paradas, oferta de entrada para quem disse "está caro"). Sem drama e sem pressão.

## Bloco 6 — Plano da semana (4 min)

Grave `6-vendas/semanas/semana-AAAA-MM-DD.md` (data da segunda-feira):

```
# Semana de DD/MM a DD/MM

## Placar
## O que mudou desde a última semana
## Plano dia a dia
Segunda — ...
Terça — ...
Quarta — ...
Quinta — ...
Sexta — revisar o painel e devolver ao Claude as mensagens que você editou
## Mensagens prontas (copie e envie)
### [Empresa] — [tipo de mensagem] — enviar em DD/MM
texto
## Leads da semana
## Para a meta
```

Distribua as tarefas para não passar de 30 minutos de comercial por dia, exceto no dia que ela reservar para calls e propostas.

Atualize `data_proxima_acao` dos negócios conforme o plano, rode `bash ferramentas/atualizar-painel.sh` e encerre com: "pronto: plano salvo em `6-vendas/semanas/…`. O primeiro passo de hoje é…".

## Automatizar o lembrete (opcional)

Se ela quiser que o ritual comece sozinho:
- **Claude Desktop → Code → Rotinas → Nova rotina → Local**, escolher a pasta do projeto, horário semanal e a instrução: `rode /ritual-semanal e salve o plano da semana; não envie nenhuma mensagem`. Rotinas locais só rodam com o computador ligado e o app aberto.
- Rotinas na nuvem **não** enxergam os arquivos do computador nem a chave do `.env`, então não servem para este projeto.
- Explique que, mesmo automatizado, o envio das mensagens continua sendo dela.
