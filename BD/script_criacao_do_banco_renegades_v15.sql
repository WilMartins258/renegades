-- DROP DATABASE
DROP DATABASE renegades_stage;

---------------------------

CREATE DATABASE renegades_stage;
USE renegades_stage;

---------------------------

-- Criação de tabelas

CREATE TABLE testTable (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeImg VARCHAR(50),
	blobTest LONGBLOB
) AUTO_INCREMENT = 1;

CREATE TABLE tipoContato (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
) AUTO_INCREMENT = 1;

CREATE TABLE estiloMusica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE opcional (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE diaSemana (
    id INT PRIMARY KEY AUTO_INCREMENT,
    diaSemana VARCHAR(50) NOT NULL,
    numeroDia VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE tipoComida (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
) AUTO_INCREMENT = 1;

CREATE TABLE endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR(8) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    logradouro VARCHAR(200) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(6) NOT NULL
) AUTO_INCREMENT = 1;

CREATE TABLE estabelecimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCategoria INT NOT NULL,
    idEndereco INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    fotoPrincipal LONGBLOB,
    descricao VARCHAR(400) NOT NULL,
    ativo BOOLEAN NOT NULL,
    visivel BOOLEAN NOT NULL,
    statusValidacao ENUM('Pendente', 'Validado', 'Não validado') NOT NULL,
    nota FLOAT,
    dataUltimoAcesso DATE NOT NULL,
    CONSTRAINT estabelecimento_categoria_fk FOREIGN KEY (idCategoria) REFERENCES categoria (id),
    CONSTRAINT estabelecimento_endereco_fk FOREIGN KEY (idEndereco) REFERENCES endereco (id)
) AUTO_INCREMENT = 1;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT,
    idEndereco INT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    codigoArea VARCHAR(20) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(50) NOT NULL,
    fotoPerfil LONGBLOB,
    dataNascimento DATE,
    tipoUsuario ENUM('normal', 'donoEstabelecimento', 'adm') NOT NULL,
	CONSTRAINT usuario_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id),
    CONSTRAINT usuario_endereco_fk FOREIGN KEY (idEndereco) REFERENCES endereco (id)
) AUTO_INCREMENT = 1;

CREATE TABLE horario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT NOT NULL,
    idDiaSemana INT NOT NULL,
    horarioInicio TIME NOT NULL,
    horarioFim TIME NOT NULL,
    CONSTRAINT horario_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id),
    CONSTRAINT horario_diaSemana_fk FOREIGN KEY (idDiaSemana) REFERENCES diaSemana (id)
) AUTO_INCREMENT = 1;

CREATE TABLE cardapio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT NOT NULL,
    foto LONGBLOB NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    CONSTRAINT cardapio_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id)
) AUTO_INCREMENT = 1;

CREATE TABLE promocao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEstabelecimento INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(400) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    CONSTRAINT promocao_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id)
) AUTO_INCREMENT = 1;

CREATE TABLE opcionalEstabelecimento (
    id INT PRIMARY KEY,
    idEstabelecimento INT NOT NULL,
    idOpcional INT NOT NULL,
    CONSTRAINT opcionalEstabelecimento_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id),
    CONSTRAINT opcionalEstabelecimento_opcional_fk FOREIGN KEY (idOpcional) REFERENCES opcional (id)
) AUTO_INCREMENT = 1;

CREATE TABLE comidaEstabelecimento (
    id INT PRIMARY KEY,
    idEstabelecimento INT NOT NULL,
    idTipocomida INT NOT NULL,
    CONSTRAINT comidaEstabelecimento_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id),
    CONSTRAINT comidaEstabelecimento_tipoComida_fk FOREIGN KEY (idTipoComida) REFERENCES tipoComida (id)
) AUTO_INCREMENT = 1;

CREATE TABLE musicaEstabelecimento (
    id INT PRIMARY KEY,
    idEstabelecimento INT NOT NULL,
    idEstiloMusica INT NOT NULL,
    CONSTRAINT musicaTocada_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id),
    CONSTRAINT musicaTocada_estiloMusica_fk FOREIGN KEY (idEstiloMusica) REFERENCES estiloMusica (id)
) AUTO_INCREMENT = 1;

CREATE TABLE contato (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idTipoContato INT NOT NULL,
    idEstabelecimento INT NOT NULL,
    contato VARCHAR(200) NOT NULL,
    CONSTRAINT contato_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id),
    CONSTRAINT contato_tipoContato_fk FOREIGN KEY (idTipoContato) REFERENCES tipoContato (id)
) AUTO_INCREMENT = 1;

CREATE TABLE avaliacao (
    id INT PRIMARY KEY,
    idUsuario INT NOT NULL,
    idEstabelecimento INT NOT NULL,
    resumo VARCHAR(50) NOT NULL,
    avaliacao VARCHAR(200) NOT NULL,
    data DATE NOT NULL,
    nota INT NOT NULL,
    CONSTRAINT avaliacao_usuario_fk FOREIGN KEY (idUsuario) REFERENCES usuario (id),
    CONSTRAINT avaliacao_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id)
) AUTO_INCREMENT = 1;

CREATE TABLE favoritos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    idEstabelecimento INT NOT NULL,
    CONSTRAINT favoritos_usuario_fk FOREIGN KEY (idUsuario) REFERENCES usuario (id),
    CONSTRAINT favoritos_estabelecimento_fk FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento (id)
) AUTO_INCREMENT = 1;
