-- DROP DATABASE
DROP database renegades_stage;


---------------------------

CREATE database renegades_stage;
USE renegades_stage;

---------------------------


-- Criação de tabelas
CREATE TABLE testTable (
    id INT PRIMARY KEY AUTO_INCREMENT,
	blobTest LONGBLOB
) AUTO_INCREMENT = 1;

CREATE TABLE categoria (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE estiloMusica (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE tipoContato (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	tipoContato       VARCHAR(50)
) AUTO_INCREMENT = 1;

/*
	Exemplos de tipos de categoria:
	Os dias da semana individualmente
	Feriado
	Segunda a sexta
	Segunda a quinta
	Sexta, sábado e domingo
	Somente final de semana
	
	[0, 1, ... 6]
*/
CREATE TABLE categoriaHorario (
	id               INT PRIMARY KEY AUTO_INCREMENT,
	categoriaHorario VARCHAR(50) not null
) AUTO_INCREMENT = 1;

/*
	Aqui podem surgir mais campos para auxiliar na geolocalização
	Exemplos: latitude e longitude
*/
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
	idEstabelecimento INT,
	idEndereco        INT,
    nome              VARCHAR(100) not null,
    sobrenome         VARCHAR(100) not null,
	codigoArea        VARCHAR(5) not null,
	celular           VARCHAR(20) not null,
    cpf               VARCHAR(11), -- UNIQUE,
    email             VARCHAR(100) not null UNIQUE,
    senha             VARCHAR(50) not null,
	fotoPerfil        LONGBLOB,
    dataNascimento    DATE,
	adm               BOOLEAN not null,
	favoritos         VARCHAR(200) -- (array contendo os Ids dos estabelecimentos favoritados - esse campo provavelmente vai mudar)
) AUTO_INCREMENT = 1;

CREATE TABLE contato (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idTipoContato     INT not null,
	idEstabelecimento INT not null,
	contato           VARCHAR(200) not null,
	responsavel       VARCHAR(100)
) AUTO_INCREMENT = 1;

CREATE TABLE horario (
	id                 INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento  INT not null,
	idCategoriaHorario INT not null,
	horarioInicio	   TIME not null,
	horarioFim         TIME not null
) AUTO_INCREMENT = 1;

/*
	Na aplicação nós limitaremos o tanto de itens do cardápio
*/
CREATE TABLE cardapio (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	foto              LONGBLOB not null,
	nome              VARCHAR(50) not null,
	descricao         VARCHAR(50) not null
) AUTO_INCREMENT = 1;

CREATE TABLE promocao (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	nome              VARCHAR(100) not null,
	descricao         VARCHAR(400) not null,
	codigo            VARCHAR(20) not null,
	dataInicio        DATE not null,
	dataFim           DATE not null
) AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
	id               INT PRIMARY KEY AUTO_INCREMENT,
	idCategoria      INT not null,
	idEstiloMusica   INT,
	idEndereco       INT not null,
	nome             VARCHAR(100) not null,
	cnpj             VARCHAR(14) not null UNIQUE,
	fotoPrincipal    LONGBLOB, -- not null
	descricao        VARCHAR(400) not null,
	entrega		     BOOLEAN not null,
	entregaGratis    BOOLEAN not null,
	-- faixa de preço
	musicaAoVivo     BOOLEAN not null,
	rodizio          BOOLEAN not null,
	agendamento      BOOLEAN not null,
	estacionamento   BOOLEAN not null,
	areaKids         BOOLEAN not null,
	ativo            BOOLEAN not null,
	visivel          BOOLEAN not null,
	statusValidacao  ENUM('Pendente', 'Validado', 'Não validado') not null,
	nota             FLOAT, -- Avaliações (0 a 5 estrelas)
	dataUltimoAcesso DATE
) AUTO_INCREMENT = 1;

CREATE TABLE avaliacao (
	id                INT PRIMARY KEY,
	idUsuario         INT not null,
	idEstabelecimento INT not null,
	resumo            VARCHAR(50) not null,
	avaliacao         VARCHAR(200) not null,
	nota              INT not null -- Somente de 1 a 5
) AUTO_INCREMENT = 1;


-- CONSTRAINTS

------ USUÁRIO
ALTER TABLE usuario add (constraint usuario_id_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE usuario add (constraint usuario_id_endereco_fk foreign key (idEndereco) references endereco (id));



------ ESTABELECIMENTO
ALTER TABLE estabelecimento add (constraint estabelecimento_categoria_fk foreign key (idCategoria) references categoria (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_endereco_fk foreign key (idEndereco) references endereco (id));

ALTER TABLE estabelecimento add (constraint estabelecimento_estilomusica_fk foreign key (idEstiloMusica) references estilomusica (id));



------ CONTATO
ALTER TABLE contato add (constraint contato_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE contato add (constraint contato_tipoContato_fk foreign key (idTipoContato) references tipoContato (id));



------ HORARIO
ALTER TABLE horario add (constraint horario_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE horario add (constraint horario_categoriaHorario_fk foreign key (idCategoriaHorario) references categoriaHorario (id));



------ CARDAPIO
ALTER TABLE cardapio add (constraint cardapio_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));



------ PROMOCAO
ALTER TABLE promocao add (constraint promocao_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));



------ AVALIACAO
ALTER TABLE avaliacao add (constraint avaliacao_usuario_fk foreign key (idUsuario) references usuario (id));

ALTER TABLE avaliacao add (constraint avaliacao_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));