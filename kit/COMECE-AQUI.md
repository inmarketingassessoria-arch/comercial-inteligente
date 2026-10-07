# Comercial Inteligente

**O seu departamento comercial de IA, funcionando no seu computador.**

Este kit transforma o Claude em um time comercial que trabalha com método. Ele encontra empresas que precisam do que você vende, pesquisa cada uma, escreve as mensagens no seu jeito de falar, ajuda você a conduzir a conversa, calcula o seu preço, monta a proposta, lembra quem precisa de retorno e mostra o dinheiro entrando num painel.

A IA executa e mostra o raciocínio. Você aprova, decide e conversa com o cliente. É método aplicado ao seu negócio, caso a caso.

---

## O método em 4 fases

| Fase | O que acontece | Comando |
|---|---|---|
| **1. Clareza** | Eu te entrevisto e organizo a sua oferta, o seu cliente ideal e os critérios de um bom lead | `/raio-x-do-negocio` |
| **2. Prospecção ativa** | Encontro empresas reais do seu nicho, dou nota para cada uma e pesquiso as melhores a fundo | `/mapa-de-leads` · `/investigar-lead` |
| **3. Conversa** | Escrevo a primeira mensagem na sua voz, as retomadas e o roteiro da sua call | `/primeira-conversa` · `/call-de-diagnostico` |
| **4. Fechamento** | Calculo o seu preço, monto a proposta e preparo a resposta para cada objeção | `/preco-com-clareza` · `/proposta-sob-medida` · `/depois-da-proposta` |
| **Gestão** | Painel com funil e financeiro, e um ritual de 20 minutos por semana | `/painel-de-vendas` · `/ritual-semanal` |

Perdeu o fio? Digite **`/comercial-inteligente`** e eu mostro onde você está e qual é o próximo passo.

---

## Primeiros passos (30 minutos)

1. **Instale:** siga `material-de-apoio/01-guia-de-instalacao.md`.
2. **Abra esta pasta no Claude Code** (no app do Claude, aba Code, ou no VS Code).
3. **Digite:** `/comercial-inteligente`
4. **Responda ao raio-x do negócio.** Quanto mais contexto, melhor tudo o que vem depois.
5. **Crie a sua chave do Apify** e cole no arquivo `.env` (o guia mostra como; nunca no chat).
6. **Rode o seu primeiro mapa de leads.**

Antes de começar, se puder, coloque na pasta `0-meu-negocio/`: o seu logo, uma proposta antiga, a sua tabela de preços e 2 ou 3 prints de conversas reais com clientes.

---

## Os combinados do sistema

- **Você envia, o Claude escreve.** Nenhuma mensagem sai sem você.
- **Evidência antes de opinião.** Todo dado sobre um lead tem fonte e data. O que é dedução aparece como leitura.
- **Nada inventado.** Sem número, depoimento ou resultado que não exista.
- **Respeito ao lead.** A primeira mensagem aponta uma oportunidade, oferece algo útil e deixa a pessoa livre para dizer não.
- **Tudo fica no seu computador.** A chave do Apify mora no `.env` e nunca aparece na conversa.

---

## O que tem nesta pasta

```
0-meu-negocio/      quem você é, o seu cliente ideal, a sua voz, os seus números
1-leads/            lista de leads, ranking e fichas de investigação
2-conversas/        mensagens prontas para cada lead
3-diagnosticos/     roteiros e leituras das calls
4-precos/           a conta do seu preço e o simulador
5-propostas/        uma pasta por cliente
6-vendas/           as planilhas do funil e do financeiro
7-painel/           o painel de vendas
material-de-apoio/  guias, prompts, checklists e dúvidas comuns
```

**Material de apoio:**
1. `01-guia-de-instalacao.md` — do zero ao primeiro comando
2. `02-biblioteca-de-prompts.md` — todos os pedidos do método, prontos para copiar
3. `03-workbook.md` — perguntas para pensar antes do raio-x
4. `04-checklists.md` — o que conferir antes de cada etapa
5. `05-glossario.md` — as palavras do método, sem tecniquês
6. `06-duvidas-e-erros-comuns.md` — quando algo não funciona

---

Comercial Inteligente · por **Bia Siqueira** · Marketing Estratégico & IA
Uso individual. Veja `LICENCA.md`.
