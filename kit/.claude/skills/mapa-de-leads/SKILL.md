---
name: mapa-de-leads
description: Encontra empresas reais do perfil de cliente ideal no Google Maps pelo Apify, aplica os descartes, pontua cada lead pelo Índice de Fit (0 a 100) e entrega a lista ordenada com evidências. Use quando a empresária disser "prospectar", "buscar leads", "encontrar clientes", "lista de empresas", "mapa de leads" ou quiser reabastecer o funil.
---

# Mapa de leads

Você é uma analista de prospecção criteriosa. Transforma o cliente ideal em uma busca real e devolve uma lista em que cada lead tem nota, motivo e evidência. Uma lista sem critério não serve para nada.

## Regras

- Leia `0-meu-negocio/cliente-ideal.md` antes de tudo. Se não existir, pare e indique `/raio-x-do-negocio`.
- **Nunca rode a busca sem aprovação do plano e do teto de gasto.**
- Nunca leia nem mostre o conteúdo do `.env`. Para saber se a chave existe, use apenas `grep -c '^APIFY_TOKEN=.\+' .env`.
- Evidência antes de opinião: cada sinal registrado tem origem (Maps, site, avaliação de AAAA-MM-DD).
- Não descarte nem pontue com base em suposição. Sem dado → "não encontrado" e pontuação zero naquele critério.
- Não complete a quantidade pedida com leads que não passam nos descartes. Entregue menos e explique.

## Etapa 0 — Preparar

1. Confirme que a chave está preenchida (comando acima). Se não estiver, oriente: "abra o arquivo `.env` na pasta do projeto, cole a sua chave do Apify logo depois de `APIFY_TOKEN=` e salve. Não cole a chave aqui no chat." O passo a passo está em `material-de-apoio/01-guia-de-instalacao.md`.
2. Se `1-leads/leads.csv` já tiver leads, leia para evitar duplicatas e para continuar a numeração dos `id`.

## Etapa 1 — Plano de busca (apresente e peça aprovação)

Monte e mostre:

- **Oferta deste ciclo:** (do perfil do negócio)
- **Termos de busca:** os do cliente ideal (máximo 5 por execução; termos muito parecidos desperdiçam crédito)
- **Local:** cidade, estado, país (ex.: `Campinas, SP, Brazil`). Para cidades grandes, proponha dividir por bairros, um termo por bairro.
- **Quantidade por termo:** padrão 15 (total recomendado para o primeiro ciclo: 30 a 50)
- **O que vem junto:** contatos do site, até 5 avaliações recentes por empresa
- **Custo estimado:** use como referência US$ 0,01 a US$ 0,02 por empresa com contatos e avaliações, e deixe claro que é estimativa. O plano sem custo do Apify costuma oferecer um crédito mensal; ela confere o saldo em *Billing* no site do Apify.
- **Teto de gasto desta execução:** proponha um valor (ex.: US$ 1,00). O script interrompe a busca se o teto for atingido.

Pergunte: "Posso rodar esse plano ou quer mudar algo?"

## Etapa 2 — Rodar a busca

Grave a entrada aprovada em `1-leads/busca/entrada-maps-AAAA-MM-DD.json`:

```json
{
  "searchStringsArray": ["termo 1", "termo 2"],
  "locationQuery": "Cidade, UF, Brazil",
  "maxCrawledPlacesPerSearch": 15,
  "language": "pt-BR",
  "skipClosedPlaces": true,
  "scrapePlaceDetailPage": true,
  "scrapeContacts": true,
  "maxReviews": 5,
  "reviewsSort": "newest",
  "scrapeReviewsPersonalData": false,
  "maxImages": 0,
  "maximumLeadsEnrichmentRecords": 0
}
```

Opcionais, só se ela pedir: `"website": "withoutWebsite"` (apenas quem não tem site) ou `"withWebsite"`; `"placeMinimumStars": "four"` (nota mínima 4).

Rode:

```bash
bash ferramentas/apify.sh maps 1-leads/busca/entrada-maps-AAAA-MM-DD.json 1-leads/busca/resultado-maps-AAAA-MM-DD.json 1.00
```

(o último número é o teto aprovado). A busca leva de 1 a 10 minutos. Se o script der erro, explique em português simples e siga `material-de-apoio/06-duvidas-e-erros-comuns.md`.

## Etapa 3 — Ler e limpar

O resultado é uma lista de empresas. Campos úteis: `title`, `categoryName`, `address`, `city`, `neighborhood` (se houver), `phone`, `website`, `emails`, `instagrams`, `totalScore`, `reviewsCount`, `url`, `permanentlyClosed`, `temporarilyClosed`, `placeId`, `reviews` (com `publishedAtDate`, `stars`, `text`, `responseFromOwnerText`).

O arquivo pode ser grande. Se `python3` estiver disponível, você pode usar um script temporário para extrair só esses campos; se não, leia em partes.

1. Remova duplicatas (mesmo `placeId`, mesmo telefone ou mesmo nome + endereço) e quem já está no `leads.csv`.
2. Aplique os **descartes** do cliente ideal. Guarde os descartados com o motivo (vão para o CSV com `classe = descartado`).
3. Para cada lead restante, levante os **sinais observados**: lista de fatos curtos com origem. Exemplos:
   - "Maps: sem site cadastrado"
   - "Avaliação de 2026-08-14 (2★) cita demora para responder no WhatsApp"
   - "Site no ar, sem botão de agendamento (visto em AAAA-MM-DD)" (só se você abriu o site)
   - "4,9★ com 212 avaliações; dono responde às avaliações"

   Você pode abrir o site do lead para conferir um sinal; anote a data. Não abra o Instagram nesta etapa (fica para a investigação).

## Etapa 4 — Pontuar (Índice de Fit)

1. Mostre a régua aprovada em `cliente-ideal.md` e confirme: "vou pontuar com esta régua, ok?".
2. Para cada lead, calcule a nota de cada dimensão (cheia, metade ou zero, conforme a régua) e some, de 0 a 100.
3. Classe: **A** (70–100), **B** (50–69), **C** (abaixo de 50).
4. Escreva a `leitura`: uma frase de hipótese sobre a oportunidade, marcada como leitura. Ex.: "Leitura (confiança média): a procura existe, mas o caminho até o agendamento depende de mensagem manual."

## Etapa 5 — Gravar

**`1-leads/leads.csv`**: acrescente os leads no formato do `CLAUDE.md` (seção 5). `status = mapeado` (ou `descartado`), `fonte = Apify Google Maps`, `coletado_em = data de hoje`. Em `evidencias`, junte os sinais com ` | `.

**`1-leads/ranking.md`**: os leads classe A e B, em ordem de nota, com: nome, categoria, bairro, nota, os 2 sinais mais fortes, a leitura e o contato disponível. Ao final: quantos vieram da busca, quantos foram descartados e por quê, custo informado pelo Apify.

## Etapa 6 — Fechar

Mostre o top 5 e pergunte:
- "Faz sentido para o seu negócio? Quer ajustar algum critério?"
- Se a lista vier fraca, proponha ajustes: termos diferentes, outro bairro, critério mais ou menos rígido.

Próximo passo: `/investigar-lead investiga os 3 primeiros da classe A`.
