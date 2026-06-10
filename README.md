<div align="center">
  <img src="assets/logo.svg" alt="Logo Mente Detetive" width="160"/>

# 🕵️ Mente Detetive

**Sistema web para venda e distribuição segura de PDFs de jogos de investigação.**

![Versão](https://img.shields.io/badge/Versão-v1.0.0-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Projeto%20Acadêmico-orange?style=for-the-badge)
![Java](https://img.shields.io/badge/Java-17-007ec6?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.3.x-007ec6?style=for-the-badge&logo=springboot&logoColor=white)
![React](https://img.shields.io/badge/React-18-007ec6?style=for-the-badge&logo=react&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-007ec6?style=for-the-badge&logo=postgresql&logoColor=white)
![PlantUML](https://img.shields.io/badge/PlantUML-Diagramas-007ec6?style=for-the-badge)
</div>

---

## 📚 Índice

- [Links Úteis](#-links-úteis)
- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades Principais](#-funcionalidades-principais)
- [Regras de Negócio](#-regras-de-negócio)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Arquitetura](#-arquitetura)
- [Diagramas PlantUML](#-diagramas-plantuml)
- [Instalação e Execução](#-instalação-e-execução)
- [Deploy](#-deploy)
- [Estrutura de Pastas](#-estrutura-de-pastas)
- [Testes](#-testes)
- [Documentações utilizadas](#-documentações-utilizadas)
- [Autor](#-autor)
- [Licença](#-licença)

---

## 🔗 Links Úteis

* 🌐 **Demo Online:** `<link-da-demo-web>`
* 📖 **Documentação do Projeto:** [`docs/documentacao-projeto-mente-detetive.docx`](docs/documentacao-projeto-mente-detetive.docx)
* 🧩 **Diagramas PlantUML:** [`docs/plantuml`](docs/plantuml)
* 🗄️ **Modelo SQL:** [`docs/database/schema.sql`](docs/database/schema.sql)
* 📘 **Resumo da API:** [`docs/api/openapi-resumo.md`](docs/api/openapi-resumo.md)
* 🗃️ **Repositório GitHub:** `<URL_DO_REPOSITORIO>`

---

## 📝 Sobre o Projeto

O **Mente Detetive** é um projeto acadêmico de Engenharia de Software voltado à modelagem de uma aplicação web para comercialização de **PDFs de jogos de investigação**. A proposta é permitir que clientes encontrem jogos narrativos, adicionem produtos digitais ao carrinho, realizem pagamento e recebam acesso seguro ao download do PDF adquirido.

O sistema atende autores e administradores que desejam publicar jogos digitais de investigação, controlar catálogo, acompanhar vendas e gerenciar arquivos PDF de forma organizada. Para os clientes, a plataforma centraliza a experiência de compra e mantém uma biblioteca pessoal com os jogos comprados.

Este repositório contém apenas a **documentação de projeto, arquitetura e diagramas**, conforme solicitado na disciplina. Não há necessidade de implementação funcional do código-fonte.

---

## ✨ Funcionalidades Principais

- 🔐 **Autenticação de usuários:** cadastro, login, perfis de cliente e administrador.
- 🕵️ **Catálogo de jogos de investigação:** listagem, busca, filtros por categoria, preço e duração.
- 🛒 **Carrinho de compras:** inclusão e remoção de jogos digitais.
- 💳 **Checkout e pagamento fictício:** integração projetada com gateway de pagamento.
- 📥 **Liberação de download:** acesso ao PDF somente após confirmação de pagamento.
- 📚 **Biblioteca pessoal:** área do cliente para visualizar jogos adquiridos.
- ⭐ **Avaliações:** clientes podem avaliar jogos comprados.
- 🧑‍💼 **Painel administrativo:** cadastro, edição e publicação de jogos digitais.
- 📊 **Relatórios:** vendas por período, jogos mais vendidos e receita total.
- ✉️ **Notificações:** confirmação de compra e liberação de acesso por e-mail.

---

## 📏 Regras de Negócio

| ID | Regra |
|---|---|
| RN-01 | Somente usuários autenticados podem finalizar pedidos e acessar downloads. |
| RN-02 | O PDF de um jogo só é liberado após pagamento aprovado. |
| RN-03 | Cada compra gera uma licença digital associada ao cliente e ao jogo. |
| RN-04 | O link de download deve ser temporário e individual. |
| RN-05 | Jogos em rascunho ou inativos não aparecem no catálogo público. |
| RN-06 | Apenas administradores podem cadastrar, editar, publicar ou inativar jogos. |
| RN-07 | O cliente só pode avaliar jogos que comprou. |
| RN-08 | O pedido pode assumir os estados: criado, aguardando pagamento, pago, cancelado, expirado ou estornado. |
| RN-09 | Cada licença possui limite de downloads para reduzir compartilhamento indevido. |
| RN-10 | Arquivos PDF enviados devem ter extensão `.pdf`, checksum registrado e tamanho máximo configurável. |

---

## 🛠 Tecnologias Utilizadas

### 💻 Front-end

* **Framework/Biblioteca:** React 18
* **Linguagem/Superset:** TypeScript
* **Build Tool:** Vite
* **Estilização:** Tailwind CSS
* **Gerenciamento de Estado:** Context API + React Query
* **Testes:** Vitest e React Testing Library

### 🖥️ Back-end

* **Linguagem/Runtime:** Java 17
* **Framework:** Spring Boot 3.3.x
* **Banco de Dados:** PostgreSQL 16
* **ORM:** Spring Data JPA / Hibernate
* **Autenticação:** JWT + Spring Security
* **Documentação de API:** Swagger/OpenAPI
* **Migrações:** Flyway

### ⚙️ Infraestrutura & DevOps

* **Containerização:** Docker e Docker Compose
* **CI/CD:** GitHub Actions
* **Deploy Front-end:** Vercel ou Netlify
* **Deploy Back-end:** Railway, Render ou VPS
* **Armazenamento de PDFs:** Storage privado com URLs temporárias assinadas

---

## 🏗 Arquitetura

O projeto utiliza uma arquitetura em camadas, separando responsabilidades entre interface, controladores REST, serviços de aplicação, repositórios, banco de dados e integrações externas. Essa abordagem facilita manutenção, testes e evolução do sistema.

### Camadas principais

1. **Apresentação:** aplicação React responsável por telas, componentes, navegação e consumo da API.
2. **API REST:** camada Spring Boot com controllers, DTOs e validações de entrada.
3. **Serviços de negócio:** regras como finalização de pedido, liberação de download e publicação de jogos.
4. **Persistência:** repositórios JPA para usuários, jogos, pedidos, pagamentos e licenças.
5. **Infraestrutura:** gateway de pagamento, serviço de e-mail e storage de PDFs.

### Padrões adotados

- **MVC** para organização da API.
- **Service Layer** para centralizar regras de negócio.
- **Repository** para acesso a dados.
- **DTO** para entrada e saída da API.
- **Strategy** para formas de pagamento.
- **Factory** para criação de pedidos/licenças.

---

## 🧩 Diagramas PlantUML

Todos os códigos PlantUML estão em [`docs/plantuml`](docs/plantuml). Para gerar imagens localmente, instale o PlantUML e execute:

```bash
plantuml docs/plantuml/*.puml
```

| Arquivo | Finalidade |
|---|---|
| `01-casos-de-uso.puml` | Casos de uso e atores do sistema. |
| `02-sequencia-sistema-compra.puml` | Sequência do sistema para compra de PDF. |
| `03-sequencia-sistema-admin-publicacao.puml` | Sequência do sistema para publicação de jogo. |
| `04-sequencia-sistema-download.puml` | Sequência do sistema para download seguro. |
| `05-arquitetura-c4-container.puml` | Visão arquitetural macro. |
| `06-componentes.puml` | Componentes front-end, back-end e integrações. |
| `07-implantacao.puml` | Implantação em ambiente web. |
| `08-classes.puml` | Diagrama de classes do domínio. |
| `09-sequencia-projeto-checkout.puml` | Sequência de projeto para checkout. |
| `10-sequencia-projeto-download.puml` | Sequência de projeto para download. |
| `11-sequencia-projeto-admin.puml` | Sequência de projeto para administração. |
| `12-comunicacao-checkout.puml` | Comunicação entre objetos no checkout. |
| `13-estados-pedido.puml` | Estados do pedido. |
| `14-estados-jogo-digital.puml` | Estados do jogo digital. |
| `15-modelo-dados-der.puml` | Modelo de dados/DER. |

---

## 🔧 Instalação e Execução

> Este projeto é documental. Os comandos abaixo representam a execução planejada para uma futura implementação.

### Pré-requisitos

* Java JDK 17 ou superior
* Node.js LTS 18+
* npm ou yarn
* Docker e Docker Compose
* PostgreSQL 16
* PlantUML para renderizar diagramas

### Variáveis de ambiente

#### Back-end

| Variável | Descrição | Exemplo |
|---|---|---|
| `SERVER_PORT` | Porta da API | `8080` |
| `SPRING_DATASOURCE_URL` | URL JDBC do PostgreSQL | `jdbc:postgresql://localhost:5432/mente_detetive` |
| `SPRING_DATASOURCE_USERNAME` | Usuário do banco | `postgres` |
| `SPRING_DATASOURCE_PASSWORD` | Senha do banco | `postgres` |
| `JWT_SECRET` | Chave de assinatura JWT | `chave_super_segura_base64` |
| `PDF_STORAGE_PATH` | Caminho de armazenamento privado | `/storage/pdfs` |

#### Front-end

| Variável | Descrição | Exemplo |
|---|---|---|
| `VITE_API_URL` | URL base da API | `http://localhost:8080/api` |
| `VITE_APP_NAME` | Nome da aplicação | `Mente Detetive` |

### Execução local planejada

```bash
# Front-end
cd frontend
npm install
npm run dev

# Back-end
cd backend
./mvnw spring-boot:run

# Banco com Docker
docker run --name mente-detetive-db \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=mente_detetive \
  -p 5432:5432 \
  -d postgres:16
```

---

## 🚀 Deploy

A implantação planejada prevê o front-end hospedado na Vercel/Netlify, a API Spring Boot em Railway/Render/VPS e o banco PostgreSQL em serviço gerenciado. Arquivos PDF devem ser armazenados em ambiente privado, nunca em pasta pública do front-end.

```bash
# Build front-end
cd frontend
npm run build

# Build back-end
cd backend
./mvnw clean package

# Execução do JAR
java -jar target/mente-detetive-api-1.0.0.jar
```

---

## 📂 Estrutura de Pastas

```text
.
├── assets/
│   └── logo.svg
├── docs/
│   ├── api/
│   │   └── openapi-resumo.md
│   ├── database/
│   │   └── schema.sql
│   ├── plantuml/
│   │   ├── 01-casos-de-uso.puml
│   │   ├── 02-sequencia-sistema-compra.puml
│   │   └── ...
│   └── documentacao-projeto-mente-detetive.docx
├── README.md
├── LICENSE
└── .gitignore
```

---

## 🎥 Demonstração

Como o escopo do trabalho é projeto, arquitetura e documentação, as telas abaixo são planejadas para uma futura implementação:

| Tela | Descrição |
|---|---|
| Home/Catálogo | Lista jogos de investigação publicados. |
| Detalhes do Jogo | Exibe sinopse, preço, duração e número de jogadores. |
| Carrinho | Mostra PDFs selecionados para compra. |
| Checkout | Finaliza pedido e direciona pagamento. |
| Biblioteca | Exibe PDFs comprados e botão de download. |
| Painel Admin | Permite cadastrar jogos, enviar PDF e publicar no catálogo. |

---

## 🧪 Testes

A estratégia de testes planejada contempla:

```bash
# Testes front-end
npm run test

# Testes back-end
./mvnw test

# Testes E2E
npm run test:e2e
```

### Cenários principais

- Cadastro e login de usuário.
- Listagem e filtro de jogos.
- Finalização de pedido com pagamento aprovado.
- Bloqueio de download sem compra.
- Liberação de PDF após pagamento.
- Publicação de jogo por administrador.
- Avaliação apenas para jogos comprados.

---

## 🔗 Documentações utilizadas

* [PlantUML](https://plantuml.com/)
* [React](https://react.dev/)
* [Vite](https://vitejs.dev/)
* [Spring Boot](https://spring.io/projects/spring-boot)
* [PostgreSQL](https://www.postgresql.org/docs/)
* [Docker](https://docs.docker.com/)
* [Swagger/OpenAPI](https://swagger.io/specification/)

---

## 👤 Autor

| Nome | Curso | Instituição | E-mail |
|---|---|---|---|
| Ian Nycolas Fernandes Costa | Engenharia de Software | PUC Minas | ian.costa.1494000@sga.pucminas.br |

---

## 📄 Licença

Este projeto é distribuído sob a Licença MIT. Consulte o arquivo [`LICENSE`](LICENSE).
