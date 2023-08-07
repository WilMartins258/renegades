CREATE database renegades_stage;
USE renegades_stage;

-- Criação de tabelas
CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT,
	idCelular INT not null,
    nome VARCHAR(100) not null,
    sobrenome VARCHAR(100) not null,					
    cpf VARCHAR(11),
    email VARCHAR(100) not null UNIQUE,
    senha VARCHAR(50) not null,
	sexo ENUM('F', 'M'),
	foto_de_perfil BLOB,
    data_nascimento DATE,
	favoritos VARCHAR(300) -- A ideia é ter um array guardando todos os IDs dos estabelecimentos favoritos
) AUTO_INCREMENT = 1;

CREATE TABLE celular (
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigoArea VARCHAR(5) not null,
	numero VARCHAR(20) not null
) AUTO_INCREMENT = 1;

CREATE TABLE endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cep VARCHAR(8) not null,
	estado VARCHAR(50) not null,
	cidade VARCHAR(80) not null,
    lodradouro VARCHAR(200) not null,
    bairro VARCHAR(100) not null,
    numero VARCHAR(6) not null
) AUTO_INCREMENT = 1;

CREATE TABLE contato (
	id INT,
	codigoArea01 VARCHAR(5),
	numero01 VARCHAR(20),
	codigoArea02 VARCHAR(5),
	numero02 VARCHAR(20),
	site VARCHAR(200),
	cardapioOnline VARCHAR(200) -- ???
); AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
	nome VARCHAR(100) not null,
	categoria VARCHAR(50) not null, -- (bar, lanchonete, pizzaria)
	estilo VARCHAR(100), -- Público-alvo (Estilo do lugar...)
	cardapio VARCHAR(100), -- Cardápio/Produtos (somente listar, somente principais)
	rodizio BOOLEAN not null,
	idEndereco INT,
	nota FLOAT, -- Avaliações (0 a 5 estrelas)
	agendamento BOOLEAN,
	idContato INT,
	estacionamento BOOLEAN,
) AUTO_INCREMENT = 1;