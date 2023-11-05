USE renegades_stage;

-- RESET

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM categoria;
DELETE FROM estiloMusica;
DELETE FROM contato;
DELETE FROM redeSocial;
DELETE FROM comida;
DELETE FROM diaSemana;
DELETE FROM opcional;
DELETE FROM usuario;
DELETE FROM estabelecimento;
DELETE FROM horario;
DELETE FROM recomendacao;
DELETE FROM promocao;
DELETE FROM redeSocial_estabelecimento;
DELETE FROM contato_estabelecimento;
DELETE FROM opcional_estabelecimento;
DELETE FROM comida_estabelecimento;
DELETE FROM categoria_estabelecimento;
DELETE FROM musica_estabelecimento;
DELETE FROM avaliacao;
DELETE FROM favorito;

-- Resetar as sequências de autoincremento para cada tabela
ALTER TABLE categoria AUTO_INCREMENT = 1;
ALTER TABLE estiloMusica AUTO_INCREMENT = 1;
ALTER TABLE contato AUTO_INCREMENT = 1;
ALTER TABLE redeSocial AUTO_INCREMENT = 1;
ALTER TABLE comida AUTO_INCREMENT = 1;
ALTER TABLE diaSemana AUTO_INCREMENT = 1;
ALTER TABLE opcional AUTO_INCREMENT = 1;
ALTER TABLE usuario AUTO_INCREMENT = 1;
ALTER TABLE estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE horario AUTO_INCREMENT = 1;
ALTER TABLE recomendacao AUTO_INCREMENT = 1;
ALTER TABLE promocao AUTO_INCREMENT = 1;
ALTER TABLE redeSocial_estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE contato_estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE opcional_estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE comida_estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE categoria_estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE musica_estabelecimento AUTO_INCREMENT = 1;
ALTER TABLE avaliacao AUTO_INCREMENT = 1;
ALTER TABLE favorito AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;


-- INSERTS

-- ---------------------------- OPCIONAL -- INÍCIO

insert into OPCIONAL (id, nome) values (1, 'Faz entrega');
insert into OPCIONAL (id, nome) values (2, 'Entrega Grátis');
insert into OPCIONAL (id, nome) values (3, 'Toca Música');
insert into OPCIONAL (id, nome) values (4, 'Música ao Vivo');
insert into OPCIONAL (id, nome) values (5, 'Oferece Rodízio');
insert into OPCIONAL (id, nome) values (6, 'Precisa de Agendamento');
insert into OPCIONAL (id, nome) values (7, 'Possui Estacionamento');
insert into OPCIONAL (id, nome) values (8, 'Possui Área Kids');
insert into OPCIONAL (id, nome) values (9, 'Tem Wi-fi livre');
insert into OPCIONAL (id, nome) values (10, 'Permite Animais');
insert into OPCIONAL (id, nome) values (11, 'Couvert Grátis');
insert into OPCIONAL (id, nome) values (12, 'Tem taxa de 10%');
insert into OPCIONAL (id, nome) values (13, 'Possui Área de Fumantes');
insert into OPCIONAL (id, nome) values (14, 'Refeição no local');

-- ---------------------------- OPCIONAL -- FIM

-- ---------------------------- CATEGORIA -- INÍCIO

insert into categoria (id, nome) values (1, 'Lanchonete');
insert into categoria (id, nome) values (2, 'Pizzaria');
insert into categoria (id, nome) values (3, 'Hamburgueria');
insert into categoria (id, nome) values (4, 'Restaurante');
insert into categoria (id, nome) values (5, 'Pastelaria');
insert into categoria (id, nome) values (6, 'Barzinho');
insert into categoria (id, nome) values (7, 'Sorveteria');
insert into categoria (id, nome) values (8, 'Açaiteria');
insert into categoria (id, nome) values (9, 'Padaria');
insert into categoria (id, nome) values (10, 'Churrascaria');
insert into categoria (id, nome) values (11, 'Cafeteria');
insert into categoria (id, nome) values (12, 'Sushi bar');
insert into categoria (id, nome) values (13, 'Food truck');
insert into categoria (id, nome) values (14, 'Creperia');
insert into categoria (id, nome) values (15, 'Doceria');
insert into categoria (id, nome) values (16, 'Comida de rua');
insert into categoria (id, nome) values (17, 'Sucaria');
insert into categoria (id, nome) values (18, 'Fast Food');

-- ---------------------------- CATEGORIA -- INÍCIO

-- ---------------------------- COMIDA -- FIM

insert into comida (id, nome) values (1, 'Brasileira');
insert into comida (id, nome) values (2, 'Japonesa');
insert into comida (id, nome) values (3, 'Italiana');
insert into comida (id, nome) values (4, 'Mexicana');
insert into comida (id, nome) values (5, 'Indiana');
insert into comida (id, nome) values (6, 'Francesa');
insert into comida (id, nome) values (7, 'Árabe');


-- ---------------------------- COMIDA -- FIM

-- ---------------------------- ESTILO DE MÚSICA -- INÍCIO

insert into estilomusica (id, nome) values (1, 'Pagode');
insert into estilomusica (id, nome) values (2, 'Samba');
insert into estilomusica (id, nome) values (3, 'Funk');
insert into estilomusica (id, nome) values (4, 'Rock');
insert into estilomusica (id, nome) values (5, 'Pop');
insert into estilomusica (id, nome) values (6, 'Hip-Hop');
insert into estilomusica (id, nome) values (7, 'Reggae');
insert into estilomusica (id, nome) values (8, 'Eletrônica');
insert into estilomusica (id, nome) values (9, 'Country');
insert into estilomusica (id, nome) values (10, 'Jazz');
insert into estilomusica (id, nome) values (11, 'Blues');
insert into estilomusica (id, nome) values (12, 'R&B');
insert into estilomusica (id, nome) values (13, 'Clássica');
insert into estilomusica (id, nome) values (14, 'Reggaeton');
insert into estilomusica (id, nome) values (15, 'Metal');
insert into estilomusica (id, nome) values (16, 'Indie');
insert into estilomusica (id, nome) values (17, 'Rap');
insert into estilomusica (id, nome) values (18, 'Punk');
insert into estilomusica (id, nome) values (19, 'Blues Rock');
insert into estilomusica (id, nome) values (20, 'Alternativa');
insert into estilomusica (id, nome) values (21, 'Dance');
insert into estilomusica (id, nome) values (22, 'Folk');
insert into estilomusica (id, nome) values (23, 'Sertanejo');
insert into estilomusica (id, nome) values (24, 'K-pop');
insert into estilomusica (id, nome) values (25, 'Gospel');

-- ---------------------------- ESTILO DE MÚSICA -- FIM


-- ---------------------------- tipoContato -- INÍCIO

insert into contato values(1, 'Telefone');
insert into contato values(2, 'Celular');

-- ---------------------------- tipoContato -- FIM

-- ---------------------------- redeSocial -- INÍCIO

insert into redeSocial (id, nome) values (1, 'Facebook');
insert into redeSocial (id, nome) values (2, 'Instagram');
insert into redeSocial (id, nome) values (3, 'Twitter/X');
insert into redeSocial (id, nome) values (4, 'Site do Estabelecimento');
insert into redeSocial (id, nome) values (5, 'Cardápio Online');


-- ---------------------------- redeSocial -- FIM


-- ---------------------------- diaSemana -- INÍCIO

insert into diaSemana values (1, 'Domingo', 0);
insert into diaSemana values (2, 'Segunda-feira', 1);
insert into diaSemana values (3, 'Terça-feira', 2);
insert into diaSemana values (4, 'Quarta-feira', 3);
insert into diaSemana values (5, 'Quinta-feira', 4);
insert into diaSemana values (6, 'Sexta-feira', 5);
insert into diaSemana values (7, 'Sábado', 6);
insert into diaSemana values (8, 'Segunda a sexta-feira', 7);
insert into diaSemana values (9, 'Terça a sexta-feira', 8);
insert into diaSemana values (10, 'Final de semana', 9);

-- ---------------------------- diaSemana -- FIM



---------------------------- USUÁRIO WILLIAN -- INÍCIO


insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	1,                   -- id
	null,                -- idEstabelecimento
    'Willian Soares Ribeiro',-- nome
	'15971161518',       -- celular
    '00415975085',       -- cpf
    'willian@gmail.com', -- email
    '123456',          -- senha
	'jpeg',                -- fotoPerfil
    '2000-09-24',        -- dataNascimento
	0,                    -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	97, -- numeroResidencia  VARCHAR(9),
	'Rua João Serrano', -- logradouro        VARCHAR(200),
	'Jardim Serrano', -- bairro            VARCHAR(200),
	'Votorantim', -- cidade            VARCHAR(200),
	'SP', -- estado            VARCHAR(200),
	'18117130', -- cep               VARCHAR(9)
	-23.5635557, 
	-47.45699630000001
);

---------------------------- USUÁRIO WILLIAN -- FIM



---------------------------- USUÁRIO LUCAS -- INÍCIO

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	2,                   -- id
	null,                -- idEstabelecimento
    'Lucas Maximiano dos Santos',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'lucas@gmail.com',   -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '2000-05-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do Lucas', -- lodradouro not null,
	'Bairro do Lucas', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'1112233', -- cep not null,
	null,
	null
);

---------------------------- USUÁRIO LUCAS -- FIM



---------------------------- USUÁRIO ADM JULIO -- INÍCIO

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	3,                       -- id
	null,                    -- idEstabelecimento
    'Julio Cesar de Castro',           -- nome
	'15999999999',               -- celular
    '11122233344',           -- cpf
    'adm@betterchoice.com', -- email
    '123456',              -- senha
	null,                    -- fotoPerfil
    '1989-09-24',            -- dataNascimento
	2, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------- USUÁRIO ADM JULIO -- FIM


-- -------------------------------------------------------------------------------------> Usuários Comuns

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	4,                   -- id
	null,                -- idEstabelecimento
    'Ricarda Olinda Sanches',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'ricarda@gmail.com',   -- email
    '123456',          -- senha
	'png',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	5,                   -- id
	null,                -- idEstabelecimento
    'Julia Rodrigues',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'julia@gmail.com',   -- email
    '123456',          -- senha
	'jpg',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	6,                   -- id
	null,                -- idEstabelecimento
    'Andrezza Santos',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'andrezza@gmail.com',   -- email
    '123456',          -- senha
	'jpg',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	7,                   -- id
	null,                -- idEstabelecimento
    'Talie Lie Mioka',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'talie@gmail.com',   -- email
    '123456',          -- senha
	'jpg',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	8,                   -- id
	null,                -- idEstabelecimento
    'Luiza Becker',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'luiza@gmail.com',   -- email
    '123456',          -- senha
	'jpg',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	9,                   -- id
	null,                -- idEstabelecimento
    'Carmen Liza Oliveira',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'carmen@gmail.com',   -- email
    '123456',          -- senha
	'jpg',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	10,                   -- id
	null,                -- idEstabelecimento
    'Maria Eduarda da Rosa',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'maria@gmail.com',   -- email
    '123456',          -- senha
	'jpg',                -- fotoPerfil
    '2000-01-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do usuario', -- lodradouro not null,
	'Bairro do usuario', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'18030000', -- cep not null,
	null, -- latitude
	null  -- longitude
);

