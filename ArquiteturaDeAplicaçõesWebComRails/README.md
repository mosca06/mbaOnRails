# Arquitetura de Aplicações Web com Rails

Este é um projeto desenvolvido como parte da disciplina "Arquitetura de Aplicações Web com Rails" do MBA. O objetivo é criar uma aplicação web funcional utilizando Ruby on Rails, aplicando os conceitos aprendidos durante as aulas para garantir boas práticas e uma estrutura organizada.

A aplicação é um CRUD básico para gerenciamento de contos, textos que remetem a memórias e histórias importantes.

---

## 📦 Tecnologias Utilizadas

- Ruby 3.4.x  
- Ruby on Rails 7.x  
- PostgreSQL  
- Redis (para futuras melhorias, ex: Sidekiq)  
- Dev Container (para ambiente de desenvolvimento padronizado)  

---

## 🚀 Como rodar o projeto localmente

```bash
# Clone o repositório
git clone https://github.com/mosca06/mbaOnRails.git
cd "Arquitetura de Aplicações Web com Rails"

# Abra o VSCode na pasta do projeto
code .

# Caso use Dev Container, aceite abrir o projeto no container

# Prepare o banco de dados
rails db:create
rails db:migrate

# Inicie o servidor
rails server

Acesse a aplicação no navegador em http://localhost:3000/stories

✅ Funcionalidades implementadas
CRUD completo para contos (criar, listar, editar, excluir)

Filtro para listar contos publicados e não publicados

Validação de campos no formulário (ex: corpo do conto mínimo 20 caracteres)

Publicação de contos via botão específico

Renderização das views usando Decorator para organizar apresentação

🧠 Conceitos aplicados
Form Object
Utilizado para encapsular a lógica de validação e criação de novos contos, separando responsabilidades do model principal e facilitando testes e manutenção. No projeto, StoryForm é responsável por validar título e corpo antes de criar um novo registro.

Decorator
Aplicado para organizar a lógica de apresentação dos contos, mantendo as views limpas. A classe StoryDecorator encapsula métodos para formatar a exibição dos dados, deixando o código mais modular.

Concern
Utilizado para compartilhar funcionalidades comuns entre models, no caso, o módulo de busca (Searchable) que pode ser reaproveitado facilmente em outros modelos além de Story.

Query Object
Implementado para separar a construção das consultas ao banco, facilitando a manutenção e a extensão das regras de busca e filtro. O StoryQuery recebe parâmetros e retorna os contos filtrados conforme a necessidade (por exemplo, filtrar por status de publicação).

Service Object
Aplicado para encapsular regras de negócio específicas, como a publicação de um conto. O StoryPublisher centraliza essa funcionalidade, deixando os controllers mais enxutos e o código mais organizado.

📌 Considerações finais
Este projeto foi desenvolvido com foco em aplicar padrões de arquitetura e boas práticas em Ruby on Rails, visando um código limpo, testável e fácil de manter. Além disso, a aplicação guarda contos que remetem a histórias importantes e lembranças da infância, valorizando a simplicidade e a organização.

