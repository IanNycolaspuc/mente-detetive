-- Mente Detetive - Esquema lógico do banco de dados (PostgreSQL)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE usuarios (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(160) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(20) NOT NULL CHECK (perfil IN ('CLIENTE', 'ADMIN')),
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE jogos_digitais (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    categoria_id UUID NOT NULL REFERENCES categorias(id),
    titulo VARCHAR(160) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    faixa_etaria VARCHAR(10) NOT NULL,
    duracao_minutos INT NOT NULL CHECK (duracao_minutos > 0),
    quantidade_jogadores INT NOT NULL CHECK (quantidade_jogadores > 0),
    status VARCHAR(20) NOT NULL CHECK (status IN ('RASCUNHO','PUBLICADO','INATIVO'))
);

CREATE TABLE arquivos_pdf (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    jogo_id UUID NOT NULL UNIQUE REFERENCES jogos_digitais(id),
    nome_arquivo VARCHAR(180) NOT NULL,
    caminho_storage VARCHAR(255) NOT NULL,
    tamanho_bytes BIGINT NOT NULL,
    checksum VARCHAR(128) NOT NULL
);

CREATE TABLE pedidos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID NOT NULL REFERENCES usuarios(id),
    codigo VARCHAR(30) NOT NULL UNIQUE,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE itens_pedido (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    pedido_id UUID NOT NULL REFERENCES pedidos(id),
    jogo_id UUID NOT NULL REFERENCES jogos_digitais(id),
    preco_pago DECIMAL(10,2) NOT NULL
);

CREATE TABLE pagamentos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    pedido_id UUID NOT NULL UNIQUE REFERENCES pedidos(id),
    transacao_id VARCHAR(120),
    forma VARCHAR(30) NOT NULL,
    status VARCHAR(30) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE licencas_download (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    pedido_id UUID NOT NULL REFERENCES pedidos(id),
    jogo_id UUID NOT NULL REFERENCES jogos_digitais(id),
    liberada_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    limite_downloads INT NOT NULL DEFAULT 5,
    downloads_realizados INT NOT NULL DEFAULT 0,
    ativa BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE avaliacoes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cliente_id UUID NOT NULL REFERENCES usuarios(id),
    jogo_id UUID NOT NULL REFERENCES jogos_digitais(id),
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    criada_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (cliente_id, jogo_id)
);
