# Resumo da API REST - Mente Detetive

Base URL local fictícia: `http://localhost:8080/api`

## Autenticação
- `POST /auth/register` - cadastra cliente.
- `POST /auth/login` - autentica e retorna JWT.
- `POST /auth/recover-password` - solicita recuperação de senha.

## Catálogo
- `GET /games` - lista jogos publicados com filtros.
- `GET /games/{id}` - detalha jogo.
- `GET /categories` - lista categorias.

## Carrinho e pedidos
- `POST /cart/items` - adiciona jogo ao carrinho.
- `GET /cart` - consulta carrinho.
- `POST /orders/checkout` - finaliza pedido e inicia pagamento.
- `GET /orders/{id}` - consulta pedido.

## Downloads
- `GET /library` - lista jogos comprados.
- `GET /downloads/{gameId}` - gera URL temporária para baixar PDF adquirido.

## Administração
- `POST /admin/games` - cria jogo em rascunho.
- `POST /admin/games/{id}/file` - envia PDF do jogo.
- `PATCH /admin/games/{id}/publish` - publica jogo.
- `GET /admin/reports/sales` - relatório de vendas.
