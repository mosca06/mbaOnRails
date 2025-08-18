Blackjack DSL - Projeto Ruby on Rails

1. Propósito do Projeto

Este projeto implementa um jogo de Blackjack utilizando Ruby on Rails, com foco em:

Criar uma DSL (Domain Specific Language) para manipular o jogo de forma intuitiva (deal, hit, stand, winner_is).

Demonstrar uso de Ruby idiomático, incluindo Enumerable e blocos.

Permitir interações via API.

Aplicar concorrência/paralelismo simples usando Threads, permitindo registrar movimentos do jogador em paralelo sem bloquear a API.

2. Endpoints da API

Criar jogo:

curl -X POST http://localhost:3000/games \
     -H "Content-Type: application/json"


Ver jogo existente:

curl -X GET http://localhost:3000/games/:id \
     -H "Content-Type: application/json"


Movimento (hit ou stand):

curl -X POST http://localhost:3000/games/:id/move \
     -H "Content-Type: application/json" \
     -d '{"move_type":"hit"}'


ou

curl -X POST http://localhost:3000/games/:id/move \
     -H "Content-Type: application/json" \
     -d '{"move_type":"stand"}'

