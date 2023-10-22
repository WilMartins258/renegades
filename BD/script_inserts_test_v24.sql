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

insert into comida (id, nome) values (1, 'Braseileira');
insert into comida (id, nome) values (2, 'Japonesa');
insert into comida (id, nome) values (3, 'Italiana');
insert into comida (id, nome) values (4, 'Mexicana');
insert into comida (id, nome) values (5, 'Indiana');
insert into comida (id, nome) values (6, 'Francesa');


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
	null,                -- fotoPerfil
    '2000-09-24',        -- dataNascimento
	0,                    -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	97, -- numeroResidencia  VARCHAR(9),
	'Rua João Serrano', -- logradouro        VARCHAR(200),
	'Jardim Serrano', -- bairro            VARCHAR(200),
	'Votorantim', -- cidade            VARCHAR(200),
	'SP', -- estado            VARCHAR(200),
	'18117130', -- cep               VARCHAR(9)
	null,
	null
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
    'kagebushin@gmail.com', -- email
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






-- -----------------------------------------------> Mc Donalds - Votorantim

insert into estabelecimento values(
	1, -- id 
	'Mc Donalds - Votorantim', -- nome
	'21587059000106', -- cnpj
	'png', -- fotoPrincipal   
	'Este é o Mc Donalds de Votorantim', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	's/n', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Avenida Moacir Oséias Guitti', -- logradouro             VARCHAR(200) not null,
	'Jardim Paraíso', -- bairro                 VARCHAR(200) not null,
	'Votorantim', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18110375', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    1, -- idEstabelecimento INT NOT NULL,
    1 -- idCategoria INT NOT NULL
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
    1, -- idEstabelecimento INT NOT NULL,
    2 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    2 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    3 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    4 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    6 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    1, -- idEstabelecimento INT NOT NULL,
    7 -- idOpcional INT NOT NULL
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values( -- Mc Donalds - Votorantim
	4,                   -- id
	1,                -- idEstabelecimento
    'usuario04 - MC Donalds',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario04@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	        10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	10:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    10:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    10:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    10:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    10:00–04:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	040000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    10:00–04:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	040000  -- horarioFim TIME not null
);

---------------------------------------------------------------- HORÁRIO FIM

insert into contato_estabelecimento values(
	null,       -- id INT
	1,          -- idEstabelecimento INT not null,
	2,          -- idTipoContato INT not null, -- TELEFONE
	'32431749', -- contato VARCHAR(200) not null
	false -- isWhatsapp        BOOLEAN not null
);

insert into contato_estabelecimento values(
	null,       -- id INT
	1,          -- idEstabelecimento INT not null,
	2,          -- idTipoContato INT not null, -- TELEFONE
	'44555555555', -- contato VARCHAR(200) not null
	true -- isWhatsapp        BOOLEAN not null
);

insert into contato_estabelecimento values(
	null,       -- id INT
	1,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'99555555555', -- contato VARCHAR(200) not null
	true -- isWhatsapp        BOOLEAN not null
);

insert into contato_estabelecimento values(
	null,       -- id INT
	1,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'88555555555', -- contato VARCHAR(200) not null
	false -- isWhatsapp        BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_FACEBOOK.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_INSTAGRAM.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	3,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_TWITTER.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.mcdonalds.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_CARDAPIO.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	1, -- idEstabelecimento INT not null,
	1  -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	1, -- idEstabelecimento INT not null,
	3  -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	1, -- idEstabelecimento INT not null,
	5  -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	1, -- idEstabelecimento INT not null,
	7  -- idEstiloMusica    INT not null
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	1, -- idEstabelecimento INT not null,
	9  -- idEstiloMusica    INT not null
);

insert into recomendacao values(
	1, -- id
	1, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Big Mac', -- nome VARCHAR(50) not null,
	'Big Mac - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	2, -- id
	1, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Quarteirão', -- nome VARCHAR(50) not null,
	'Quarteirão - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	3, -- id
	1, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Big Tasty', -- nome VARCHAR(50) not null,
	'Big Tasty - descrição'-- descricao VARCHAR(50) not null
);

-- <----------------------------------------------> Mc Donalds - Votorantim







-- -----------------------------------------------> Mc Donalds - SOROCABA

insert into estabelecimento values(
	2, -- id 
    'Mc Donalds - SOROCABA', -- nome
    '76842463000162', -- cnpj
    'png', -- fotoPrincipal   
    'Este é o Mc Donalds de Sorocaba Campolim', -- descricao
    true, -- ativo
    false, -- oculto
    'Validado', -- statusValidacao
    null, -- nota
	0, -- numeroAvaliacoes INT,
	'1055', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Avenida Antônio Carlos Comitre', -- logradouro             VARCHAR(200) not null,
	'Parque Campolim', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18047620', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
	2, -- idEstabelecimento INT NOT NULL,
	1 -- idCategoria INT NOT NULL
);


insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values( -- Mc Donalds - Sorocaba
	5,                   -- id
	2,                -- idEstabelecimento
    'Dono do MC CAMPOLIM SOROCABA',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario05@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	09:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	09:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    09:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    09:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    09:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    09:00–04:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	040000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    09:00–05:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	050000  -- horarioFim TIME not null
);


---------------------------------------------------------------- HORÁRIO FIM

insert into contato_estabelecimento values(
	null,       -- id INT
	2,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'34115830', -- contato VARCHAR(200) not null
	false -- isWhatsapp        BOOLEAN not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	2,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.mcdonalds.com.br/' -- redeSocial VARCHAR(200) not null
);
insert into recomendacao values(
	4, -- id
	2, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Big Mac', -- nome VARCHAR(50) not null,
	'Big Mac - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	5, -- id
	2, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Quarteirão', -- nome VARCHAR(50) not null,
	'Quarteirão - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	6, -- id
	2, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Big Tasty', -- nome VARCHAR(50) not null,
	'Big Tasty - descrição'-- descricao VARCHAR(50) not null
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    2, -- idEstabelecimento INT NOT NULL,
    8 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    2, -- idEstabelecimento INT NOT NULL,
    9 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    2, -- idEstabelecimento INT NOT NULL,
    10 -- idOpcional INT NOT NULL
);

-- <----------------------------------------------> Mc Donalds - SOROCABA




-- -----------------------------------------------> Kiko's Hot-Dog INÍCIO

insert into estabelecimento values(
	3, -- id 
	'Kikos Hot-Dog', -- nome
	'11892673000110',  -- cnpj
	'jpg', -- fotoPrincipal   
	'Kikos Hot-Dog DESCRICAO', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'35', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Avenida Matheus Conegero', -- logradouro             VARCHAR(200) not null,
	'Parque Bela Vista', -- bairro                 VARCHAR(200) not null,
	'Votorantim', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18110570', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
	3, -- idEstabelecimento INT NOT NULL,
	1 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    3, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	6,                   -- id
	3,                -- idEstabelecimento
    'Dono do Kiko',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario06@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    09:00–00:00
	null, -- id
	3, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);


---------------------------------------------------------------- HORÁRIO FIM

insert into contato_estabelecimento values(
	null,       -- id INT
	3,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'32432019', -- contato VARCHAR(200) not null
	false -- isWhatsapp        BOOLEAN not null
);

insert into recomendacao values(
	7, -- id
	3, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Hot Dog Super', -- nome VARCHAR(50) not null,
	'Hot Dog Super - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	8, -- id
	3, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Hot Dog Mega', -- nome VARCHAR(50) not null,
	'Hot Dog Mega - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	9, -- id
	3, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Porção de batata', -- nome VARCHAR(50) not null,
	'Porção de batata - descrição'-- descricao VARCHAR(50) not null
);



-- <----------------------------------------------> Kiko's Hot-Dog FIM





-- -----------------------------------------------> Pizzaria Booa INÍCIO

insert into estabelecimento values(
	4, -- id 
	'Pizzaria Booa', -- nome
	'59363162000137',  -- cnpj
	'jpg', -- fotoPrincipal   
	'Pizzaria Booa - DESCRIÇÃO', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'526', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Avenida Santos Dumont', -- logradouro             VARCHAR(200) not null,
	'Vila Domingues', -- bairro                 VARCHAR(200) not null,
	'Votorantim', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18116440', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
	4, -- idEstabelecimento INT NOT NULL,
	2 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    4, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	7,                   -- id
	4,                -- idEstabelecimento
    'Dono da Pizzaria Booa Pizza usuario07',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario07@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);


---------------------------------------------------------------- HORÁRIO FIM

insert into contato_estabelecimento values(
	null,       -- id INT
	4,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'32432020', -- contato VARCHAR(200) not null
	false -- isWhatsapp        BOOLEAN not null
);

insert into recomendacao values(
	10, -- id
	4, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Pizza de Calabresa', -- nome VARCHAR(50) not null,
	'Pizza de Calabresa - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	11, -- id
	4, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Pizza de Frango com Catupiry', -- nome VARCHAR(50) not null,
	'Pizza de Frango com Catupiry - descrição'-- descricao VARCHAR(50) not null
);


-- <----------------------------------------------> Pizzaria Booa FIM

-- -----------------------------------------------> Mada Bar INÍCIO

insert into estabelecimento values(
	5,                      -- id 
	'Mada Bar',             -- nome
	'73936746000185',       -- cnpj
	'jpg',                   -- fotoPrincipal   
	'Mada Bar - DESCRIÇÃO', -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Validado',             -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'1597', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Avenida Gisele Constantino', -- logradouro             VARCHAR(200) not null,
	'Parque Campolim', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18048110', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
	5, -- idEstabelecimento INT NOT NULL,
	6 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    4 -- idOpcional INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    5, -- idEstabelecimento INT NOT NULL,
    5 -- idOpcional INT NOT NULL
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	5, -- idEstabelecimento INT not null,
	1 -- idEstiloMusica    INT not null ---------> PAGODE
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	5, -- idEstabelecimento INT not null,
	2 -- idEstiloMusica    INT not null ---------> SAMBA
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	5, -- idEstabelecimento INT not null,
	3 -- idEstiloMusica    INT not null ---------> FUNK
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	8,                   -- id
	5,                -- idEstabelecimento
    'Mada Bar usuario08',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario08@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values(
	null, -- id
	5, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	060000  -- horarioFim TIME not null
);

insert into horario values(
	null, -- id
	5, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	060000  -- horarioFim TIME not null
);

insert into contato_estabelecimento values(
	null,       -- id INT
	5,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'999999999', -- contato VARCHAR(200) not null
	false -- isWhatsapp        BOOLEAN not null
);

insert into recomendacao values(
	12, -- id
	5, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Drik Mada 01', -- nome VARCHAR(50) not null,
	'Drik Mada 01 - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	13, -- id
	5, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Drik Mada 02', -- nome VARCHAR(50) not null,
	'Drik Mada 02 - descrição'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	14, -- id
	5, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Drik Mada 03', -- nome VARCHAR(50) not null,
	'Drik Mada 03 - descrição'-- descricao VARCHAR(50) not null
);

-- -----------------------------------------------> Mada Bar FIM


insert into favorito values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario INT NOT NULL,
    1 -- idEstabelecimento INT NOT NULL
);

insert into favorito values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario INT NOT NULL,
    5 -- idEstabelecimento INT NOT NULL
);

insert into favorito values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario INT NOT NULL,
    4 -- idEstabelecimento INT NOT NULL
);

insert into favorito values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario INT NOT NULL,
    3 -- idEstabelecimento INT NOT NULL
);

insert into favorito values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario INT NOT NULL,
    2 -- idEstabelecimento INT NOT NULL
);

-- -----------------------------------------------> Habib's INÍCIO

insert into estabelecimento values(
	6,                      -- id 
	"Habib's",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'jpg',                   -- fotoPrincipal   
	"Rede de fast-food árabe, popular pelas esfihas, tem um ambiente simples e informal também para grandes grupos.", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Validado',             -- statusValidacao
	null, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

insert into categoria_estabelecimento (idEstabelecimento, idCategoria) values(
	6, -- idEstabelecimento INT NOT NULL,
	18 -- idCategoria INT NOT NULL
);

insert into opcional_estabelecimento (idEstabelecimento, idOpcional) values(
    6, -- idEstabelecimento INT NOT NULL,
    1 -- idOpcional INT NOT NULL
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	6, -- idEstabelecimento INT not null,
	4 -- idEstiloMusica    INT not null ---------> Rock
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	6, -- idEstabelecimento INT not null,
	13 -- idEstiloMusica    INT not null ---------> Classica
);

insert into musica_estabelecimento (idEstabelecimento, idEstiloMusica) values(
	6, -- idEstabelecimento INT not null,
	20 -- idEstiloMusica    INT not null ---------> Alternativa
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values(
	9,                   -- id
	6,                -- idEstabelecimento
    'Habibs usuario09',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario09@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values(
	null, -- id
	6, -- idEstabelecimento INT not null,
	8, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	060000  -- horarioFim TIME not null
);

insert into horario values(
	null, -- id
	6, -- idEstabelecimento INT not null,
	10, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	060000  -- horarioFim TIME not null
);

insert into contato_estabelecimento values(
	null,       -- id INT
	6,          -- idEstabelecimento INT not null,
	1,          -- idTipoContato INT not null, -- TELEFONE
	'999999999', -- contato VARCHAR(200) not null
	true -- isWhatsapp        BOOLEAN not null
);
insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	1,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.instagram.com/habibsoficial/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	2,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_INSTAGRAM.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	1,          -- idEstabelecimento INT not null,
	3,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_TWITTER.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.habibs.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) values(
	6,          -- idEstabelecimento INT not null,
	5,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.LINK_CARDAPIO.com.br/' -- redeSocial VARCHAR(200) not null
);
insert into recomendacao values(
	15, -- id
	6, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Mini Kibe', -- nome VARCHAR(50) not null,
	'Mini Kibe - O minikibe clássico do Habib’s como você nunca viu, feito com proteína vegetal. Produto Vegetariano.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	16, -- id
	6, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	"Bib'sfiha de Carne", -- nome VARCHAR(50) not null,
	"Bib'sfiha de Carne - Carne temperada com limão, tomate, tahine, cebola e tempero especial."-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	17, -- id
	6, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'Pudim de Leite Condensado', -- nome VARCHAR(50) not null,
	'Pudim de Leite Condensado - O pudim de leite que todo mundo ama, perfeito para qualquer momento!'-- descricao VARCHAR(50) not null
);

-- -----------------------------------------------> Habib's FIM


-- --------------------------------------------------------------------------------------> AVALIAÇÕES INÍCIO
insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 1 - willian', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario         INT not null,
	2, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 2 - willian', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	4 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario         INT not null,
	3, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 3 - willian', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	3 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario         INT not null,
	4, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 4 - willian', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	2 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    1, -- idUsuario         INT not null,
	5, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 5 - willian', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	1 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    2, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 1 - lucas', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	1 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    2, -- idUsuario         INT not null,
	2, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 2 - lucas', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	2 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    2, -- idUsuario         INT not null,
	3, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 3 - lucas', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	3 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    2, -- idUsuario         INT not null,
	4, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 4 - lucas', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	4 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    2, -- idUsuario         INT not null,
	5, -- idEstabelecimento INT not null,
	'Avaliação do estabelecimento 5 - lucas', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    3, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    4, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    6, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	4 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    7, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    8, -- idUsuario         INT not null,
	1, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    7, -- idUsuario         INT not null,
	2, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    8, -- idUsuario         INT not null,
	2, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

insert into avaliacao values(
    null, -- id INT PRIMARY KEY AUTO_INCREMENT,
    8, -- idUsuario         INT not null,
	3, -- idEstabelecimento INT not null,
	'Avaliando o Mc Votorantim', -- avaliacao         VARCHAR(200) not null,
	'2023-10-01', -- data              DATE not null,
	5 -- nota              INT not null -- Somente de 1 a 5
);

-- --------------------------------------------------------------------------------------> AVALIAÇÕES FIM


-- --------------------------------------------------------------------------------------> TESTES ERRADOS DE ESTABELECIMENTO
insert into estabelecimento values(
	7,                      -- id 
	"ESTABLECECIMENTO 7",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'png',                   -- fotoPrincipal   
	"ESTABLECECIMENTO 7", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Validado',             -- statusValidacao
	1.244, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

insert into estabelecimento values(
	8,                      -- id 
	"ESTABLECECIMENTO 8",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'png',                   -- fotoPrincipal   
	"ESTABLECECIMENTO 8", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Pendente',             -- statusValidacao
	3.444, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

insert into estabelecimento values(
	9,                      -- id 
	"ESTABLECECIMENTO 9",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'png',                   -- fotoPrincipal   
	"ESTABLECECIMENTO 9", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Pendente',             -- statusValidacao
	4.444, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

insert into estabelecimento values(
	10,                      -- id 
	"ESTABLECECIMENTO 10",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'png',                   -- fotoPrincipal   
	"ESTABLECECIMENTO 10", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Não Validado',             -- statusValidacao
	2.5555, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

insert into estabelecimento values(
	11,                      -- id 
	"ESTABLECECIMENTO 11",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'png',                   -- fotoPrincipal   
	"ESTABLECECIMENTO 11", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Não Validado',             -- statusValidacao
	1.988, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

insert into estabelecimento values(
	12,                      -- id 
	"ESTABLECECIMENTO 12",             -- nome
	'56.765.680/0001-99',       -- cnpj
	'png',                   -- fotoPrincipal   
	"ESTABLECECIMENTO 12", -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Validado',             -- statusValidacao
	2.390, -- nota
	0, -- numeroAvaliacoes INT,
	'3145', -- numeroEstabelecimento  VARCHAR(9) not null,
	'Av. Itavuvu', -- logradouro             VARCHAR(200) not null,
	'Jardim Santa Cecilia', -- bairro                 VARCHAR(200) not null,
	'Sorocaba', -- cidade                 VARCHAR(200) not null,
	'SP', -- estado                 VARCHAR(200) not null,
	'18078-005', -- cep               VARCHAR(9) not null,
	null,
	null,
	'2023-10-10', -- dataUltimoAcesso
	'2023-10-10' -- dataUltimoAcesso
);

-- --------------------------------------------------------------------------------------> TESTES ERRADOS DE ESTABELECIMENTO


-- --------------------------------------------------------------------------------------> PROMOÇÕES INÍCIO

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	1, -- idEstabelecimento INT not null,
	'Mc lanche metade do preço', -- nome              VARCHAR(100) not null,
	'Apresente o código da promoção no momento da finalização da compra e receba um desconto de metade do valor do seu lanche', -- descricao         VARCHAR(400) not null,
	'XXY-38', -- codigo            VARCHAR(20) not null,
	'Inativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-14', -- dataInicio        DATE not null,
	'2023-12-20' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	1, -- idEstabelecimento INT not null,
	'Big Mc metade do preço', -- nome              VARCHAR(100) not null,
	'Apresente o código da promoção no momento da finalização da compra e receba um desconto de metade do valor do seu lanche', -- descricao         VARCHAR(400) not null,
	'XXY-39', -- codigo            VARCHAR(20) not null,
	'Inativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-14', -- dataInicio        DATE not null,
	'2023-10-20' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	1, -- idEstabelecimento INT not null,
	'Chickem Jr. metade do preço', -- nome              VARCHAR(100) not null,
	'Apresente o código da promoção no momento da finalização da compra e receba um desconto de metade do valor do seu lanche', -- descricao         VARCHAR(400) not null,
	'XXY-40', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-14', -- dataInicio        DATE not null,
	'2023-10-20' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	6, -- idEstabelecimento INT not null,
	"10 Bib'sfiha de Carne por R$ 8,99", -- nome              VARCHAR(100) not null,
	"Apresente o código da promoção no momento da finalização da compra e pague somente R$ 8,99 por 10 Bib'sfihas de Carne", -- descricao         VARCHAR(400) not null,
	'ESFIRRA10', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-14', -- dataInicio        DATE not null,
	'2023-11-30' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	4, -- idEstabelecimento INT not null,
	"Rodízio Promocional", -- nome              VARCHAR(100) not null,
	"Apresente o código da promoção ao pedir pelo rodízio na Booa e pague apenas R$ 25,99.", -- descricao         VARCHAR(400) not null,
	'RODIZIO-BOOA', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-05', -- dataInicio        DATE not null,
	'2023-11-25' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	3, -- idEstabelecimento INT not null,
	"Cachorrão Especial Promocional", -- nome              VARCHAR(100) not null,
	"Apresente o código da promoção no momento da finalização da compra e pague somente R$ 18,99 por um Cachorrão Especial no Kiko's (Somente um uso por pessoa)", -- descricao         VARCHAR(400) not null,
	'DOGESPECIAL-KIKOS', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-05', -- dataInicio        DATE not null,
	'2023-12-30' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	3, -- idEstabelecimento INT not null,
	"Cachorrão Super + Batata Média", -- nome              VARCHAR(100) not null,
	"Apresente o código da promoção ao fazer o pedido de um Cachorrão Super e por mais R$ 8,00 leva uma batata média no combo.", -- descricao         VARCHAR(400) not null,
	'SUPERBATATA-KIKOS', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-05', -- dataInicio        DATE not null,
	'2023-12-30' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	2, -- idEstabelecimento INT not null,
	"Promoção vencida 1", -- nome              VARCHAR(100) not null,
	"Promoção vencida 1 - descrição", -- descricao         VARCHAR(400) not null,
	'VENCIDA_01', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-09-05', -- dataInicio        DATE not null,
	'2023-10-10' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	5, -- idEstabelecimento INT not null,
	"Promoção vencida 2", -- nome VARCHAR(100) not null,
	"Promoção vencida 2 - descrição", -- descricao         VARCHAR(400) not null,
	'VENCIDA_02', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-09-15', -- dataInicio        DATE not null,
	'2023-10-10' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	7, -- idEstabelecimento INT not null,
	"Promoção vencida 3", -- nome VARCHAR(100) not null,
	"Promoção vencida 3 - descrição", -- descricao         VARCHAR(400) not null,
	'VENCIDA_03', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-09-15', -- dataInicio        DATE not null,
	'2023-10-12' -- dataFim           DATE not null
);

INSERT INTO promocao VALUES (
	null, -- id                INT PRIMARY KEY AUTO_INCREMENT,
	5, -- idEstabelecimento INT not null,
	"Drink Especial de Limão", -- nome VARCHAR(100) not null,
	"Apresente o código da promoção ao pagar a compra de um Drink Especial de Limão e pague apenas R$ 32,00", -- descricao         VARCHAR(400) not null,
	'LIMAO_MADA', -- codigo            VARCHAR(20) not null,
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa' not null,
	'2023-10-13', -- dataInicio        DATE not null,
	'2023-10-28' -- dataFim           DATE not null
);
-- --------------------------------------------------------------------------------------> PROMOÇÕES FIM


-- --------------------------------------------------------------------------------------> COMIDAS TESTE INÍIO
INSERT INTO comida_estabelecimento VALUES (
	null,
	1, -- idEstabelecimento
	1  -- idComida
);

INSERT INTO comida_estabelecimento VALUES (
	null,
	3, -- idEstabelecimento
	2  -- idComida
);

INSERT INTO comida_estabelecimento VALUES (
	null,
	3, -- idEstabelecimento
	3  -- idComida
);

INSERT INTO comida_estabelecimento VALUES (
	null,
	5, -- idEstabelecimento
	5  -- idComida
);
-- --------------------------------------------------------------------------------------> COMIDAS TESTE FIM


-- --------------------------------------------------------------------------------------> USUÁRIOS INATIVOS DE TESTE INÍCIO

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, status, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values( -- Mc Donalds - Votorantim
	null,                   -- id
	null,                -- idEstabelecimento
    'Usuario inativo 01',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'inativo01@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	'Inativo', -- status            ENUM('Ativo', 'Inativo') DEFAULT 'Ativo' not null,
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, status, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values( -- Mc Donalds - Votorantim
	null,                   -- id
	null,                -- idEstabelecimento
    'Usuario inativo 02',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'inativo02@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	'Inativo', -- status            ENUM('Ativo', 'Inativo') DEFAULT 'Ativo' not null,
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);

insert into usuario (id, idEstabelecimento, nome, celular, cpf, email, senha, fotoPerfil, dataNascimento, tipoUsuario, status, numeroResidencia, logradouro, bairro, cidade, estado, cep, latitude, longitude) values( -- Mc Donalds - Votorantim
	null,                   -- id
	null,                -- idEstabelecimento
    'Usuario inativo 03',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'inativo03@gmail.com', -- email
    '123456',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	'Inativo', -- status            ENUM('Ativo', 'Inativo') DEFAULT 'Ativo' not null,
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null, -- cep not null,
	null,
	null
);
-- --------------------------------------------------------------------------------------> USUÁRIOS INATIVOS DE TESTE FIM
