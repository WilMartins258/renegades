-- RESET
USE renegades_stage;


-- DROP CONSTRAINTS
ALTER TABLE USUARIO DROP constraint usuario_id_estabelecimento_fk;
ALTER TABLE USUARIO DROP constraint usuario_id_celular_fk;

ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_categoria_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_contato_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_endereco_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_horario_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_cardapio_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_avaliacao_fk;
ALTER TABLE ESTABELECIMENTO DROP constraint estabelecimento_id_promocao_fk;

ALTER TABLE AVALIACAO DROP constraint avaliacao_id_usuario_fk;
ALTER TABLE AVALIACAO DROP constraint avaliacao_id_estabelecimento_fk;


-- DROP TABLES
DROP TABLE USUARIO;
DROP TABLE ESTABELECIMENTO;
DROP TABLE CELULAR;
DROP TABLE ENDERECO;
DROP TABLE CONTATO;
DROP TABLE CATEGORIA;
DROP TABLE CARDAPIO;
DROP TABLE HORARIO;
DROP TABLE PROMOCAO;
DROP TABLE AVALIACAO;
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
	test BLOB
) AUTO_INCREMENT = 1;

CREATE TABLE celular (
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigoArea VARCHAR(5) not null,
	numero VARCHAR(20) not null
) AUTO_INCREMENT = 1;

CREATE TABLE endereco (
	id         INT PRIMARY KEY AUTO_INCREMENT,
	cep        VARCHAR(8) not null,
	estado     VARCHAR(50) not null,
	cidade     VARCHAR(80) not null,
    lodradouro VARCHAR(200) not null,
    bairro     VARCHAR(100) not null,
    numero     VARCHAR(6) not null
) AUTO_INCREMENT = 1;

CREATE TABLE usuario (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idCelular         INT not null,
	idEstabelecimento INT,
	idEndereco        INT, -- FAZER CONSTRAINT DISSO DEPOIS
    nome              VARCHAR(100) not null,
    sobrenome         VARCHAR(100) not null,
	nomeUsuario       VARCHAR(50) not null, 
    cpf               VARCHAR(11), -- UNIQUE,
    email             VARCHAR(100) not null UNIQUE,
    senha             VARCHAR(50) not null,
	fotoPerfil        BLOB,
	-- adm            BOOLEAN,
    dataNascimento    DATE
	-- favoritos      VARCHAR(200), (array contendo os Ids dos estabelecimentos favoritados)
) AUTO_INCREMENT = 1;

CREATE TABLE categoria (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE estiloMusica ( -- Fazer altertable
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE contato (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	codigoArea01      VARCHAR(5) not null,
	numero01          VARCHAR(20) not null,
	temWhasapp01      BOOLEAN,
	codigoArea02      VARCHAR(5),
	numero02          VARCHAR(20),
	temWhasapp02      BOOLEAN,
	site              VARCHAR(200),
	cardapioOnline    VARCHAR(200)
) AUTO_INCREMENT = 1;

/* diasFuncionamento
	A ideia é esse varchar ser preenchido com um array contendo os dias da semana
	em que o estabelecimento funciona.
	
	Domingo = 0
	Segunda = 1
	Terça   = 2
	Quarta  = 3
	Quinta  = 4
	Sexta   = 5
	Sábado  = 6
	
	Exemplo
	Estabelecimento que funciona sexta, sábado e domingo:
	[0, 5, 6]
*/
CREATE TABLE horario (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	diasFuncionamento VARCHAR(25) not null, -- Ver OBS acima
	domingoInicio     TIME,
	domingoFim        TIME,
	segundaInicio     TIME,
	segundaFim        TIME,
	tercaInicio       TIME,
	tercaFim          TIME,
	quartaInicio      TIME,
	quartaFim         TIME,
	quintaInicio      TIME,
	quintaFim         TIME,
	sextaInicio       TIME,
	sextaFim          TIME,
	sabadoInicio      TIME,
	sabadoFim         TIME
) AUTO_INCREMENT = 1;

CREATE TABLE cardapio (
	id              INT PRIMARY KEY AUTO_INCREMENT,
	fotoItem01      BLOB not null,
	nomeItem01      VARCHAR(50) not null,
	descricaoItem01 VARCHAR(50) not null,
	fotoItem02      BLOB,
	nomeItem02      VARCHAR(50),
	descricaoItem02 VARCHAR(50),
	fotoItem03      BLOB,
	nomeItem03      VARCHAR(50),
	descricaoItem03 VARCHAR(50)
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
	idAvaliacao      INT,
	idpromocao       INT,
	nome             VARCHAR(100) not null,
	cnpj             VARCHAR(14) not null UNIQUE,
	fotoPrincipal    BLOB,
	descricao        VARCHAR(400) not null,
	musicaAoVivo     BOOLEAN,
	rodizio          BOOLEAN not null,
	agendamento      BOOLEAN,
	estacionamento   BOOLEAN,
	areaKids         BOOLEAN, -- ------------------------------------------------NEW!!!
	ativo            BOOLEAN,
	visivel          BOOLEAN,
	validado         ENUM('Pendente', 'Validado', 'Não validado'),
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

------ ESTABELECIMENTO
ALTER TABLE estabelecimento add (constraint estabelecimento_id_categoria_fk foreign key (idCategoria) references categoria (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_contato_fk foreign key (idContato) references contato (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_endereco_fk foreign key (idEndereco) references endereco (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_horario_fk foreign key (idHorario) references horario (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_cardapio_fk foreign key (idCardapio) references cardapio (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_avaliacao_fk foreign key (idAvaliacao) references avaliacao (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_promocao_fk foreign key (idpromocao) references promocao (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_id_estilomusica_fk foreign key (idEstiloMusica) references estilomusica (id));


------ AVALIACAO
ALTER TABLE avaliacao add (constraint avaliacao_id_usuario_fk foreign key (idUsuario) references usuario (id));

ALTER TABLE avaliacao add (constraint avaliacao_id_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));