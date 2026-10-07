# Comercial Inteligente — repositório-mestre

Produto da Bia Siqueira: um kit de skills do Claude Code que monta o sistema comercial da mentorada, da prospecção ativa até a venda.

Este repositório é **a versão-mestre**. Aqui você edita, testa e gera o ZIP que vai para as mentoradas. As mentoradas nunca recebem esta pasta inteira, só o ZIP gerado a partir de `kit/`.

## Estrutura

```
comercial-inteligente/
├── README.md              este guia (só para a Bia)
├── CHANGELOG.md           o que mudou em cada versão
├── kit/                   TUDO o que vai para a mentorada
│   ├── COMECE-AQUI.md     a porta de entrada
│   ├── CLAUDE.md          as regras do sistema
│   ├── LICENCA.md         licença individual de uso
│   ├── .claude/skills/    as 11 skills
│   ├── .claude/settings.json  permissões (bloqueia leitura do .env)
│   ├── ferramentas/       apify.sh e atualizar-painel.sh
│   ├── modelos/           painel, simulador de preço e proposta (HTML)
│   ├── material-de-apoio/ 6 guias
│   └── 0-… a 7-…          pastas de trabalho (vazias, com instruções)
├── scripts/gerar-kit.sh   gera dist/comercial-inteligente-v<versão>.zip
├── bia/                   material interno do workshop (só no computador da Bia, fora do GitHub)
└── dist/                  ZIPs gerados (não versionar)
```

## As 11 skills

| Fase | Skill | Entrega |
|---|---|---|
| — | `/comercial-inteligente` | painel de bordo: onde a mentorada está e o próximo passo |
| 1. Clareza | `/raio-x-do-negocio` | perfil, oferta, cliente ideal, Índice de Fit, números, identidade |
| 2. Prospecção ativa | `/mapa-de-leads` | busca no Google Maps (Apify) + Índice de Fit 0–100 + ranking |
| | `/investigar-lead` | ficha com evidência × leitura, quem decide, momento, ângulos |
| 3. Conversa | `/primeira-conversa` | perfil de voz (5 pilares), mensagem P.O.N.T.E. em 3 versões, retomadas, respostas rápidas |
| | `/call-de-diagnostico` | formulário prévio, roteiro, mensagens até a call, leitura da call |
| 4. Fechamento | `/preco-com-clareza` | piso, preço-alvo, cenários, capacidade × meta, pacotes (serviço ou produto) + simulador |
| | `/proposta-sob-medida` | proposta HTML → PDF, 10 seções, identidade da mentorada |
| | `/depois-da-proposta` | matriz de cenários + resposta a objeção em 4 passos |
| Gestão | `/painel-de-vendas` | painel local que lê e grava as planilhas |
| | `/ritual-semanal` | revisão de 20 minutos + plano da semana |

## Como gerar o kit para entregar

```bash
bash scripts/gerar-kit.sh 1.0.0
```

O script copia `kit/`, limpa planilhas e dados de teste, remove qualquer `.env`, confere se não sobrou nenhuma chave do Apify e gera `dist/comercial-inteligente-v1.0.0.zip`. Entregue esse ZIP (Google Drive, área de membros ou e-mail).

## Como testar antes de entregar

1. Gere o ZIP e descompacte numa pasta de teste (fora deste repositório).
2. Abra a pasta descompactada no Claude Code e rode o percurso inteiro com um negócio fictício ou real: `/comercial-inteligente` → raio-x → mapa (busca pequena, teto US$ 0,30) → investigação → mensagem → call (com uma transcrição de teste) → preço → proposta → depois da proposta → painel → ritual.
3. Anote o que travou e corrija aqui em `kit/`. Registre no `CHANGELOG.md`.

## Como atualizar uma skill

Edite o `SKILL.md` em `kit/.claude/skills/<nome>/`. Regras para manter a qualidade:
- a primeira linha `description` diz **quando** a skill é usada; o Claude escolhe a skill por ela;
- toda skill termina dizendo o que foi salvo e o próximo passo;
- nada que dependa de dados inventados; o que falta, a skill pergunta;
- mantenha os nomes das pastas e os cabeçalhos das planilhas do `CLAUDE.md` (seção 5): o painel depende deles.

## Versionamento (git)

O repositório foi iniciado localmente. Sugestão de rotina:
- um commit por mudança (`feat:`, `fix:`, `docs:`);
- uma tag por versão entregue (`v1.0.0`);
- `dist/` fica fora do git.

Este repositório é público no GitHub: qualquer pessoa com o link (ou que o encontre na busca) pode ver e baixar. O uso continua regido pela `kit/LICENCA.md`. Se no futuro o kit virar produto exclusivo, mude a visibilidade para privada em Settings → General → Danger Zone.

## Originalidade

O método, os nomes (P.O.N.T.E., Índice de Fit, prova do recorte, ritual semanal), os textos e os modelos deste kit são próprios da marca Bia Siqueira. Mantenha assim: ao evoluir o produto, escreva com as suas palavras e os seus exemplos.
