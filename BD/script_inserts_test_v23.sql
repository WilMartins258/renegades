-- RESET

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM testTable;

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
DELETE FROM cardapio;
DELETE FROM promocao;
DELETE FROM redeSocial_estabelecimento;
DELETE FROM contato_estabelecimento;
DELETE FROM opcional_estabelecimento;
DELETE FROM comida_estabelecimento;
DELETE FROM categoria_estabelecimento;
DELETE FROM musica_estabelecimento;
DELETE FROM avaliacao;
DELETE FROM favorito;

SET FOREIGN_KEY_CHECKS = 1;


-- INSERTS

-- ---------------------------- OPCIONAL -- INÍCIO

insert into OPCIONAL (id, nome) values (1, 'Faz entrega');
insert into OPCIONAL (id, nome) values (2, 'Entrega Grátis');
insert into OPCIONAL (id, nome) values (3, 'Toca Música');
insert into OPCIONAL (id, nome) values (4, 'Toca Música ao Vivo');
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

-- ---------------------------- CATEGORIA -- FIM

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

insert into diaSemana values (1, 'Domingo', '[0]');
insert into diaSemana values (2, 'Segunda-feira', '[1]');
insert into diaSemana values (3, 'Terça-feira', '[2]');
insert into diaSemana values (4, 'Quarta-feira', '[3]');
insert into diaSemana values (5, 'Quinta-feira', '[4]');
insert into diaSemana values (6, 'Sexta-feira', '[5]');
insert into diaSemana values (7, 'Sábado', '[6]');
insert into diaSemana values (8, 'Segunda a sexta-feira', '[1, 2, 3, 4, 5]');
insert into diaSemana values (9, 'Terça a sexta-feira', '[2, 3, 4, 5]');
insert into diaSemana values (10, 'Final de semana', '[0, 6]');

-- ---------------------------- diaSemana -- FIM



---------------------------- USUÁRIO WILLIAN -- INÍCIO


insert into usuario values(
	1,                   -- id
	null,                -- idEstabelecimento
    'Willian M. Ribeiro',-- nome
	'15999998888',       -- celular
    '44455566677',       -- cpf
    'willian@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '2000-09-24',        -- dataNascimento
	0,                    -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	97, -- numeroResidencia  VARCHAR(9),
	'Rua Pedro Nunes', -- logradouro        VARCHAR(200),
	'Conjunto Habitacional Jardim Serrano', -- bairro            VARCHAR(200),
	'Votorantim', -- cidade            VARCHAR(200),
	'SP', -- estado            VARCHAR(200),
	'18117121'-- cep               VARCHAR(9)
);

---------------------------- USUÁRIO WILLIAN -- FIM



---------------------------- USUÁRIO LUCAS -- INÍCIO

insert into usuario values(
	2,                   -- id
	null,                -- idEstabelecimento
    'Lucas Maximiano dos Santos',   -- nome
	'15999997777',           -- celular
    '11122244433',       -- cpf
    'lucas@gmail.com',   -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '2000-05-01',        -- dataNascimento
	0, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	1, -- numero not null
	'Rua do Lucas', -- lodradouro not null,
	'Bairro do Lucas', -- bairro not null,
	'Sorocaba', -- cidade not null,
	'SP', -- estado not null,
	'1112233' -- cep not null,
);

---------------------------- USUÁRIO LUCAS -- FIM



---------------------------- USUÁRIO ADM JULIO -- INÍCIO

insert into usuario values(
	3,                       -- id
	null,                    -- idEstabelecimento
    'Julio Cesar de Castro',           -- nome
	'15999999999',               -- celular
    '11122233344',           -- cpf
    'kaguebushin@gmail.com', -- email
    'senha123',              -- senha
	null,                    -- fotoPerfil
    '1989-09-24',            -- dataNascimento
	2, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null -- cep not null,
);

---------------------------- USUÁRIO ADM JULIO -- FIM






-- -----------------------------------------------> Mc Donalds - Votorantim

insert into estabelecimento values(
	1, -- id 
	'Mc Donalds - Votorantim', -- nome
	'21587059000106', -- cnpj
	null, -- fotoPrincipal   
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
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento values(
	1, -- id INT PRIMARY KEY,
    1, -- idEstabelecimento INT NOT NULL,
    1 -- idCategoria INT NOT NULL
);

insert into usuario values( -- Mc Donalds - Votorantim
	4,                   -- id
	1,                -- idEstabelecimento
    'usuario04 - MC Donalds',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario04@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null -- cep not null,
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	        10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	00:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    00:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    00:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    00:00–02:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    00:00–04:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	040000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    10:00–00:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	100000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    00:00–04:00
	null, -- id
	1, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
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

insert into redeSocial_estabelecimento values(
	null,       -- id INT
	1,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.mcdonalds.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into cardapio values(
	null, -- id
	1, -- idEstabelecimento INT not null,
	'Big Mac BLOB', -- foto LONGBLOB not null,
	'Big Mac', -- nome VARCHAR(50) not null,
	'Big Mac - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	1, -- idEstabelecimento INT not null,
	'Quarteirão BLOB', -- foto LONGBLOB not null,
	'Quarteirão', -- nome VARCHAR(50) not null,
	'Quarteirão - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	1, -- idEstabelecimento INT not null,
	'Big Tasty BLOB', -- foto LONGBLOB not null,
	'Big Tasty', -- nome VARCHAR(50) not null,
	'Big Tasty - descrição'-- descricao VARCHAR(50) not null
);

-- <----------------------------------------------> Mc Donalds - Votorantim







-- -----------------------------------------------> Mc Donalds - SOROCABA

insert into estabelecimento values(
	2, -- id 
    'Mc Donalds - SOROCABA', -- nome
    '76842463000162', -- cnpj
    null, -- fotoPrincipal   
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
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento values(
	2, -- id INT PRIMARY KEY,
	2, -- idEstabelecimento INT NOT NULL,
	1 -- idCategoria INT NOT NULL
);


insert into usuario values( -- Mc Donalds - Sorocaba
	5,                   -- id
	2,                -- idEstabelecimento
    'Dono do MC CAMPOLIM SOROCABA',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario05@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null -- cep not null,
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- domingo	00:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	00:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    00:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    00:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    00:00–02:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	020000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    00:00–04:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
	040000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    09:00–00:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	090000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    00:00–05:00
	null, -- id
	2, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
	000000, -- horarioInicio TIME not null,
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

insert into redeSocial_estabelecimento values(
	null,       -- id INT
	2,          -- idEstabelecimento INT not null,
	4,          -- idTipoRedeSocial  INT not null, -- SITE
	'https://www.mcdonalds.com.br/' -- redeSocial VARCHAR(200) not null
);

insert into cardapio values(
	null, -- id
	2, -- idEstabelecimento INT not null,
	'Big Mac BLOB', -- foto LONGBLOB not null,
	'Big Mac', -- nome VARCHAR(50) not null,
	'Big Mac - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	2, -- idEstabelecimento INT not null,
	'Quarteirão BLOB', -- foto LONGBLOB not null,
	'Quarteirão', -- nome VARCHAR(50) not null,
	'Quarteirão - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	2, -- idEstabelecimento INT not null,
	'Big Tasty BLOB', -- foto LONGBLOB not null,
	'Big Tasty', -- nome VARCHAR(50) not null,
	'Big Tasty - descrição'-- descricao VARCHAR(50) not null
);

-- <----------------------------------------------> Mc Donalds - SOROCABA




-- -----------------------------------------------> Kiko's Hot-Dog INÍCIO

insert into estabelecimento values(
	3, -- id 
	'Kikos Hot-Dog', -- nome
	'11892673000110',  -- cnpj
	null, -- fotoPrincipal   
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
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento values(
	3, -- id INT PRIMARY KEY,
	3, -- idEstabelecimento INT NOT NULL,
	1 -- idCategoria INT NOT NULL
);

insert into usuario values(
	6,                   -- id
	3,                -- idEstabelecimento
    'Dono do Kiko',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario06@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null -- cep not null,
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

insert into cardapio values(
	null, -- id
	3, -- idEstabelecimento INT not null,
	'Hot Dog Super BLOB', -- foto LONGBLOB not null,
	'Hot Dog Super', -- nome VARCHAR(50) not null,
	'Hot Dog Super - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	3, -- idEstabelecimento INT not null,
	'Hot Dog Mega BLOB', -- foto LONGBLOB not null,
	'Hot Dog Mega', -- nome VARCHAR(50) not null,
	'Hot Dog Mega - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	3, -- idEstabelecimento INT not null,
	'Porção de batata BLOB', -- foto LONGBLOB not null,
	'Porção de batata', -- nome VARCHAR(50) not null,
	'Porção de batata - descrição'-- descricao VARCHAR(50) not null
);



-- <----------------------------------------------> Kiko's Hot-Dog FIM





-- -----------------------------------------------> Pizzaria Booa INÍCIO

insert into estabelecimento values(
	4, -- id 
	'Pizzaria Booa', -- nome
	'59363162000137',  -- cnpj
	null, -- fotoPrincipal   
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
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento values(
	4, -- id INT PRIMARY KEY,
	4, -- idEstabelecimento INT NOT NULL,
	2 -- idCategoria INT NOT NULL
);

insert into usuario values(
	7,                   -- id
	4,                -- idEstabelecimento
    'Dono da Pizzaria Booa Pizza usuario07',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario07@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null -- cep not null,
);

---------------------------------------------------------------- HORÁRIO INÍCIO

insert into horario values( -- domingo	09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	1, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- segunda-feira	09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	2, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- terça-feira	    09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	3, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quarta-feira	    09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	4, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- quinta-feira	    09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	5, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sexta-feira	    09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	6, -- idDiaSemana INT not null,
	180000, -- horarioInicio TIME not null,
	000000  -- horarioFim TIME not null
);

insert into horario values( -- sábado	    09:00–00:00
	null, -- id
	4, -- idEstabelecimento INT not null,
	7, -- idDiaSemana INT not null,
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

insert into cardapio values(
	null, -- id
	4, -- idEstabelecimento INT not null,
	'Pizza de Calabresa BLOB', -- foto LONGBLOB not null,
	'Pizza de Calabresa', -- nome VARCHAR(50) not null,
	'Pizza de Calabresa - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	4, -- idEstabelecimento INT not null,
	'Pizza de Frango com Catupiry BLOB', -- foto LONGBLOB not null,
	'Pizza de Frango com Catupiry', -- nome VARCHAR(50) not null,
	'Pizza de Frango com Catupiry - descrição'-- descricao VARCHAR(50) not null
);


-- <----------------------------------------------> Pizzaria Booa FIM

-- -----------------------------------------------> Mada Bar INÍCIO

insert into estabelecimento values(
	5,                      -- id 
	'Mada Bar',             -- nome
	'73936746000185',       -- cnpj
	null,                   -- fotoPrincipal   
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
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into categoria_estabelecimento values(
	5, -- id INT PRIMARY KEY,
	5, -- idEstabelecimento INT NOT NULL,
	6 -- idCategoria INT NOT NULL
);

insert into musica_estabelecimento values(
	1, -- id                INT PRIMARY KEY,
	5, -- idEstabelecimento INT not null,
	1 -- idEstiloMusica    INT not null ---------> PAGODE
);

insert into musica_estabelecimento values(
	2, -- id                INT PRIMARY KEY,
	5, -- idEstabelecimento INT not null,
	2 -- idEstiloMusica    INT not null ---------> SAMBA
);

insert into musica_estabelecimento values(
	3, -- id                INT PRIMARY KEY,
	5, -- idEstabelecimento INT not null,
	3 -- idEstiloMusica    INT not null ---------> FUNK
);

insert into usuario values(
	8,                   -- id
	5,                -- idEstabelecimento
    'Mada Bar usuario08',           -- nome
	'15999999999',           -- celular
    '11122233355',       -- cpf
    'usuario08@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1, -- tipoUsuario ENUM(0, 1, 2) NOT NULL
	null, -- numero not null
	null, -- lodradouro not null,
	null, -- bairro not null,
	null, -- cidade not null,
	null, -- estado not null,
	null -- cep not null,
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

insert into cardapio values(
	null, -- id
	5, -- idEstabelecimento INT not null,
	'Drik Mada 01 BLOB', -- foto LONGBLOB not null,
	'Drik Mada 01', -- nome VARCHAR(50) not null,
	'Drik Mada 01 - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	5, -- idEstabelecimento INT not null,
	'Drik Mada 02 BLOB', -- foto LONGBLOB not null,
	'Drik Mada 02', -- nome VARCHAR(50) not null,
	'Drik Mada 02 - descrição'-- descricao VARCHAR(50) not null
);

insert into cardapio values(
	null, -- id
	5, -- idEstabelecimento INT not null,
	'Drik Mada 03 BLOB', -- foto LONGBLOB not null,
	'Drik Mada 03', -- nome VARCHAR(50) not null,
	'Drik Mada 03 - descrição'-- descricao VARCHAR(50) not null
);

-- -----------------------------------------------> Mada Bar FIM