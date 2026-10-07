# Dúvidas e erros comuns

Antes de tudo: problemas acontecem, e quase sempre o próprio Claude ajuda a resolver. Cole o erro e peça: "me explica em português simples o que aconteceu e o que eu faço".

## Instalação

**As skills não aparecem quando digito `/`.**
- Confira se você abriu a **pasta principal** do kit (a que tem o `CLAUDE.md`), e não uma pasta acima ou abaixo dela.
- Feche o Claude Code e abra de novo. As skills são lidas quando a sessão começa.
- Confira se a pasta `.claude/skills/` está dentro do kit. Ela é oculta: no Mac, Cmd+Shift+. no Finder; no Windows, ative "Itens ocultos".

**O Claude pede permissão o tempo todo.**
É o modo seguro, recomendado no começo. Para os scripts do kit (busca e painel), as permissões já vêm liberadas no arquivo `.claude/settings.json`.

## Busca no Apify

**"o Apify recusou a chave (código 401 ou 403)"**
A chave está errada ou incompleta. Copie de novo em Settings → API & Integrations e cole no `.env`, logo depois de `APIFY_TOKEN=`, sem espaço e sem aspas. Salve o arquivo.

**"arquivo .env não encontrado" ou "a linha APIFY_TOKEN= está vazia"**
Peça: "crie o .env a partir do .env.exemplo e abra para eu colar a chave". Cole e **salve** (Cmd+S ou Ctrl+S).

**"sem saldo no Apify (código 402)"**
O crédito do mês acabou. Confira em Billing no site do Apify. Você pode esperar o próximo ciclo ou adicionar crédito.

**A busca terminou com status TIMED-OUT ou ABORTED.**
Provavelmente o teto de gasto foi atingido ou a busca ficou grande demais. Peça uma busca menor (menos termos ou menos empresas por termo).

**Vieram poucos leads ou leads ruins.**
Peça: "/mapa-de-leads a lista não ficou boa porque [motivo]. proponha termos e critérios diferentes". Termos muito genéricos trazem gente fora do perfil; descartes muito rígidos esvaziam a lista.

**"curl não está disponível" (Windows).**
Instale o Git for Windows (git-scm.com) e reinicie o Claude Code.

## Mensagens

**A mensagem não soa como eu.**
Mande mais exemplos reais: "atualize o meu perfil de voz com estas mensagens: [cole]". Sempre que editar uma mensagem antes de enviar, devolva a versão final ao Claude.

**A mensagem ficou genérica.**
Faça a prova do recorte e peça: "use outro ângulo da ficha de investigação, mais específico deste lead".

**Posso automatizar o envio?**
O kit não envia mensagens, de propósito: a primeira conversa funciona melhor com você. Automação de envio exige integrações oficiais (por exemplo, a API do WhatsApp Business), com configuração e regras próprias.

## Painel

**O painel não grava o que eu mudo.**
Abra no **Chrome ou no Edge** e clique em "Conectar pasta do projeto", escolhendo a pasta principal do kit. No Safari e no Firefox o painel só lê. Alternativa: "Copiar alterações para o Claude" e colar no Claude Code.

**O painel está vazio.**
Peça: "/painel-de-vendas atualiza o painel". Ele relê as planilhas.

**Abri as planilhas no Excel e o painel bagunçou.**
Ao salvar, o Excel pode trocar vírgulas por ponto e vírgula ou mudar datas. Prefira editar pelo painel ou contando ao Claude. Se aconteceu, peça: "confere o formato das planilhas de 6-vendas e corrige".

## Preço e proposta

**O simulador perdeu os meus números.**
O simulador não grava sozinho. Use "Copiar números para o Claude" e cole no Claude Code para salvar.

**A proposta saiu sem as minhas cores.**
Coloque o logo (PNG) em `0-meu-negocio/` e informe as cores (códigos como `#7B2D3A`). Peça: "aplica a minha identidade visual na proposta de [cliente]".

**O PDF saiu sem as cores de fundo.**
Na janela de impressão, marque "gráficos de fundo" (ou "imprimir planos de fundo").

## Uso do Claude

**A conversa ficou lenta ou confusa.**
Comece uma conversa nova com `/clear`. Tudo o que foi feito está salvo nos arquivos e o Claude relê as regras.

**Acabou o meu limite de uso.**
O limite se renova em algumas horas. Para economizar: uma conversa por tarefa, o modelo mais rápido para tarefas simples e buscas menores.
