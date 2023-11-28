-- DROP DATABASE
DROP database renegades_stage;


---------------------------

CREATE database renegades_stage;
USE renegades_stage;

---------------------------


CREATE TABLE categoria (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null,
	ativo             ENUM('Sim', 'Não') DEFAULT 'Sim' not null
) AUTO_INCREMENT = 1;

CREATE TABLE estiloMusica (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome              VARCHAR(50) not null,
	ativo             ENUM('Sim', 'Não') DEFAULT 'Sim' not null
) AUTO_INCREMENT = 1;

CREATE TABLE opcional (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	nome	          VARCHAR(100) not null,
	ativo             ENUM('Sim', 'Não') DEFAULT 'Sim' not null
) AUTO_INCREMENT = 1;

CREATE TABLE contato (
	id         INT PRIMARY KEY AUTO_INCREMENT,
	nome       VARCHAR(50)
) AUTO_INCREMENT = 1;

CREATE TABLE redeSocial (
	id         INT PRIMARY KEY AUTO_INCREMENT,
	nome       VARCHAR(50)
) AUTO_INCREMENT = 1;

CREATE TABLE comida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
) AUTO_INCREMENT = 1;

/*
	Exemplos de tipos de categoria:
	0 - DOMINGO          [0]
	1 - SEGUNDA          [1]
	2 - TERÇA            [2]
	3 - QUARTA           [3]
	4 - QUINTA           [4]
	5 - SEXTA            [5]
	6 - SÁBADO           [6]
	7 - SEGUNDA A SEXTA  [1, 2, 3, 4, 5]
	8 - SÁBADO E DOMINGO [0, 6]
*/
CREATE TABLE diaSemana (
	id               INT PRIMARY KEY AUTO_INCREMENT,
	diaSemana        VARCHAR(50) not null,
	numeroDia        VARCHAR(50) not null
) AUTO_INCREMENT = 1;

/*
	Campo tipoUsuario
	0: normal (usuário logado)
	1: Dono de Estabelecimento
	2: ADM
*/
CREATE TABLE usuario (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT,
    nome              VARCHAR(100) not null,
	celular           VARCHAR(20), -- not null,
    cpf               VARCHAR(11), -- UNIQUE,
    email             VARCHAR(100) not null UNIQUE,
    senha             VARCHAR(50) not null,
	fotoPerfil        VARCHAR(20),
    dataNascimento    DATE,
	tipoUsuario       INT DEFAULT 0 not null,
	status            ENUM('Ativo', 'Inativo') DEFAULT 'Ativo' not null,
	numeroResidencia  VARCHAR(9),
	logradouro        VARCHAR(200),
	bairro            VARCHAR(200),
	cidade            VARCHAR(200),
	estado            VARCHAR(200),
	cep               VARCHAR(9),
	latitude          DECIMAL(32, 26),
	longitude         DECIMAL(32, 26)
) AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
	id                     INT PRIMARY KEY AUTO_INCREMENT,
	nome                   VARCHAR(100) not null,
	cnpj                   VARCHAR(20) not null, -- UNIQUEE
	fotoPrincipal          VARCHAR(20), -- not null
	descricao              VARCHAR(400) not null,
	ativo                  BOOLEAN DEFAULT true not null,
	oculto                 BOOLEAN DEFAULT false not null,
	status                 ENUM('Pendente', 'Validado', 'Não Validado') DEFAULT 'Pendente' not null,
	nota                   FLOAT DEFAULT null,
	numeroAvaliacoes       INT DEFAULT 0 not null,
	numeroEstabelecimento  VARCHAR(9) not null,
	logradouro             VARCHAR(200) not null,
	bairro                 VARCHAR(200) not null,
	cidade                 VARCHAR(200) not null,
	estado                 VARCHAR(200) not null,
	cep                    VARCHAR(9) not null,
	latitude               DECIMAL(32, 26), -- FLOAT,
	longitude              DECIMAL(32, 26), -- FLOAT,
	dataCadastro           DATE not null,
	dataUltimoAcesso       DATE not null
) AUTO_INCREMENT = 1;

CREATE TABLE horario (
	id                 INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento  INT not null,
	idDiaSemana        INT not null,
	horarioInicio	   TIME not null,
	horarioFim         TIME not null
) AUTO_INCREMENT = 1;

/*
	Na aplicação nós limitaremos o tanto de itens do cardápio
*/
CREATE TABLE recomendacao (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	foto              VARCHAR(20) not null,
	nome              VARCHAR(50) not null,
	descricao         VARCHAR(500) not null
) AUTO_INCREMENT = 1;

CREATE TABLE promocao (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	nome              VARCHAR(100) not null,
	descricao         VARCHAR(400) not null,
	codigo            VARCHAR(20) not null,
	status            ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	dataInicio        DATE not null,
	dataFim           DATE not null
) AUTO_INCREMENT = 1;

CREATE TABLE redeSocial_estabelecimento (
	id                  INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento   INT not null,
	idRedeSocial        INT not null,
	redeSocial          VARCHAR(500) not null
) AUTO_INCREMENT = 1;

CREATE TABLE contato_estabelecimento (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	idContato         INT not null,
	contato           VARCHAR(200) not null,
	isWhatsapp        BOOLEAN not null
) AUTO_INCREMENT = 1;

CREATE TABLE opcional_estabelecimento (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	idOpcional        INT not null
) AUTO_INCREMENT = 1;

CREATE TABLE comida_estabelecimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT NOT NULL,
    idComida INT NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE categoria_estabelecimento (
    id                INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT NOT NULL,
    idCategoria       INT NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE musica_estabelecimento (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idEstabelecimento INT not null,
	idEstiloMusica    INT not null
) AUTO_INCREMENT = 1;

CREATE TABLE avaliacao (
	id                INT PRIMARY KEY AUTO_INCREMENT,
	idUsuario         INT not null,
	idEstabelecimento INT not null,
	descricao         VARCHAR(300) not null,
	data              DATE not null,
	nota              FLOAT not null -- Somente de 1 a 5
) AUTO_INCREMENT = 1;

CREATE TABLE favorito (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    idEstabelecimento INT NOT NULL
) AUTO_INCREMENT = 1;


-- CONSTRAINTS

------ USUÁRIO
ALTER TABLE usuario add (constraint usuario_idEstabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));



------ musica_estabelecimento
ALTER TABLE musica_estabelecimento add (constraint musica_estabelecimento_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE musica_estabelecimento add (constraint musica_estabelecimento_estiloMusica_fk foreign key (idEstiloMusica) references estiloMusica (id));



------ opcional_estabelecimento
ALTER TABLE opcional_estabelecimento add (constraint opcional_estabelecimento_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE opcional_estabelecimento add (constraint opcional_estabelecimento_opicional_fk foreign key (idOpcional) references opcional (id));



------ categoria_estabelecimento
ALTER TABLE categoria_estabelecimento add (constraint categoria_estabelecimento_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE categoria_estabelecimento add (constraint categoria_estabelecimento_categoria_fk foreign key (idCategoria) references categoria (id));



------ contato_estabelecimento
ALTER TABLE contato_estabelecimento add (constraint contato_estabelecimento_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE contato_estabelecimento add (constraint contato_estabelecimento_contato_fk foreign key (idContato) references contato (id));



------ REDESOCIAL_ESTABELECIMENTO
ALTER TABLE redeSocial_estabelecimento add (constraint redeSocial_estabelecimento_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE redeSocial_estabelecimento add (constraint redeSocial_estabelecimento_edeSocial_fk foreign key (idRedeSocial) references redeSocial (id));



------ HORARIO
ALTER TABLE horario add (constraint horario_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

ALTER TABLE horario add (constraint horario_diaSemana_fk foreign key (idDiaSemana) references diaSemana (id));



------ RECOMENDACAO
ALTER TABLE recomendacao add (constraint recomendacao_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));



------ PROMOCAO
ALTER TABLE promocao add (constraint promocao_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));



------ AVALIACAO
ALTER TABLE avaliacao add (constraint avaliacao_usuario_fk foreign key (idUsuario) references usuario (id));

ALTER TABLE avaliacao add (constraint avaliacao_estabelecimento_fk foreign key (idEstabelecimento) references estabelecimento (id));

------ favorito
ALTER TABLE favorito add (CONSTRAINT favorito_usuario_fk FOREIGN KEY (idUsuario) REFERENCES usuario (id));
ALTER TABLE favorito add (CONSTRAINT favorito_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id));


------ comida_estabelecimento
ALTER TABLE comida_estabelecimento add (CONSTRAINT comidaEstabelecimento_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id));
ALTER TABLE comida_estabelecimento add (CONSTRAINT comidaEstabelecimento_Comida_fk FOREIGN KEY (idComida) REFERENCES comida (id));


------------ TRIGGER
DELIMITER //

-- Verifica se a trigger existe
-- DROP TRIGGER IF EXISTS calcularAvaliacoes; não está funcionando

CREATE TRIGGER calcularAvaliacoes
AFTER INSERT ON avaliacao
FOR EACH ROW
BEGIN
    DECLARE totalAvaliacoes INT;
    DECLARE somaNotas INT;
    DECLARE media FLOAT;

    -- Calcula o número total de avaliações para o estabelecimento
    SELECT COUNT(*) INTO totalAvaliacoes FROM avaliacao WHERE idEstabelecimento = NEW.idEstabelecimento;

    -- Calcula a soma das notas das avaliações para o estabelecimento
    SELECT SUM(nota) INTO somaNotas FROM avaliacao WHERE idEstabelecimento = NEW.idEstabelecimento;

    -- Calcula a média das notas
    IF totalAvaliacoes > 0 THEN
        SET media = somaNotas / totalAvaliacoes;
    ELSE
        SET media = 0;
    END IF;

    -- Atualiza os campos na tabela estabelecimento
    UPDATE estabelecimento
    SET numeroAvaliacoes = totalAvaliacoes, nota = media
    WHERE id = NEW.idEstabelecimento;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER atualizarNotaAvaliacao
AFTER UPDATE ON avaliacao
FOR EACH ROW
BEGIN
    DECLARE estabelecimento_id INT;
    SET estabelecimento_id = NEW.idEstabelecimento;

    DECLARE totalAvaliacoes INT;
    DECLARE somaNotas INT;
    DECLARE media FLOAT;

    -- Calcula o número total de avaliações para o estabelecimento
    SELECT COUNT(*) INTO totalAvaliacoes FROM avaliacao WHERE idEstabelecimento = estabelecimento_id;

    -- Calcula a soma das notas das avaliações para o estabelecimento
    SELECT SUM(nota) INTO somaNotas FROM avaliacao WHERE idEstabelecimento = estabelecimento_id;

    -- Calcula a média das notas
    IF totalAvaliacoes > 0 THEN
        SET media = somaNotas / totalAvaliacoes;
    ELSE
        SET media = 0;
    END IF;

    -- Atualiza os campos na tabela estabelecimento
    UPDATE estabelecimento
    SET numeroAvaliacoes = totalAvaliacoes, nota = media
    WHERE id = estabelecimento_id;
END;

//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE AtualizarStatusPromocoes()
BEGIN
    UPDATE promocao
    SET status = 'Vencida'
    WHERE dataFim < CURDATE();
END;
//

DELIMITER ;
