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
	'54870500', -- cep               VARCHAR(9) not null,
	null, -- latitude
	null, -- logitude
	'2023-11-05', -- dataCadastro
	'2023-11-30' -- dataUltimoAcesso
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

-- --> CADASTRO DE ESTABELECIMENTOS ---- FIM