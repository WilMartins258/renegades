-- RESET
USE renegades_stage;


-- DROP CONSTRAINTS
ALTER TABLE USUARIO DROP constraint usuario_id_estabelecimento_fk;
ALTER TABLE USUARIO DROP constraint usuario_id_celular_fk;

ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_endereco_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_contato_fk;


-- DROP TABLES
DROP TABLE USUARIO;
DROP TABLE ESTABELECIMENTO;
DROP TABLE CELULAR;
DROP TABLE ENDERECO;
DROP TABLE CONTATO;


-- DROP DATABASE
DROP database renegades_stage;


---------------------------

CREATE database renegades_stage;
USE renegades_stage;

---------------------------


-- Criação de tabelas
CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT,
	idCelular INT not null,
    nome VARCHAR(100) not null,
    sobrenome VARCHAR(100) not null,
	nomeUsuario VARCHAR(50) not null, 
    cpf VARCHAR(11) UNIQUE,
    email VARCHAR(100) not null UNIQUE,
    senha VARCHAR(50) not null,
	foto_de_perfil BLOB,
    data_nascimento DATE,
	favoritos VARCHAR(300)
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
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigoArea01 VARCHAR(5) not null,
	numero01 VARCHAR(20) not null,
	codigoArea02 VARCHAR(5),
	numero02 VARCHAR(20),
	site VARCHAR(200),
	cardapioOnline VARCHAR(200)
) AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) not null,
	categoria VARCHAR(50) not null, -- (bar, lanchonete, pizzaria)
	descricao VARCHAR(400) not null,
	ambiente VARCHAR(100), -- Público-alvo (Estilo do ambiente...)
	estiloMusica VARCHAR(50),
	musicaAoVivo BOOLEAN,
	cardapio VARCHAR(100),
	fotoPrincipal BLOB,
	rodizio BOOLEAN not null,
	idEndereco INT not null,
	nota FLOAT, -- Avaliações (0 a 5 estrelas)
	agendamento BOOLEAN,
	idContato INT,
	estacionamento BOOLEAN
	-- promocao/anuncio ????? -- Precisamos conversar sobre como isso vai funcionar
) AUTO_INCREMENT = 1;

CREATE TABLE categoria (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE avaliacao (
	id estabelecimento,
	id usuario
) AUTO_INCREMENT = 1;


CREATE TABLE ambiente (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) not null -- Exemplo: Voltado para jovens, ambiente familiar
) AUTO_INCREMENT = 1;

CREATE TABLE cardapio (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fotoItem01 BLOB,
	nomeItem01 VARCHAR(50) not null,
	descricaoItem01 VARCHAR(50) not null,
	fotoItem02 BLOB,
	nomeItem02 VARCHAR(50) not null,
	descricaoItem02 VARCHAR(50) not null,
	fotoItem03 BLOB,
	nomeItem03 VARCHAR(50) not null,
	descricaoItem03 VARCHAR(50) not null,
) AUTO_INCREMENT = 1;


-- CONSTRAINTS

------ USUÁRIO
ALTER TABLE usuario add (constraint usuario_id_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE usuario add (constraint usuario_id_celular_fk foreign key (idCelular) references celular (id));

------ ESTABELECIMENTO
ALTER TABLE estabelecimento add (constraint estabelecimento_id_endereco_fk foreign key (idEndereco) references endereco (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_contato_fk foreign key (idContato) references contato (id));