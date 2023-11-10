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
insert into categoria (id, nome) values (19, 'Salgaderia');

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
insert into estilomusica (id, nome) values (26, 'Anos 90');

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

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	11,                   -- id
	null,                -- idEstabelecimento
    'Gilberto Queiroz',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'gilberto@gmail.com',   -- email
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
	12,                   -- id
	null,                -- idEstabelecimento
    'Carlos Roberto Matsunaga',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'carlos@gmail.com',   -- email
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
	13,                   -- id
	null,                -- idEstabelecimento
    'Henrique Luiz Garcia',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'henrique@gmail.com',   -- email
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
	14,                   -- id
	null,                -- idEstabelecimento
    'Mateus Miguel da Cunha',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'mateus@gmail.com',   -- email
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
	15,                   -- id
	null,                -- idEstabelecimento
    'Romilton Carlos Pereira',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'romilton@gmail.com',   -- email
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
	16,                   -- id
	null,                -- idEstabelecimento
    'Ricardo Gomes Barbosa',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'ricardo@gmail.com',   -- email
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
	17,                   -- id
	null,                -- idEstabelecimento
    'Gustavo Mario Cardoso',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'gustavo@gmail.com',   -- email
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
	18,                   -- id
	null,                -- idEstabelecimento
    'Cesar Ribeiro Almeida',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'cesar@gmail.com',   -- email
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
	19,                   -- id
	null,                -- idEstabelecimento
    'Julio Alves',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'julio@gmail.com',   -- email
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
	20,                   -- id
	null,                -- idEstabelecimento
    'Pedro Castro Moraes',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'pedro@gmail.com',   -- email
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















-- --> CADASTRO DE ESTABELECIMENTOS ---- INÍCIO

-- --------------------------> ID: 01 PADARIA REAL ---- INÍCIO

insert into estabelecimento values(
	1, -- id 
	'Padaria Real', -- nome
	'95638013000105', -- cnpj
	'png', -- fotoPrincipal   
	'A Padaria Real é um charmoso estabelecimento que encanta os clientes com seu aroma irresistível de pães e doces frescos. Aqui você prova salgados, como a famosa coxinha, pães artesanais, rodízio de pizzas no jantar em nossa rede sofisticada e moderna de padarias.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'2650', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Eng. Carlos Reinaldo Mendes', -- logradouro             VARCHAR(200) not null,
	'Alto da Boa Vista', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18013280', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, status, dataInicio, dataFim) VALUES (
	1, -- idEstabelecimento
	'Coxinha pela metade do preço', -- nome
	'Ao comprar uma coxinha a segunda sai pela metade do preço ao mostrar o código na hora da compra.', -- descricao
	'COXINHA-REAL', -- codigo
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa'
	'2023-11-09', -- dataInicio
	'2023-12-20' -- dataFim
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    5, -- idUsuario
	1, -- idEstabelecimento
	'Amo essa padaria! Melhor coxinha da cidade com toda certeza <3', -- descricao
	'2023-11-09', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    9, -- idUsuario
	1, -- idEstabelecimento
	'Muito bom', -- descricao
	'2023-11-02', -- data
	4 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    18, -- idUsuario
	1, -- idEstabelecimento
	'Sempre que tenho a oportunidade vou até essa padaria. Muito boa mesmo.', -- descricao
	'2023-11-09', -- data
	5 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    1, -- idEstabelecimento INT NOT NULL,
    9 -- idCategoria INT NOT NULL -- PADARIA
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    7 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    9 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	21,                   -- id
	1,                -- idEstabelecimento
    'José Carlos Santos',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@padariareal.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	1, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	063000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final da Semana
	1, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	063000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	1,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1532349486',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/PadariaRealPaginaOficial/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/padariareal_oficial/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://padariareal.com.br/lojas/real-boa-vista/' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	1, -- id
	1, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'A Coxinha da Real', -- nome VARCHAR(50) not null,
	'Nossa classica coxinha é com certeza uma das melhores de Sorocaba.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	2, -- id
	1, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Pão Francês Quentinho', -- nome VARCHAR(50) not null,
	'Temos deliciosos e macios pães franceses o dia todo.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	3, -- id
	1, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Cappuccino da Real', -- nome VARCHAR(50) not null,
	'Venha provar nosso delicioso Cappuccino e outros diversos cafés.'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 01 PADARIA REAL ---- FIM


-- --------------------------> ID: 02 PIZZARIA RAMAL 10 ---- INÍCIO

insert into estabelecimento values(
	2, -- id 
	'Pizzia Ramal 10', -- nome
	'95638013000105', -- cnpj
	'jpeg', -- fotoPrincipal   
	'Gastronomia casual de pizzas variadas e chope, em ambiente despojado com salão privativo e mesas ao ar livre.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'1361', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Aparecida', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Rosália', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18095000', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    7, -- idUsuario
	2, -- idEstabelecimento
	'Muito bom!!', -- descricao
	'2023-11-02', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    12, -- idUsuario
	2, -- idEstabelecimento
	'O rodízio deles é incrível', -- descricao
	'2023-10-26', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    8, -- idUsuario
	2, -- idEstabelecimento
	'Odiei o atendimento do garçom', -- descricao
	'2023-10-22', -- data
	1 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    2, -- idEstabelecimento INT NOT NULL,
    2 -- idCategoria INT NOT NULL -- PIZZARIA
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    2, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    2, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    2, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	22,                   -- id
	1,                -- idEstabelecimento
    'Luiz Antonio Souza e Dias',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@ramal10.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values(
	2, -- idEstabelecimento INT not null,
	9, -- idDiaSemana INT not null,                 --- terça a sexta
	180000, -- horarioInicio TIME not null,
	233000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values(
	2, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,                 --- final de semana
	180000, -- horarioInicio TIME not null,
	233000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	2,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1532177126',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	2,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1532339301',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	2,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/ramal10pizzaria/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	2,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/ramal10pizzaria/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	2,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://ramal10.com.br' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	2,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://ramal10.com.br/pizzas.html' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	4, -- id
	2, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Pizza de Frango com Catupiry', -- nome VARCHAR(50) not null,
	'A clássica pizza de frango com catupiry da casa é para todos os gostos.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	5, -- id
	2, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Pizza Portuguesa', -- nome VARCHAR(50) not null,
	'Experimente essa delícia, a Pizza Portuguesa da Ramal 10 é espetacular.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	6, -- id
	2, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Pizzas doces com sorvete', -- nome VARCHAR(50) not null,
	'Temos grande variedade de pizza doce e todas podem ser acompanhadas de bolas de sorvete de massa.'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 02 PIZZARIA RAMAL 10 ---- FIM

-- --------------------------> ID: 03 BAFF'S FATEC ---- INÍCIO

insert into estabelecimento values(
	3, -- id 
	"Baff's Fatec", -- nome
	'95638013000105', -- cnpj
	'png', -- fotoPrincipal   
	'Com opções deliciosas e apaixonantes, contamos com um cardápio completo para agradar todos os gostos, desde os que gostam de um café expresso até os que não conseguem resistir a um donuts bem recheado.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'2015', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Eng. Carlos Reinaldo Mendes', -- logradouro             VARCHAR(200) not null,
	'Além Ponte', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18013280', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    15, -- idUsuario
	3, -- idEstabelecimento
	'Os preços são muito altos', -- descricao
	'2023-10-12', -- data
	1 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    16, -- idUsuario
	3, -- idEstabelecimento
	"Gosto dos salgados do Baff's", -- descricao
	'2023-11-20', -- data
	4 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    3, -- idEstabelecimento INT NOT NULL,
    11 -- idCategoria INT NOT NULL -- CAFETERIA
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    3, -- idEstabelecimento INT NOT NULL,
    19 -- idCategoria INT NOT NULL -- CAFETERIA
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    3, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- refeição no local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	23,                   -- id
	3,                -- idEstabelecimento
    'Renato Siqueira',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@baffs.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( 
	3, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	070000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	3,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://baffs.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	3,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://baffs.com.br/produtos/' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	7, -- id
	3, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Coxinhas assadas', -- nome VARCHAR(50) not null,
	'Experiemente uma de nossas coxinhas e vai se apaionar!'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	8, -- id
	3, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	"Baff's Burguer", -- nome VARCHAR(50) not null,
	'Que tal um hamburguer? Temos também!'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	9, -- id
	3, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	"Porção de Pães de Queijo", -- nome VARCHAR(50) not null,
	'Melhor pão de queijo da Fatec Sorocaba!'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 03 BAFF'S FATEC ---- FIM

-- --------------------------> ID: 04 Kostela do Japones ---- INÍCIO

insert into estabelecimento values(
	4, -- id 
	'Kostela do Japonês', -- nome
	'95638013000105', -- cnpj
	'png', -- fotoPrincipal   
	'Aclamada costela na brasa, além de outros cortes de carne, buffet de saladas e acompanhamentos e amplo salão.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'2970', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Eng. Carlos Reinaldo Mendes', -- logradouro             VARCHAR(200) not null,
	'Além Ponte', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18013280', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    5, -- idUsuario
	4, -- idEstabelecimento
	"A marmitex de costela é a minha preferida", -- descricao
	'2023-10-23', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    13, -- idUsuario
	4, -- idEstabelecimento
	"Comi lá algumas vezes, gostei.", -- descricao
	'2023-10-23', -- data
	3 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    4, -- idEstabelecimento INT NOT NULL,
    10 -- idCategoria INT NOT NULL -- CHURRASCARIA
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    4, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- RESTAURANTE
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    4, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    4, -- idEstabelecimento INT NOT NULL,
    12 -- idOpcional INT NOT NULL -- taxa 10%
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    4, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- faz entrega
);

insert into comida_estabelecimento (idEstabelecimento, idComida) values(
    4, -- idEstabelecimento INT NOT NULL,
    1 -- idComida INT NOT NULL -- faz entrega
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	24,                   -- id
	4,                -- idEstabelecimento
    'Eduardo Rubio Limeira',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@kosteladojapones.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	4, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de semana
	4, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	160000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	4,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1532286902',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	4,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- TELEFONE
	'15974045227',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	4,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/kosteladojapones/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	4,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/kosteladojapones_sorocaba/' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	10, -- id
	4, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Super Costela na Brasa', -- nome VARCHAR(50) not null,
	'Nosso carro chefe! A famosa costela do japonês.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	11, -- id
	4, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Contrafilé assado', -- nome VARCHAR(50) not null,
	'Saboreie essa suculenta carne assada para todos os gostos.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	12, -- id
	4, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Marmitex de Carne Assada', -- nome VARCHAR(50) not null,
	'Temos também opções variádas de marmitex com carne assada.'-- descricao VARCHAR(50) not null
);



-- --------------------------> ID: 04 Kostela do Japones ---- FIM


-- --------------------------> ID: 05 Restaurante da Fazenda ---- INÍCIO

insert into estabelecimento values(
	5, -- id 
	'Restaurante da Fazenda', -- nome
	'95638013000105', -- cnpj
	'png', -- fotoPrincipal   
	'Restaurante especializado em culinária caipira. Buffet com pratos quentes, saladas, frios, massas e muito mais.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'171', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Estrada Heitor Cury', -- logradouro             VARCHAR(200) not null,
	'SP-270', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18052775', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, status, dataInicio, dataFim) VALUES (
	5, -- idEstabelecimento
	'Aniversariante não paga', -- nome
	'Se trouxer mais 8 amigos na semana do seu aniversário o seu sai de graça', -- descricao
	'ANIVER-FAZENDA', -- codigo
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa'
	'2023-09-01', -- dataInicio
	'2023-12-31' -- dataFim
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    1, -- idUsuario
	5, -- idEstabelecimento
	"O rodízio deles é fenomenal!", -- descricao
	'2023-10-25', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    7, -- idUsuario
	5, -- idEstabelecimento
	"Gostei muito das pizzas e sobremesas", -- descricao
	'2023-10-19', -- data
	4 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    5, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- RESTAURANTE
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    5, -- idEstabelecimento INT NOT NULL,
    2 -- idCategoria INT NOT NULL -- PIZZARIA
);

insert into comida_estabelecimento (idEstabelecimento, idComida) values(
    5, -- idEstabelecimento INT NOT NULL,
    1 -- idComida INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL -- rodízio
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    6 -- idOpcional INT NOT NULL -- agendamento
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    7 -- idOpcional INT NOT NULL -- estacionamento
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	25,                   -- id
	5,                -- idEstabelecimento
    'Gilmar Mendes',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@restaurantefazenda.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	5, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	5, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de semana
	5, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	160000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de semana
	5, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	5,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1533213672',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	5,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/RestauranteDaFazendaSorocaba' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	5,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/restaurante_fazenda_sorocaba/?hl=pt' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	13, -- id
	5, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Comidas caipiras', -- nome VARCHAR(50) not null,
	'Temos grande variedade de comidas de culinária caipira tradicional.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	14, -- id
	5, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Pizzas', -- nome VARCHAR(50) not null,
	'Deliciosas pizzas de diversos sabores'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	15, -- id
	5, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Sobremesas', -- nome VARCHAR(50) not null,
	'Nosso rodízio conta com uma infinidade de sobremesas como pudins e doces de caseiros típicos.'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 05 Restaurante da Fazenda ---- FIM

-- --------------------------> ID: 06 Oca Burguer ---- INÍCIO


insert into estabelecimento values(
	6, -- id 
	'Oca Burguer', -- nome
	'95638013000105', -- cnpj
	'jpg', -- fotoPrincipal   
	'Selecionamos cuidadosamente os melhores ingredientes diariamente e preparamos tudo na hora para os nossos pedidos. Sejam nos burgers, batatas, shakes, saladas ou sucos o resultado é o sabor incomparável que você já conhece!', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'957', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Vinte e Oito de Outubro', -- logradouro             VARCHAR(200) not null,
	'Jardim do Paço', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18087080', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    8, -- idUsuario
	6, -- idEstabelecimento
	"Os lanches deles são muitooooo bons!!", -- descricao
	'2023-10-14', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    17, -- idUsuario
	6, -- idEstabelecimento
	"Gosto das porções de lá", -- descricao
	'2023-09-11', -- data
	4 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    6, -- idEstabelecimento INT NOT NULL,
    1 -- idCategoria INT NOT NULL -- PADARIA
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    6, -- idEstabelecimento INT NOT NULL,
    3 -- idCategoria INT NOT NULL -- PADARIA
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    6, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    6, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	26,                   -- id
	6,                -- idEstabelecimento
    'Karla Rosnin',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@ocaburguer.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	6, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	233000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de semana
	6, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	233000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	6,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1530342949',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/ocaburger/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/ocaburger/?hl=pt' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.ocaburger.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	16, -- id
	6, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Combos com hamburgueres', -- nome VARCHAR(50) not null,
	'Que tal nossos deliciosos lanches da casa acompanhados de porções de batatas'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	17, -- id
	6, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Porções de Batatas', -- nome VARCHAR(50) not null,
	'Temos porções de batatas para todos os gostos'-- descricao VARCHAR(50) not null
);


insert into recomendacao values(
	18, -- id
	6, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Shakes Oca', -- nome VARCHAR(50) not null,
	'E de sobremesa vai um shake?'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 06 Oca Burguer ---- FIM

-- --------------------------> ID: 07 Bar da Garagem ---- INÍCIO

insert into estabelecimento values(
	7, -- id 
	'Bar da Garagem', -- nome
	'95638013000105', -- cnpj
	'jpg', -- fotoPrincipal   
	'Aqui você curte uma deliciosa noite de sexta, com banda de rock, porções, cerveja e chopp artesanal.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'122', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Direitos Humanos', -- logradouro             VARCHAR(200) not null,
	'Jardim do Paço', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18087082', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    7, -- idUsuario
	7, -- idEstabelecimento
	"Não gostei da segurança do lugar", -- descricao
	'2023-11-12', -- data
	3 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    18, -- idUsuario
	7, -- idEstabelecimento
	"Esse lugar é animal", -- descricao
	'2023-10-27', -- data
	5 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    7, -- idEstabelecimento INT NOT NULL,
    6 -- idCategoria INT NOT NULL -- PADARIA
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    7, -- idEstabelecimento INT NOT NULL,
    3 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    7, -- idEstabelecimento INT NOT NULL,
    4 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    7, -- idEstabelecimento INT NOT NULL,
    6 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    7, -- idEstabelecimento INT NOT NULL,
    7 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    7, -- idEstabelecimento INT NOT NULL,
    13 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    7, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	7, -- idEstabelecimento INT not null,
	4 -- idEstiloMusica    INT not null
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	27,                   -- id
	1,                -- idEstabelecimento
    'Elias Rui Manganês',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@bargaragem.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values(
	7, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	200000, -- horarioInicio TIME not null,
	030000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values(
	7, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	200000, -- horarioInicio TIME not null,
	030000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values(
	7, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	160000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values(
	7, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	160000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	7,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- TELEFONE
	'15998219909',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	7,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/bardagaragemsorocaba/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	7,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/bardagaragemsorocaba/' -- redeSocial VARCHAR(200) not null
);


insert into recomendacao values(
	19, -- id
	7, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Prato executivo', -- nome VARCHAR(50) not null,
	'Bateu aquela fome? Um prato executivo resolve'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	20, -- id
	7, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Drinks de fruta', -- nome VARCHAR(50) not null,
	'Temos deliciosos drinks de frutas'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	21, -- id
	7, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Drinks Especiais', -- nome VARCHAR(50) not null,
	'Também temos drinks especiais'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 07 Bar da Garagem ---- FIM

-- --------------------------> ID: 08 O Rei Dos Defumados ---- INÍCIO

insert into estabelecimento values(
	8, -- id 
	'O Rei Dos Defumados', -- nome
	'95638013000105', -- cnpj
	'jpg', -- fotoPrincipal   
	'THE BEST BBQ IN SOROCABA', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'790', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Aparecida', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Rosália', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18095000', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, status, dataInicio, dataFim) VALUES (
	8, -- idEstabelecimento
	'Costelinha no Barbecue', -- nome
	'Ganhe um super desconto na nossa Costelinha no Barbecue ao apresentar o código do cupom.', -- descricao
	'COSTELINHA-NO-BARBECUE', -- codigo
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa'
	'2023-11-10', -- dataInicio
	'2023-12-10' -- dataFim
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    7, -- idUsuario
	8, -- idEstabelecimento
	"Eles tem todas as carnes que você imaginar e eu amo todas elas", -- descricao
	'2023-11-07', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    9, -- idUsuario
	8, -- idEstabelecimento
	"Fiquei encantada com a grande variedade de carnes", -- descricao
	'2023-11-04', -- data
	5 -- nota
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    11, -- idUsuario
	8, -- idEstabelecimento
	"Erraram no ponto da minha carne por duas vezes", -- descricao
	'2023-11-04', -- data
	2 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    8, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    8, -- idEstabelecimento INT NOT NULL,
    10 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    8, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    8, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- faz entrega
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	28,                   -- id
	8,                -- idEstabelecimento
    'Ronnie Manchester',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@reidefumados.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Terça a sexta
	8, -- idEstabelecimento INT not null,
	9, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de semana
	8, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quinta
	8, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sexta
	8, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	8, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	8,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- TELEFONE
	'15991500199',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	8,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/oreidosdefumados/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	8,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/oreidosdefumados/?hl=pt' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	22, -- id
	8, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Carnes na brasa', -- nome VARCHAR(50) not null,
	'Temos todo tipo de carne assada que imaginar'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	23, -- id
	8, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Ribs Burguer', -- nome VARCHAR(50) not null,
	'Pega essa delicia, nosso Ribs Burguer!'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	24, -- id
	8, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Combos', -- nome VARCHAR(50) not null,
	'Quer um pouco de tudo? Temos também!'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 08 O Rei Dos Defumados ---- FIM

-- --------------------------> ID: 09 Padaria & Confeitaria Colonial ---- INÍCIO

insert into estabelecimento values(
	9, -- id 
	'Padaria & Confeitaria Colonial', -- nome
	'95638013000105', -- cnpj
	'jpg', -- fotoPrincipal   
	'Pão quentinho, bolos deliciosos, refeições saborosas e muito mais.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'1095', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Eng. Carlos Reinaldo Mendes', -- logradouro             VARCHAR(200) not null,
	'Além Ponte', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	' 18013280', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    7, -- idUsuario
	9, -- idEstabelecimento
	"Eu amo mesmo os bolos de pote deles", -- descricao
	'2023-10-04', -- data
	5 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    9, -- idEstabelecimento INT NOT NULL,
    9 -- idCategoria INT NOT NULL -- PADARIA
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    9, -- idEstabelecimento INT NOT NULL,
    15 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    9, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    9, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	29,                   -- id
	9,                -- idEstabelecimento
    'Antônio Batista',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@padariacolonial.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	9, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	060000, -- horarioInicio TIME not null,
	190000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	9, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	060000, -- horarioInicio TIME not null,
	190000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Domingo
	9, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	060000, -- horarioInicio TIME not null,
	120000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	9,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'15981524100',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	9,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/colonialpadariaconfeitaria/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	9,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/colonialpadariaoficial/' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	25, -- id
	9, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Café da Colonial', -- nome VARCHAR(50) not null,
	'Temos deliciosos cafés fresquinhos para alegrar o seu dia'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	26, -- id
	9, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Salgados', -- nome VARCHAR(50) not null,
	'Salgados de todo o tipo, para festas e para matar a fome'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	27, -- id
	9, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Doces e confeitarias', -- nome VARCHAR(50) not null,
	'Os mais diversos e mais deliciosos doces feitos com muito carinho'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 09 Padaria & Confeitaria Colonial ---- FIM


-- --------------------------> ID: 10 Kaishi Sushi Sorocaba ---- INÍCIO

insert into estabelecimento values(
	10, -- id 
	'Kaishi Sushi Sorocaba', -- nome
	'95638013000105', -- cnpj
	'jpg', -- fotoPrincipal   
	'Restaurante de culinária japonesa de Sorocaba', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'362', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. São Francisco', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Rosália', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18095450', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, status, dataInicio, dataFim) VALUES (
	10, -- idEstabelecimento
	'Barca de sushi 10% off', -- nome
	'Apresente o código da promoção no momento da finalização da compra e desconto de 10% na super barca de sushi.', -- descricao
	'BARCA-KAISHI', -- codigo
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa'
	'2023-11-10', -- dataInicio
	'2023-12-10' -- dataFim
);

insert into avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values(
    11, -- idUsuario
	10, -- idEstabelecimento
	"Gosto dos sushis e sashimis de lá", -- descricao
	'2023-10-02', -- data
	4 -- nota
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    10, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- PADARIA
);

insert into comida_estabelecimento (idEstabelecimento, idComida) values(
    10, -- idEstabelecimento INT NOT NULL,
    2   -- idComida INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    10, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    10, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL -- rodízio
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    10, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- rodízio
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	30,                   -- id
	10,                -- idEstabelecimento
    'Lucas Kazuo Sakano',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'contato@kaishi.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-01-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de Semana
	10, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	120000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	10, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	143000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	10, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	10,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'1532111218',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	10,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/kaishisushisantarosalia/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	10,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/kaishisorocaba/' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	28, -- id
	10, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Combo Japonês', -- nome VARCHAR(50) not null,
	'Temos os mais variádos combos de comida japonesa'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	29, -- id
	10, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Sushi', -- nome VARCHAR(50) not null,
	'Os mais clássicos sushis da casa'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	30, -- id
	10, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Drinks', -- nome VARCHAR(50) not null,
	'Para acompanhar seu sushi que tal um de nossos drinks?'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 10 Kaishi Sushi Sorocaba ---- FIM


-- --------------------------> ID: 11 Empório d'os Alemão ---- INÍCIO

insert into estabelecimento values(
	11, -- id 
	"Empório d'os Alemão", -- nome
	'49836598000142', -- cnpj
	'jpg', -- fotoPrincipal   
	'O mais novo Empório, Café, Bar e Restaurante da região! Colecione momentos marcantes com pessoas especiais e sabores requintados.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'885', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Carlos Sonetti', -- logradouro             VARCHAR(200) not null,
	'Jardim Prestes de Barros', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18021200', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    11, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- Restaurante
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    11, -- idEstabelecimento INT NOT NULL,
    6 -- idCategoria INT NOT NULL -- Barzinho
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    11, -- idEstabelecimento INT NOT NULL,
    11 -- idCategoria INT NOT NULL -- Cafeteria
);

insert into comida_estabelecimento (idEstabelecimento, idComida) values(
    11, -- idEstabelecimento INT NOT NULL,
    1   -- idComida INT NOT NULL -- Brasileira
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    11, -- idEstabelecimento INT NOT NULL,
    3 -- idOpcional INT NOT NULL -- musica ao vivo
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    11, -- idEstabelecimento INT NOT NULL,
    4 -- idOpcional INT NOT NULL -- musica ao vivo
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    11, -- idEstabelecimento INT NOT NULL,
    6 -- idOpcional INT NOT NULL -- Precisa de agendamento
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    11, -- idEstabelecimento INT NOT NULL,
    8 -- idOpcional INT NOT NULL -- Possui area kids
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    11, -- idEstabelecimento INT NOT NULL,
    12 -- idOpcional INT NOT NULL -- Tem taxa de 10%
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	13 -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	1 -- idEstiloMusica    INT not null    
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	2 -- idEstiloMusica    INT not null    
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	4 -- idEstiloMusica    INT not null    
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	23 -- idEstiloMusica    INT not null    
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	20 -- idEstiloMusica    INT not null    
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	11, -- idEstabelecimento INT not null,
	5 -- idEstiloMusica    INT not null    
);
    
insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	31,                   -- id
	11,                -- idEstabelecimento
    'Nelson Santos',           -- nome
	'15971161518',           -- celular
    '00415975085',       -- cpf
    'Nelson@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '2000-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final de Semana
	11, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	140000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	170000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	140000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	170000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	140000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	11, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	160000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	11,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- TELEFONE
	'1533429232',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	11,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'15991208864',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	11,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/emporiodosalemao/about_details?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	11,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/emporiodosalemao/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	11,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://menu.kcms.app/8465e36e-1eca-4140-8cb2-7493d5c48834/cardapio/visualizar' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	31, -- id
	11, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Batata Frita grande com Cheddar e Bacon', -- nome VARCHAR(50) not null,
	'Batata Frita Grande com Cheddar e Bacon 700g'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	32, -- id
	11, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Costelinha de Porco com Fritas', -- nome VARCHAR(50) not null,
	'400g costelinha de porco com molho barbecue'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	33, -- id
	11, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Tabua do Alemão', -- nome VARCHAR(50) not null,
	'200g de batata frita, 200g de polenta, 200g de mandioca e 12 mini pastéis( Carne, frango, queijo e pizza).'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 11 Empório d'os Alemão ---- FIM


-- --------------------------> ID: 12 New York Bar 41 ---- INÍCIO


insert into estabelecimento values(
	12, -- id 
	"New York Bar 41", -- nome
	'20.093.230/0001-50', -- cnpj
	'png', -- fotoPrincipal   
	'Cervejas, drinques e porções em bar com temática de Nova York, ambiente descontraído e bandas ao vivo.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'390', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Carlos Sonetti', -- logradouro             VARCHAR(200) not null,
	'Jardim Prestes de Barros', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18021200', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    12, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- Restaurante
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    12, -- idEstabelecimento INT NOT NULL,
    6 -- idCategoria INT NOT NULL -- Barzinho
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    12, -- idEstabelecimento INT NOT NULL,
    3 -- idCategoria INT NOT NULL -- Lanchonete
);

insert into comida_estabelecimento (idEstabelecimento, idComida) values(
    12, -- idEstabelecimento INT NOT NULL,
    1   -- idComida INT NOT NULL -- Brasileira
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    12, -- idEstabelecimento INT NOT NULL,
    3 -- idOpcional INT NOT NULL -- musica ao vivo
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    12, -- idEstabelecimento INT NOT NULL,
    4 -- idOpcional INT NOT NULL -- musica ao vivo
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    12, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- Faz Entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    12, -- idEstabelecimento INT NOT NULL,
    8 -- idOpcional INT NOT NULL -- Possui area kids
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    12, -- idEstabelecimento INT NOT NULL,
    6 -- idOpcional INT NOT NULL -- Precisa de agendamento
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	12, -- idEstabelecimento INT not null,
	5 -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	12, -- idEstabelecimento INT not null,
	4 -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	12, -- idEstabelecimento INT not null,
	2 -- idEstiloMusica    INT not null
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	32,                   -- id
	12,                -- idEstabelecimento
    'João Vitor Braguin Alves',           -- nome
	'15971161518',           -- celular
    '00415975085',       -- cpf
    'Joao_vitor@hotmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1980-07-26',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	12, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	170000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	12, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	170000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	12, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	170000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	12, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	170000, -- horarioInicio TIME not null,
	010000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	12, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	130000, -- horarioInicio TIME not null,
	010000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	12, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	153000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	12,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- TELEFONE
	'1533588001',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	12,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'15996842933',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	12,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/newyorkbar41?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	12,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/newyorkbar41/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	12,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://acesse.dev/6yYxJ' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	34, -- id
	12, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Smash Burguer', -- nome VARCHAR(50) not null,
	'Comece sua semana com sabor! Nosso smash burger está prontinho para te conquistar. Já fez sua reserva ou pediu o seu pelo delivery?'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	35, -- id
	12, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Feijoada', -- nome VARCHAR(50) not null,
	'Sábado é o dia sagrado da feijoada! Aqui, você pode desfrutar de nossa deliciosa feijuca até saborear até o último pedacinho!'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	36, -- id
	12, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Gin Tônica', -- nome VARCHAR(50) not null,
	'Aqui todo dia é dia de gin tônica em dobro! A partir das 18h, você pode aproveitar esse clássico dos coquetéis em dobro. Venha experimentar!'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 12 New York Bar 41 ---- FIM


-- --------------------------> ID: 13 Turaça Pastelaria ---- INÍCIO

insert into estabelecimento values(
	13, -- id 
	"Turaça Pastelaria", -- nome
	'41.575.185/0001-40', -- cnpj
	'jpg', -- fotoPrincipal   
	'Turaça Pastelaria, Pasteis doces e Salgados', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'1190', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Pedro José Senger', -- logradouro             VARCHAR(200) not null,
	'Vila Haro', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18015000', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    13, -- idEstabelecimento INT NOT NULL,
    5 -- idCategoria INT NOT NULL -- Pastelaria
);

insert into comida_estabelecimento (idEstabelecimento, idComida) values(
    13, -- idEstabelecimento INT NOT NULL,
    1   -- idComida INT NOT NULL -- Brasileira
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    13, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    13, -- idEstabelecimento INT NOT NULL,
    8 -- idOpcional INT NOT NULL -- Possui area kids
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    13, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- Refeição no local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	33,                   -- id
	13,                -- idEstabelecimento
    'RICARDO RUSSINI TURACA',           -- nome
	'15971161518',           -- celular
    '00415975085',       -- cpf
    'turacapastelaria@yahoo.com.br', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1970-02-06',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	13, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	163000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda-feira
	13, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	163000, -- horarioInicio TIME not null,
	223000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	13,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'15996908523',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	13,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'15988003914',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	13,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.facebook.com/turacapastelaria/?locale=pt_BR' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	12,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://acesse.dev/6yYxJ' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	37, -- id
	13, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Time Salgado ou Doce', -- nome VARCHAR(50) not null,
	'Delicioso pastel de carne cheddar e bacon ou Nutella confete'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	38, -- id
	13, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Ninho com Paçoca', -- nome VARCHAR(50) not null,
	'Delicioso pastel com recheio de ninho com paçoca, Sensacional!'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	39, -- id
	13, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Especial de Frango', -- nome VARCHAR(50) not null,
	'Pastel especial de Frango, muito TOP, venham Experimentar!'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 13 Turaça Pastelaria ---- FIM


-- --------------------------> ID: 50 N&N Lanches ---- INÍCIO

insert into estabelecimento values(
	50, -- id 
	'N&N Lanches', -- nome
	'03025090000163', -- cnpj
	'png', -- fotoPrincipal   
	'Venham experimentar nossos deliciosos lanches! Esperamos você!', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'21', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Barretos', -- logradouro             VARCHAR(200) not null,
	'Vila Nova Sorocaba', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18070810', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-08', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    50, -- idEstabelecimento INT NOT NULL,
    1 -- idCategoria INT NOT NULL -- LANCHONETE
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    50, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    50, -- idEstabelecimento INT NOT NULL,
    2 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    50, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL
);


insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	70,                   -- id
	50,                -- idEstabelecimento
    'Neri Motta',           -- nome
	'15981222017',           -- celular
    '00697958000',       -- cpf
    'nn_lanches@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1978-02-28',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- terça a sexta
	50, -- idEstabelecimento INT not null,
	9, -- idDiaSemana INT not null,
	184500, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Final da Semana
	50, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	184500, -- horarioInicio TIME not null,
	010000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	50,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- CELULAR
	'15981222017',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	50,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://web.facebook.com/NN.Lanches?_rdc=1&_rdr' -- redeSocial VARCHAR(200) not null
);



insert into recomendacao values(
	70, -- id
	50, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'X-Tudo', -- nome VARCHAR(50) not null,
	'Dois pães, maionese, catchup, mostarda, tomate, milho, batata palha, hambúrguer, calabresa, bacon, frango desfiado, ovo, salsicha, presunto
	e dois queijos (um sendo mussarela e o outro escolher entre requeijão cremoso ou cheddar).'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 50 N&N Lanches ---- FIM


-- --------------------------> ID: 51 Premium burger & bar ---- INÍCIO

insert into estabelecimento values(
	51, -- id 
	'Premium burger & bar', -- nome
	'42806324000161', -- cnpj
	'jpg', -- fotoPrincipal   
	'O lugar perfeito onde os sabores se encontram com a diversão em um ambiente acolhedor e descontraído.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'2139', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Los Angeles', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18076005', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-08', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    51, -- idEstabelecimento INT NOT NULL,
    3 -- idCategoria INT NOT NULL -- HAMBURGUERIA
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    51, -- idEstabelecimento INT NOT NULL,
    6 -- idCategoria INT NOT NULL -- BARZINHO
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    51, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    51, -- idEstabelecimento INT NOT NULL,
    3 -- idOpcional INT NOT NULL -- Toca musica
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	51, -- idEstabelecimento INT not null,
	4 -- idEstiloMusica    INT not null
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    51, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values (
	51, -- idEstabelecimento INT not null,
	26 -- idEstiloMusica    INT not null
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	71,                   -- id
	51,                -- idEstabelecimento
    'Mayanne Lira Moreira Dias',           -- nome
	'15991915890',           -- celular
    '90072250062',       -- cpf
    'premiumburgerebar@outlook.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1991-01-31',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quarta
	51, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	190000, -- horarioInicio TIME not null,
	235900  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quinta
	51, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	190000, -- horarioInicio TIME not null,
	235900  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sexta
	51, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	190000, -- horarioInicio TIME not null,
	235900  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sabado
	51, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	190000, -- horarioInicio TIME not null,
	235900  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Domingo
	51, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	190000, -- horarioInicio TIME not null,
	220000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda
	51, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	190000, -- horarioInicio TIME not null,
	235900  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	51,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- TELEFONE
	'15991915890',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	51,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/premiumburgerebar/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	51,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://premiumburgerebar.menudino.com/' -- redeSocial VARCHAR(200) not null
);


insert into recomendacao values(
	71, -- id
	51, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Premium Burguer', -- nome VARCHAR(50) not null,
	'Pão brioche, hamburguer 150g, queijo cheddar ou prato, bacon, maionese da casa.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	72, -- id
	51, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Mr. Cheese', -- nome VARCHAR(50) not null,
	'Pão brioche, hamburguer 150g, Queijo cheddar, Mussarela empanada, Bacon fatiado, Alface, Geleia de pimenta e Maionese casa.'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 51 Premium burger & bar ---- FIM

-- --------------------------> ID: 52 Cachorrão Noturno JL ---- INÍCIO

insert into estabelecimento values(
	52, -- id 
	'Cachorrão Noturno JL', -- nome
	'95638013000105', -- cnpj
	'jpg', -- fotoPrincipal   
	'Trailer de lanches: um ambiente familiar e lanches de qualidade!', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'2730', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Atanázio Soares', -- logradouro             VARCHAR(200) not null,
	'Jd. Maria Antônia Prado', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078970', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-09', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    52, -- idEstabelecimento INT NOT NULL,
    1 -- idCategoria INT NOT NULL -- LANCHONETE
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    52, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    52, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- Refeição no local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	72,                   -- id
	52,                -- idEstabelecimento
    'Leandro Silva',           -- nome
	'15981211224',           -- celular
    '04985846074',       -- cpf
    'cachorraonoturnojl@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1986-03-01',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	52, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	193000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	52, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	193000, -- horarioInicio TIME not null,
	040000  -- horarioFim TIME not null
);
insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Domindo
	52, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	193000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	52,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- Celular
	'15981211224',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	52,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	' https://web.facebook.com/cachorraonoturnojl/?_rdc=1&_rdr' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	52,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/cachorraonoturno_jl/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	52,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://pede.kcms.app/cachorrao-noturno/delivery/produtos' -- redeSocial VARCHAR(200) not null
);

insert into recomendacao values(
	73, -- id
	52, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Cachorrão Especial', -- nome VARCHAR(50) not null,
	'Salsicha, Tomate, Calabresa, Bacon, Batata Palha, Milho Verde, Ervilha, Catupiry ou Cheddar, Catchup e Mostarda.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	74, -- id
	52, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Bem Bolado', -- nome VARCHAR(50) not null,
	'Hamburguer, Ovo, Bacon, Calabresa, Salsicha, Batata Palha, Presunto, Alface, Tomate, Catupiry, Cheddar, Maionese, Catchup e Mostarda.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	75, -- id
	52, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'X-Calabresa', -- nome VARCHAR(50) not null,
	'Calabresa, Tomate, Mussarela, Catchup, Maionese e Mostarda.'-- descricao VARCHAR(50) not null
);
-- --------------------------> ID: 52 Cachorrão Noturno JL ---- FIM

-- --------------------------> ID: 53 Mary Restaurante ---- INÍCIO

insert into estabelecimento values(
	53, -- id 
	'Mary Restaurante', -- nome
	'11414524000145', -- cnpj
	'png', -- fotoPrincipal   
	'Bem-vindos! Somos mais do que um simples restaurante, somos um destino gastronômico dedicado a proporcionar experiências deliciosas para toda a família!', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'135', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Atílio Silvano', -- logradouro             VARCHAR(200) not null,
	'Jd. Pacaembu', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18074410', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-09', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    53, -- idEstabelecimento INT NOT NULL,
    1 -- idCategoria INT NOT NULL -- LANCHONETE
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    53, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    53, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- Refeição no local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	73,                   -- id
	53,                -- idEstabelecimento
    'Maria Dajuda Oliveira Lima',           -- nome
	'15998439999',           -- celular
    '18016510000',       -- cpf
    'restaurantemaryy@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1980-12-25',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda a sexta
	53, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	53, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	110000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);


insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	53,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- Celular
	'15998439999',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	53,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- telefone
	'1530213026',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	53,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://web.facebook.com/mary.refeicoes.7/?_rdc=1&_rdr' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	53,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/mary.refeicoes/' -- redeSocial VARCHAR(200) not null
);


insert into recomendacao values(
	76, -- id
	53, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Feijoada Completa', -- nome VARCHAR(50) not null,
	'Descubra o verdadeiro sabor do Brasil em nossa feijoada completa.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	77, -- id
	53, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Churrasco de costela', -- nome VARCHAR(50) not null,
	'Venha experimentar nossa deliciosa costela na brasa. Sabor que encanta a cada mordida.'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 53 Mary Restaurante ---- FIM

-- --------------------------> ID: 54 Pé de Hamburguer ---- INÍCIO

insert into estabelecimento values(
	54, -- id 
	'Pé de Hamburguer', -- nome
	'19466251000194', -- cnpj
	'jpg', -- fotoPrincipal   
	'Hamburgueria convidativa com mesas ao ar livre serve menu encorpado com sandubas monstro e cervejas especiais!', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'228', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Canindé', -- logradouro             VARCHAR(200) not null,
	'Jd. Paulistano', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18040760', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-09', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    54, -- idEstabelecimento INT NOT NULL,
    3 -- idCategoria INT NOT NULL -- HAMBURGUERIA
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    54, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    54, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- Refeição no local
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	74,                   -- id
	54,                -- idEstabelecimento
    'Pedro Alexandre Amorim',           -- nome
	'15999939999',           -- celular
    '71322885044',       -- cpf
    'pedehamburguer@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1977-11-26',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda
	54, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Terça
	54, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quarta
	54, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quinta 1º
	54, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quinta 2º
	54, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	220000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sexta 1º
	54, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	113000, -- horarioInicio TIME not null,
	150000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sexta 2º
	54, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	54, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Domingo
	54, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	220000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	54,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- telefone
	'1532327808',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);


insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	54,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/pedehamburguer_/' -- redeSocial VARCHAR(200) not null
);



insert into recomendacao values(
	78, -- id
	54, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Combo Vegetariano', -- nome VARCHAR(50) not null,
	'Hamburguer de quinoa, temperado com parmesão, mostarda com mel e mix de cogumeloas shimeji, shitake e champignon, 
	acompanhado de pure de cenoura, chips de mandioquinha e mix de cogumelos no pão de brioche. 
	Acompanha batata e refrigerante lata.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	79, -- id
	54, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Smash Triplo', -- nome VARCHAR(50) not null,
	'Pão Smash Feito Na Casa, 3 Carnes De 100gr, American Cheese E Molho Smash da casa.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	80, -- id
	54, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Combo Brisket Burguer', -- nome VARCHAR(50) not null,
	'Blend de brisket angus (peito bovino) de 160gr com queijo muçarela, Catupiry, cebola caramelizada, molho de mostrada e mel no pão de hamburguer. 
	Acompanha batata e refrigerante lata.'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 54 Pé de Hamburguer ---- FIM

-- --------------------------> ID: 55 Arriba Muchacho ---- INÍCIO

insert into estabelecimento values(
	55, -- id 
	'Arriba Muchacho', -- nome
	'19466251000194', -- cnpj
	'jpg', -- fotoPrincipal   
	'Variedade de porções e pratos da cozinha Tex-Mex, além de sobremesas e drinques em espaço alegre e colorido.', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'2.223', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Elias Maluf', -- logradouro             VARCHAR(200) not null,
	'Wanel ville', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18055215', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-09', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    55, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- RESTAURANTE
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    55, -- idEstabelecimento INT NOT NULL,
    6 -- idCategoria INT NOT NULL -- BARZINHO
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    55, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL -- faz entrega
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    55, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- Refeição no local
);

INSERT INTO comida_estabelecimento VALUES (
	null,
	55, -- idEstabelecimento
	5  -- idComida -- MEXICANA
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	75,                   -- id
	55,                -- idEstabelecimento
    'Hernández González',           -- nome
	'15991383862',           -- celular
    '86812754055',       -- cpf
    'arribamuchacho.adm@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1977-11-26',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Segunda
	55, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quarta
	55, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quinta
	55, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sexta
	55, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	55, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Domingo
	55, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	183000, -- horarioInicio TIME not null,
	230000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	55,              -- idEstabelecimento INT not null,
	1,              -- idTipoContato INT not null, -- Telefone
	'1533185051',  -- contato VARCHAR(200) not null
	false           -- isWhatsapp BOOLEAN not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	55,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- Celular
	'15991383862',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	55,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://web.facebook.com/p/Arriba-Muchacho-Sorocaba-100063693006491/?_rdc=1&_rdr' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	55,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/muchacho.arriba/' -- redeSocial VARCHAR(200) not null
);



insert into recomendacao values(
	81, -- id
	55, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Combo Pablo - 2', -- nome VARCHAR(50) not null,
	'2 tacos , 1 burritos 28 cm , nachos para 2 pessoas + Guacamole. grátis 1 Kuat 2 litros'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	82, -- id
	55, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Burrito Hot Chilli Grande 28cm', -- nome VARCHAR(50) not null,
	'PTortilha de 28 cm recheada com Chilli picante ,pico de gallo(vinagrete),suor cream 
	(molho a base de Cream chese),frijoles (pasta de feijão),
	queijo,alface,pimenta Carolina reaper, pimenta chipotle ,
	pimenta jalapenõ decorado com cheddar. Pra quem gosta de pimenta incrível sabor'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	83, -- id
	55, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Doces ou travessuras', -- nome VARCHAR(50) not null,
	'Margarita + Tequila Black + licor Maça + Licor Framboesa'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 55 Arriba Muchacho ---- FIM

-- --------------------------> ID: 56 Namata ---- INÍCIO

insert into estabelecimento values(
	56, -- id 
	'Namata', -- nome
	'48718094000165', -- cnpj
	'jpg', -- fotoPrincipal   
	'Com um ambiente despojado e estilo tropical, garante uma experiência 
	gastronômica acompanhada de música ao vivo & bons drinks!', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'32', -- numeroEstabelecimento  VARCHAR(9) not null,
	'R. Pedro de Oliveira Neto', -- logradouro             VARCHAR(200) not null,
	'Jd. Faculdade', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18031005', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-09', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    56, -- idEstabelecimento INT NOT NULL,
    4 -- idCategoria INT NOT NULL -- RESTAURANTE
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    56, -- idEstabelecimento INT NOT NULL,
    6 -- idCategoria INT NOT NULL -- BARZINHO
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    56, -- idEstabelecimento INT NOT NULL,
    3 -- idOpcional INT NOT NULL -- Toca música
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    56, -- idEstabelecimento INT NOT NULL,
    4 -- idOpcional INT NOT NULL -- música ao vivo
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    56, -- idEstabelecimento INT NOT NULL,
    14 -- idOpcional INT NOT NULL -- Refeição no local
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	56, -- idEstabelecimento INT not null,
	1  -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	56, -- idEstabelecimento INT not null,
	23  -- idEstiloMusica    INT not null
);

INSERT INTO comida_estabelecimento VALUES (
	null,
	56, -- idEstabelecimento
	2  -- idComida -- Brasileira
);
INSERT INTO comida_estabelecimento VALUES (
	null,
	56, -- idEstabelecimento
	3  -- idComida -- Italiana
);
INSERT INTO comida_estabelecimento VALUES (
	null,
	56, -- idEstabelecimento
	6  -- idComida -- Francesa
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	76,                   -- id
	56,                -- idEstabelecimento
    'Sandra Mara Correa Frati',           -- nome
	'15991504318',           -- celular
    '86812123056',       -- cpf
    'namatasorocaba @gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1969-08-15',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null, -- latitude
	null  -- logitude
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Terça
	56, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	160000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quarta
	56, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	160000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Quinta
	56, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	160000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sexta
	56, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	160000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Sábado
	56, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	120000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) values( -- Domingo
	56, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	120000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) values(
	56,              -- idEstabelecimento INT not null,
	2,              -- idTipoContato INT not null, -- Celular
	'15991504318',  -- contato VARCHAR(200) not null
	true           -- isWhatsapp BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	56,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://m.facebook.com/profile.php?id=100089919796424&locale2=hi_IN&_rdr' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	56,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/namatasorocaba/' -- redeSocial VARCHAR(200) not null
);



insert into recomendacao values(
	84, -- id
	56, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Polpetone', -- nome VARCHAR(50) not null,
	'Recheado e Coberto Com Queijo Ao Molho Pomodo + Fettuccine Com Manteiga E Salvia.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	85, -- id
	56, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Cambucu A Belle Meuniere', -- nome VARCHAR(50) not null,
	'Peixe com molho de camarões, champignon e alcaparras + arroz'-- descricao VARCHAR(50) not null
);

-- --------------------------> ID: 56 Namata ---- FIM
-- --> CADASTRO DE ESTABELECIMENTOS ---- FIM










--------------------------- --> CADASTRO DE AVALIAÇÕES ---- INÍCIO



--------------------------- --> CADASTRO DE AVALIAÇÕES ---- FIM