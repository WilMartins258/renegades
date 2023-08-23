-- RESET
USE renegades_stage;


-- DROP CONSTRAINTS
ALTER TABLE USUARIO DROP constraint usuario_id_estabelecimento_fk;
ALTER TABLE USUARIO DROP constraint usuario_id_celular_fk;
ALTER TABLE USUARIO DROP constraint usuario_id_endereco_fk;

ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_categoria_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_contato_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_endereco_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_horario_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_cardapio_fk;
-- ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_avaliacao_fk;
-- ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_promocao_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_estilomusica_fk;

ALTER TABLE AVALIACAO DROP constraint avaliacao_id_usuario_fk;
ALTER TABLE AVALIACAO DROP constraint avaliacao_id_estabelecimento_fk;


-- DROP TABLES
DROP TABLE AVALIACAO;
DROP TABLE USUARIO;
DROP TABLE ESTABELECIMENTO;
DROP TABLE CELULAR;
DROP TABLE ENDERECO;
DROP TABLE CONTATO;
DROP TABLE CATEGORIA;
DROP TABLE CARDAPIO;
DROP TABLE HORARIO;
DROP TABLE PROMOCAO;
DROP TABLE ESTILOMUSICA;
DROP TABLE TEST;


-- DROP DATABASE
DROP database renegades_stage;


---------------------------

CREATE database renegades_stage;
USE renegades_stage;

---------------------------


-- Criação de tabelas
CREATE TABLE test (
    id INT PRIMARY KEY AUTO_INCREMENT,
	test LONGBLOB
) AUTO_INCREMENT = 1;

CREATE TABLE endereco (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	cep               VARCHAR(8) not null,
	estado            VARCHAR(50) not null,
	cidade            VARCHAR(80) not null,
    lodradouro        VARCHAR(200) not null,
    bairro            VARCHAR(100) not null,
    numero            VARCHAR(6) not null
) AUTO_INCREMENT = 1;

CREATE TABLE usuario (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idCelular         INT not null,
	idEstabelecimento INT,
	idEndereco        INT,
    nome              VARCHAR(100) not null,
    sobrenome         VARCHAR(100) not null,
	codigoArea        VARCHAR(5) not null,
	numero            VARCHAR(20) not null,
    cpf               VARCHAR(11), -- UNIQUE,
    email             VARCHAR(100) not null UNIQUE,
    senha             VARCHAR(50) not null,
	fotoPerfil        LONGBLOB,
	-- adm            BOOLEAN,
    dataNascimento    DATE,
	favoritos         VARCHAR(200) -- (array contendo os Ids dos estabelecimentos favoritados)
) AUTO_INCREMENT = 1;

CREATE TABLE categoria (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE estiloMusica (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE contato (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idTipoContato     INT not null,
	contato           VARCHAR(200) not null,
	responsavel       VARCHAR(100)
) AUTO_INCREMENT = 1;

CREATE TABLE tipoContato (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	tipoContato       VARCHAR(50)
) AUTO_INCREMENT = 1;



CREATE TABLE cardapio (
	id              INT PRIMARY KEY AUTO_INCREMENT,
	fotoItem01      LONGBLOB not null,
	nomeItem01      VARCHAR(50) not null,
	descricaoItem01 VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE promocao (
	id         INT PRIMARY KEY AUTO_INCREMENT,
	nome       VARCHAR(100) not null,
	descricao  VARCHAR(400) not null,
	codigo     VARCHAR(20) not null,
	dataInicio DATE not null,
	dataFim    DATE not null
) AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
	id               INT PRIMARY KEY AUTO_INCREMENT,
	idCategoria      INT not null, -- (bar, lanchonete, pizzaria)
	idEstiloMusica   INT,
	idContato        INT not null,
	idEndereco       INT not null,
	idHorario        INT not null,
	idCardapio       INT,
	-- idAvaliacao      INT,
	-- idpromocao       INT,
	nome             VARCHAR(100) not null,
	cnpj             VARCHAR(14) not null UNIQUE,
	fotoPrincipal    LONGBLOB,
	descricao        VARCHAR(400) not null,
	-- entrega		     BOOLEAN not null,
	-- entregaGratis    BOOLEAN not null,
	musicaAoVivo     BOOLEAN not null,
	rodizio          BOOLEAN not null,
	agendamento      BOOLEAN not null,
	estacionamento   BOOLEAN not null,
	areaKids         BOOLEAN not null,
	ativo            BOOLEAN not null,
	visivel          BOOLEAN not null,
	validacao        ENUM('Pendente', 'Validado', 'Não validado') not null,
	nota             FLOAT, -- Avaliações (0 a 5 estrelas)
	dataUltimoAcesso DATE
) AUTO_INCREMENT = 1;

--------------------------------------------------
CREATE TABLE favoritos (
	id                INT PRIMARY KEY,
	idUsuario         INT not null,
	idEstabelecimento INT not null,
	resumo            VARCHAR(50),
	avaliacao         VARCHAR(200),
	nota              INT -- Somente de 1 a 5
) AUTO_INCREMENT = 1;

CREATE TABLE avaliacao (
	id                INT PRIMARY KEY,
	idUsuario         INT not null,
	idEstabelecimento INT not null,
	resumo            VARCHAR(50),
	avaliacao         VARCHAR(200),
	nota              INT -- Somente de 1 a 5
) AUTO_INCREMENT = 1;


-- CONSTRAINTS

------ USUÁRIO
ALTER TABLE usuario add (constraint usuario_id_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE usuario add (constraint usuario_id_celular_fk foreign key (idCelular) references celular (id));

ALTER TABLE usuario add (constraint usuario_id_endereco_fk foreign key (idEndereco) references endereco (id));

------ ESTABELECIMENTO
ALTER TABLE estabelecimento add (constraint estabelecimento_id_categoria_fk foreign key (idCategoria) references categoria (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_contato_fk foreign key (idContato) references contato (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_endereco_fk foreign key (idEndereco) references endereco (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_horario_fk foreign key (idHorario) references horario (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_cardapio_fk foreign key (idCardapio) references cardapio (id));

-- ALTER TABLE estabelecimento add (constraint estabelecimento_id_avaliacao_fk foreign key (idAvaliacao) references avaliacao (id));

-- ALTER TABLE estabelecimento add (constraint estabelecimento_id_promocao_fk foreign key (idpromocao) references promocao (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_estilomusica_fk foreign key (idEstiloMusica) references estilomusica (id));


------ AVALIACAO
ALTER TABLE avaliacao add (constraint avaliacao_id_usuario_fk foreign key (idUsuario) references usuario (id));

ALTER TABLE avaliacao add (constraint avaliacao_id_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));