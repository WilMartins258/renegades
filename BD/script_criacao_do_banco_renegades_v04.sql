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
DROP TABLE CATEGORIA;
DROP TABLE AMBIENTE;
DROP TABLE CARDAPIO;
DROP TABLE HORARIO;
DROP TABLE AVALIACAO;


-- DROP DATABASE
DROP database renegades_stage;


---------------------------

CREATE database renegades_stage;
USE renegades_stage;

---------------------------


-- Criação de tabelas
CREATE TABLE celular (
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigoArea VARCHAR(5) not null,
	numero VARCHAR(20) not null
) AUTO_INCREMENT = 1;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	idCelular INT not null,
	idEstabelecimento INT,
	ativo BOOLEAN,
    nome VARCHAR(100) not null,
    sobrenome VARCHAR(100) not null,
	nomeUsuario VARCHAR(50) not null, 
    cpf VARCHAR(11), -- UNIQUE,
    email VARCHAR(100) not null UNIQUE,
    senha VARCHAR(50) not null,
	fotoPerfil BLOB,
    dataNascimento DATE,
	favoritos VARCHAR(300)
) AUTO_INCREMENT = 1;

CREATE TABLE categoria (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) not null
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

CREATE TABLE endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cep VARCHAR(8) not null,
	estado VARCHAR(50) not null,
	cidade VARCHAR(80) not null,
    lodradouro VARCHAR(200) not null,
    bairro VARCHAR(100) not null,
    numero VARCHAR(6) not null
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
	id INT PRIMARY KEY AUTO_INCREMENT,
	diasFuncionamento VARCHAR(20) not null, -- Ver OBS acima
	domingoInicio TIME,
	domingoFim TIME,
	segundaInicio TIME,
	segundaFim TIME,
	tercaInicio TIME,
	tercaFim TIME,
	quartaInicio TIME,
	quartaFim TIME,
	quintaInicio TIME,
	quintaFim TIME,
	sextaInicio TIME,
	sextaFim TIME,
	sabadoInicio TIME,
	sabadoFim TIME	
) AUTO_INCREMENT = 1;

CREATE TABLE cardapio (
	id INT PRIMARY KEY AUTO_INCREMENT,
	fotoItem01 BLOB not null,
	nomeItem01 VARCHAR(50) not null,
	descricaoItem01 VARCHAR(50) not null,
	fotoItem02 BLOB,
	nomeItem02 VARCHAR(50),
	descricaoItem02 VARCHAR(50),
	fotoItem03 BLOB,
	nomeItem03 VARCHAR(50),
	descricaoItem03 VARCHAR(50),
) AUTO_INCREMENT = 1;

CREATE TABLE ambiente (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) not null -- Exemplo: Voltado para jovens, ambiente familiar
) AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
	id INT PRIMARY KEY AUTO_INCREMENT,
	idCategoria INT not null, -- (bar, lanchonete, pizzaria)
	idContato INT not null,
	idEndereco INT not null,
	idHorario INT not null,
	idCardapio INT,
	idAmbiente INT,
	nome VARCHAR(100) not null,
	descricao VARCHAR(400) not null,
	estiloMusica VARCHAR(50),
	musicaAoVivo BOOLEAN,
	fotoPrincipal BLOB,
	rodizio BOOLEAN not null,
	nota FLOAT, -- Avaliações (0 a 5 estrelas)
	agendamento BOOLEAN,
	estacionamento BOOLEAN,
	ativo BOOLEAN
	-- promocao/anuncio ????? -- Precisamos conversar sobre como isso vai funcionar
) AUTO_INCREMENT = 1;

CREATE TABLE avaliacao (
	idUsuario INT PRIMARY KEY,
	idEstabelecimento INT PRIMARY KEY,
	resumo VARCHAR(50),
	avaliacao VARCHAR(200),
	nota
);


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

ALTER TABLE estabelecimento add (constraint estabelecimento_id_ambiente_fk foreign key (idAmbiente) references ambiente (id));

------ AVALIACAO
ALTER TABLE avaliacao add (constraint avaliacao_id_usuario_fk foreign key (idUsuario) references usuario (id));

ALTER TABLE avaliacao add (constraint avaliacao_id_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));


