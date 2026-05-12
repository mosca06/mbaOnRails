


## 🏭 A História da Fábrica Inteligente

Imagine uma grande fábrica de automóveis.

Todos os dias, máquinas podem apresentar diferentes tipos de problemas:

* Curto-circuito
* Vazamento de água
* Falha mecânica

O gerente da fábrica tem uma responsabilidade principal:

> Garantir que qualquer problema seja resolvido.

### 👨‍🏭 Versão sem Factory Pattern

No início, o gerente faz tudo sozinho.

Quando um problema acontece, ele precisa decidir:

* Se for elétrico, chamar o eletricista.
* Se for hidráulico, chamar o encanador.
* Se for mecânico, chamar o mecânico.

O gerente conhece todos os profissionais e precisa tomar essa decisão manualmente.

```text
Gerente:
- "Se o problema for elétrico, chame o eletricista."
- "Se for hidráulico, chame o encanador."
- "Se for mecânico, chame o mecânico."
```

Com o tempo, isso se torna cansativo.

Sempre que um novo profissional é contratado, o gerente precisa aprender quando chamá-lo.

---

## 🏢 Criando um Departamento Especializado

Para simplificar, a fábrica cria um novo departamento:

> Departamento de Seleção de Especialistas.

A única responsabilidade desse departamento é:

* Receber o tipo do problema.
* Escolher o profissional adequado.
* Enviar o especialista ao gerente.

Agora o gerente não precisa mais conhecer todos os profissionais.

Ele apenas diz:

> "Preciso de um especialista em elétrica."

O departamento responde:

> "Aqui está o eletricista."

---

## 👨‍🏭 Novo Trabalho do Gerente

O gerente passa a ter um trabalho muito mais simples:

1. Detectar o problema.
2. Pedir um especialista ao departamento.
3. Acompanhar o conserto.
4. Encerrar a ocorrência.

---

## 👷 Profissionais

Cada profissional continua sabendo fazer seu trabalho:

* Eletricista → conserta a parte elétrica.
* Encanador → conserta o encanamento.
* Mecânico → conserta a parte mecânica.

---

## 🗂️ Correspondência com o Código

### Gerente

`Factory`

### Departamento de Seleção

`WorkerFactory`

### Profissionais

* `Electrician`
* `Plumber`
* `Mechanic`

### Profissional genérico

`Worker`

---

## 🔄 Fluxo da Aplicação

1. O gerente detecta um problema elétrico.
2. O gerente chama `WorkerFactory.create(:electrical)`.
3. O departamento seleciona `Electrician`.
4. O eletricista é enviado.
5. O eletricista executa `fix_problem`.
6. O gerente finaliza o atendimento.

---

## 💡 Moral da História

O gerente deve gerenciar.

Os profissionais devem executar o trabalho.

O departamento especializado deve decidir quem será enviado.

Cada parte tem uma única responsabilidade.

---

## 📈 Vantagens

1. Responsabilidade Separada: 
A classe principal (Factory) não precisa saber como criar cada trabalhador.

2. Código Mais Organizado: 
Toda a lógica de criação fica em um único lugar.

3. Facilita Adicionar Novos Tipos -
Para adicionar um Pintor basta:

Criar painter.rb
Adicionar ao WORKERS

Sem alterar a lógica principal.

4. Menor Acoplamento
A classe principal não depende diretamente de todas as classes concretas.

5. Mais Fácil de Testar
Você pode testar a lógica de criação separadamente.

## 📉 Desvantagens

1. Mais Arquivos

Você adiciona uma classe extra (WorkerFactory).

2. Pode Ser Overengineering

Em sistemas muito pequenos, um simples case pode ser suficiente.

3. Camada Adicional

O fluxo ganha um passo a mais:

Classe principal → fábrica → objeto.


Quando usar:
1- Existem vários tipos de objetos com a mesma "funçao".
2- A lógica de criação pode crescer.
3- Você quer centralizar a criação.
4- Novos tipos serão adicionados com frequência.
5- A classe principal está ficando cheia de if/elsif ou case.

Quando Não Usar
1- Poucas classes acaba ficando um "overengineering"
2- Não há expectativa de expansão.


## 🧠 Frase para Memorizar

> O Factory Pattern cria um departamento especializado cuja única função é decidir qual profissional deve ser chamado.
