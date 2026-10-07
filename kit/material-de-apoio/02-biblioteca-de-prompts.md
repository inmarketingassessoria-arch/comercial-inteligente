# Biblioteca de prompts

Todos os pedidos do método, na ordem em que você usa. Copie, troque o que está entre `[colchetes]` e cole no Claude Code.

**Regra de ouro:** quanto mais contexto no pedido, melhor o resultado. Um pedido preguiçoso gera uma resposta genérica. Um pedido detalhado não precisa ser longo: precisa ser específico.

---

## 0. Começar e se localizar

```
/comercial-inteligente
```

```
/comercial-inteligente onde eu parei e o que faço hoje?
```

---

## 1. Clareza — raio-x do negócio

**Entrevista completa:**
```
/raio-x-do-negocio vamos montar o perfil do meu negócio. me faça as perguntas uma de cada vez
```

**Se você prefere contar tudo de uma vez:**
```
/raio-x-do-negocio vou te contar sobre o meu negócio de uma vez e você me pergunta só o que faltar: [escreva livremente quem você é, o que vende, para quem, por quanto e o que costuma dar errado no seu comercial]
```

**Se você já tem material (site, apresentação, manual da marca) na pasta 0-meu-negocio:**
```
/raio-x-do-negocio leia tudo o que está em 0-meu-negocio antes de me perguntar qualquer coisa e confirme comigo o que você entendeu
```

**Ajustar o cliente ideal depois:**
```
/raio-x-do-negocio quero ajustar o meu cliente ideal: [o que mudou]. atualize os critérios do Índice de Fit e me mostre antes de salvar
```

**Abrir um novo ciclo com outra oferta:**
```
/raio-x-do-negocio quero abrir um ciclo novo para a oferta [nome], que é para um público diferente: [público]. mantenha o ciclo atual salvo
```

---

## 2. Prospecção ativa

### Mapa de leads

**Primeira busca:**
```
/mapa-de-leads quero encontrar até 30 leads para a minha oferta principal, seguindo o meu cliente ideal. me mostre o plano e o custo antes de rodar
```

**Busca com recorte:**
```
/mapa-de-leads busque [termo] nos bairros [bairro 1] e [bairro 2] de [cidade], só negócios com nota a partir de 4 e com pelo menos [número] avaliações. até 20 leads
```

**Só quem não tem site:**
```
/mapa-de-leads busque [termo] em [cidade] apenas negócios sem site cadastrado no Google. até 25 leads
```

**Reabastecer o funil sem repetir leads:**
```
/mapa-de-leads quero mais 20 leads parecidos com os da classe A que eu já tenho, sem repetir ninguém da lista
```

**A lista veio fraca:**
```
/mapa-de-leads a lista não ficou boa porque [motivo]. proponha termos de busca e critérios diferentes antes de rodar de novo
```

### Investigação

```
/investigar-lead investiga os 3 primeiros da classe A
```

```
/investigar-lead investiga o lead [nome ou id] a fundo, incluindo o Instagram
```

```
/investigar-lead quem decide a compra em [nome]? procure no site, no Google e nas respostas às avaliações
```

---

## 3. Conversa

### A sua voz (uma vez, e depois sempre que quiser refinar)

```
/primeira-conversa antes de escrever qualquer mensagem, monte o meu perfil de voz a partir destas mensagens reais que eu já mandei: [cole 2 ou 3 mensagens]
```

```
/primeira-conversa eu editei a mensagem antes de enviar. esta é a versão final: [cole]. atualize o meu perfil de voz com o que aprendeu
```

### Primeira mensagem e retomadas

```
/primeira-conversa escreve a primeira mensagem para [lead] usando a ficha de investigação, em 3 versões, e as retomadas para se ela não responder
```

```
/primeira-conversa reescreve a versão [objetiva/consultiva/calorosa] mais curta e sem emoji
```

```
/primeira-conversa adapta a mensagem para direct do Instagram / para e-mail
```

**Registrar o envio:**
```
enviei a primeira mensagem para [lead] hoje pelo [canal]. registra no funil
```

**O lead respondeu:**
```
/primeira-conversa [lead] respondeu: "[cole a resposta]". o que eu respondo?
```

### Call de diagnóstico

```
/call-de-diagnostico marquei uma call com [lead] para [dia e hora]. prepara o formulário prévio, o roteiro e as mensagens até o dia da call
```

```
/call-de-diagnostico a call com [cliente] aconteceu. a transcrição está em 3-diagnosticos/[pasta]. monte a leitura da call
```

```
/call-de-diagnostico a call com [cliente] aconteceu e eu não gravei. me faça as perguntas para registrar o que ouvi
```

---

## 4. Fechamento

### Preço

```
/preco-com-clareza calcula o meu preço com a conta aberta. use o que você já sabe do meu negócio e me pergunte um número por vez
```

```
/preco-com-clareza o meu negócio é de produto. calcula o preço mínimo, o preço-alvo e o ponto de equilíbrio do [produto]
```

```
/preco-com-clareza monta três pacotes para a minha oferta, com o do meio como recomendado, e confere se todos ficam acima do piso
```

```
/preco-com-clareza mudei números no simulador: [cole o que o botão "Copiar números para o Claude" copiou]
```

```
decidi cobrar R$ [valor] na opção [nome]. registra a decisão
```

### Proposta

```
/proposta-sob-medida monta a proposta para [cliente] a partir da leitura da call, com os três pacotes e a minha identidade visual
```

```
/proposta-sob-medida ajusta a proposta de [cliente]: [o que mudar]
```

```
enviei a proposta para [cliente] e combinamos de conversar [dia]. registra no funil
```

### Depois da proposta

```
/depois-da-proposta monta o que fazer depois de enviar a proposta para [cliente], com as mensagens e as datas
```

```
/depois-da-proposta [cliente] respondeu: "[cole a resposta]". como eu respondo?
```

```
/depois-da-proposta [cliente] fechou na opção [nome] por R$ [valor] por mês, [n] meses. registra
```

```
/depois-da-proposta perdi [cliente] porque [motivo]. registra
```

---

## Gestão

### Painel

```
/painel-de-vendas monta o meu painel com os meus leads, as propostas e as negociações de hoje, os contratos ativos, as despesas e a meta do mês, e abre no navegador
```

**Atualizar conversando:**
```
[cliente] fechou por R$ [valor] por mês, contrato de [n] meses. atualiza o painel
```
```
mandei mensagem para [lead] hoje. marca a próxima retomada
```
```
[lead] pediu para voltar a falar em [mês]. muda a data da próxima ação
```
```
paguei R$ [valor] de [ferramenta] este mês, é recorrente. lança nas despesas
```
```
a minha meta de [mês] é R$ [valor] e [n] clientes novos. atualiza a meta
```

### Ritual semanal

```
/ritual-semanal faz a minha revisão comercial da semana e me entrega o plano dia a dia
```

```
/ritual-semanal está tudo atualizado no painel. só me mostra o placar, as mensagens da semana e o plano
```

---

## Quando algo dá errado

```
deu este erro: [cole o erro]. me explica em português simples o que aconteceu e o que eu faço
```

```
as skills não aparecem quando digito /. verifica se a pasta aberta é a certa
```

```
o painel não está gravando. me ajuda a conectar a pasta
```
