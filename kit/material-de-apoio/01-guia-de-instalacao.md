# Guia de instalação

Do zero ao primeiro comando. Leva de 20 a 30 minutos na primeira vez.

## O que você precisa

| Item | Detalhe |
|---|---|
| Computador | Mac ou Windows. Não funciona pelo celular |
| Plano pago do Claude | Pro ou superior. O Claude Code não está disponível no plano sem custo |
| Conta no Apify | Para a busca de empresas. Tem um plano inicial sem custo, com crédito mensal |
| Navegador Chrome ou Edge | Para o painel gravar nas planilhas |

## Passo 1 — Instalar o Claude Code

Escolha **um** dos dois caminhos.

**Caminho A: app do Claude (mais simples)**
1. Baixe o app do Claude para computador em claude.ai/download e entre na sua conta.
2. Abra a aba **Code**.

**Caminho B: VS Code (você vê os arquivos nascendo ao lado da conversa)**
1. Instale o VS Code (code.visualstudio.com).
2. Abra a aba de extensões (Cmd+Shift+X no Mac, Ctrl+Shift+X no Windows), busque **Claude Code** (da Anthropic) e instale.
3. Clique no ícone do Claude na barra lateral e entre na sua conta.

**No Windows:** o Claude Code usa o Git Bash para rodar comandos. Se ele pedir, instale o Git for Windows (git-scm.com) e reinicie.

## Passo 2 — Colocar a pasta do kit no lugar

1. Descompacte o arquivo `.zip` do Comercial Inteligente.
2. Mova a pasta `meu-comercial-inteligente` para **Documentos**. Evite deixar na pasta Downloads ou na Área de Trabalho sincronizada.
3. Se quiser mudar o nome da pasta, mude agora. Depois de começar, mantenha o nome.

## Passo 3 — Abrir a pasta no Claude Code

- **App do Claude:** na aba Code, inicie uma sessão nova, clique em **Abrir pasta** e escolha `meu-comercial-inteligente`. Confie na pasta quando ele perguntar.
- **VS Code:** **File → Open Folder** e escolha `meu-comercial-inteligente`. Abra o Claude Code.

Importante: abra a **pasta principal** (a que tem o arquivo `CLAUDE.md`), não uma subpasta.

**Teste:** digite `/` e procure `comercial-inteligente` na lista. Não apareceu? Feche e abra o Claude Code (as skills são lidas ao abrir uma sessão).

## Passo 4 — O primeiro comando

Digite:

```
/comercial-inteligente
```

Ele mostra o mapa do método e começa o raio-x do seu negócio.

## Passo 5 — A chave do Apify

O Apify é a ferramenta que entra no Google Maps e traz as empresas organizadas. O Claude conversa com ele usando uma chave que é só sua.

1. Entre em **apify.com** e crie a sua conta (dá para entrar com o Google).
2. No painel do Apify, vá em **Settings → API & Integrations** e copie o seu **Personal API token**.
3. No Claude Code, peça:
   ```
   crie o arquivo .env a partir do .env.exemplo e abra para eu colar a minha chave do Apify. não me peça a chave no chat
   ```
4. No arquivo que abrir, cole a chave logo depois de `APIFY_TOKEN=`, sem espaço e sem aspas. Salve (Cmd+S ou Ctrl+S) e feche.

Se o arquivo não abrir sozinho: ele está na pasta do kit com o nome `.env`. No Mac, arquivos que começam com ponto ficam ocultos; aperte **Cmd+Shift+.** no Finder para vê-los. No Windows, ative "Itens ocultos" na aba Exibir.

**Regras da chave:**
- Nunca cole a chave no chat, em print ou em outro arquivo.
- Quem tem a chave gasta o seu crédito. Se ela vazar, crie outra no Apify e apague a antiga.

**Quanto custa:** uma busca de 30 a 50 empresas, com contatos e 5 avaliações cada, costuma custar de US$ 0,50 a US$ 1,00. Antes de toda busca o Claude mostra a estimativa e pede o seu ok, e cada busca tem um teto de gasto. Confira o seu saldo em **Billing** no site do Apify.

## Passo 6 — Dicas para o dia a dia

- **Uma tarefa, uma conversa.** Ao trocar de etapa, comece uma conversa nova (`/clear`). Nada se perde: tudo fica nos arquivos.
- **Modelo:** no plano Pro, use o modelo mais rápido para tarefas de rotina e o mais capaz para o raio-x, o preço e a proposta.
- **Permissões:** no começo, deixe o Claude pedir permissão antes de agir e leia o que ele vai fazer antes de aprovar.
- **Travou?** Veja `06-duvidas-e-erros-comuns.md` ou pergunte ao próprio Claude: "deu este erro, o que eu faço?".
