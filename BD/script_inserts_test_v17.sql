-- RESET

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM USUARIO;
DELETE FROM testTable;
DELETE FROM CARDAPIO;
DELETE FROM ESTABELECIMENTO;
DELETE FROM ENDERECO;
DELETE FROM CONTATO;
DELETE FROM HORARIO;
DELETE FROM PROMOCAO;
DELETE FROM ESTILOMUSICA;
DELETE FROM tipoContato;
DELETE FROM diaSemana;
DELETE FROM CATEGORIA;
DELETE FROM AVALIACAO;
DELETE FROM musica;
DELETE FROM OPCIONAL;

SET FOREIGN_KEY_CHECKS = 1;


-- INSERTS

-- ---------------------------- OPCIONAL -- INÍCIO

insert into OPCIONAL values (
	1,
	'Faz entrega'
);

insert into OPCIONAL values (
	2,
	'Entrega Grátis'
);

insert into OPCIONAL values (
    3,
    'Toca Música'
);

insert into OPCIONAL values (
    4,
    'Toca Música ao Vivo'
);

insert into OPCIONAL values (
    5,
    'Oferece Rodízio'
);

insert into OPCIONAL values (
    6,
    'Precisa de Agendamento'
);

insert into OPCIONAL values (
    7,
    'Possui Estacionamento'
);

insert into OPCIONAL values (
    8,
    'Possui Área Kids'
);

insert into OPCIONAL values (
    9,
    'Tem Wi-fi livre'
);

insert into OPCIONAL values (
    10,
    'Permite Animais'
);

insert into OPCIONAL values (
    11,
    'Couvert Grátis'
);

insert into OPCIONAL values (
    12,
    'Tem taxa de 10%'
);

insert into OPCIONAL values (
    13,
    'Possui Área de Fumantes'
);

-- ---------------------------- OPCIONAL -- FIM

-- ---------------------------- CATEGORIA -- INÍCIO

insert into categoria values(
	1,
	'Lanchonete'
);

insert into categoria values(
	2,
	'Pizzaria'
);

insert into categoria values(
	3,
	'Hamburgueria'
);

insert into categoria values(
	4,
	'Restaurante'
);

insert into categoria values(
	5,
	'Pastelaria'
);

insert into categoria values(
	6,
	'Barzinho'
);

insert into categoria values(
	7,
	'Sorveteria'
);

insert into categoria values(
	8,
	'Açaiteria'
);

insert into categoria values(
	9,
	'Padaria'
);

insert into categoria values(
	10,
	'Churrascaria'
);

insert into categoria values(
	11,
	'Cafeteria'
);

insert into categoria values(
	12,
	'Sushi bar'
);

insert into categoria values(
	13,
	'Food truck'
);

insert into categoria values(
	14,
	'Creperia'
);

insert into categoria values(
	15,
	'Doceria'
);

insert into categoria values(
	16,
	'Comida de rua'
);

insert into categoria values(
	17,
	'Sucaria'
);


-- ---------------------------- CATEGORIA -- FIM

-- ---------------------------- ESTILO DE MÚSICA -- INÍCIO

insert into estilomusica values(
	1,
	'Pagode'
);

insert into estilomusica values(
	2,
	'Samba'
);

insert into estilomusica values(
	3,
	'Funk'
);

-- Rock
insert into estilomusica values (
    4,
    'Rock'
);

-- Pop
insert into estilomusica values (
    5,
    'Pop'
);

-- Hip-Hop
insert into estilomusica values (
    6,
    'Hip-Hop'
);

-- Reggae
insert into estilomusica values (
    7,
    'Reggae'
);

-- Eletrônica
insert into estilomusica values (
    8,
    'Eletrônica'
);

-- Country
insert into estilomusica values (
    9,
    'Country'
);

-- Jazz
insert into estilomusica values (
    10,
    'Jazz'
);

-- Blues
insert into estilomusica values (
    11,
    'Blues'
);

-- R&B (Rhythm and Blues)
insert into estilomusica values (
    12,
    'R&B'
);

-- Clássica
insert into estilomusica values (
    13,
    'Clássica'
);

-- Reggaeton
insert into estilomusica values (
    14,
    'Reggaeton'
);

-- Metal
insert into estilomusica values (
    15,
    'Metal'
);

-- Indie
insert into estilomusica values (
    16,
    'Indie'
);

-- Rap
insert into estilomusica values (
    17,
    'Rap'
);

-- Punk
insert into estilomusica values (
    18,
    'Punk'
);

-- Blues Rock
insert into estilomusica values (
    19,
    'Blues Rock'
);

-- Alternativa
insert into estilomusica values (
    20,
    'Alternativa'
);

-- Dance
insert into estilomusica values (
    21,
    'Dance'
);

-- Folk
insert into estilomusica values (
    22,
    'Folk'
);

-- Sertanejo
insert into estilomusica values (
    23,
    'Sertanejo'
);

-- K-pop
insert into estilomusica values (
    24,
    'K-pop'
);

-- Gospel
insert into estilomusica values (
    25,
    'Gospel'
);

-- ---------------------------- ESTILO DE MÚSICA -- FIM


-- ---------------------------- tipoContato -- INÍCIO

insert into tipoContato values(
	1,
	'Celular'
);

insert into tipoContato values(
	2,
	'Telefone'
);

-- ---------------------------- tipoContato -- FIM

-- ---------------------------- tipoRedesocial -- INÍCIO

insert into tipoRedesocial values(
	1,
	'Instagram'
);

insert into tipoRedesocial values(
	2,
	'Facebook'
);

insert into tipoRedesocial values(
	3,
	'Twitter/X'
);

insert into tipoRedesocial values(
	4,
	'Site do estabelecimento'
);

insert into tipoRedesocial values(
	5,
	'Cardápio Online'
);

-- ---------------------------- tipoRedesocial -- FIM



-- ---------------------------- diaSemana -- INÍCIO

insert into diaSemana values(
	1,
	'Domingo',
    '[0]'
);

insert into diaSemana values(
	2,
	'Segunda-feira',
    '[1]'
);

insert into diaSemana values(
	3,
	'Terça-feira',
    '[2]'
);

insert into diaSemana values(
	4,
	'Quarta-feira',
    '[3]'
);

insert into diaSemana values(
	5,
	'Quinta-feira',
    '[4]'
);

insert into diaSemana values(
	6,
	'Sexta-feira',
    '[5]'
);

insert into diaSemana values(
	7,
	'Sábado',
    '[6]'
);

insert into diaSemana values(
	8,
	'Segunda a sexta-feira',
    '[1, 2, 3, 4, 5]'
);

insert into diaSemana values(
	9,
	'Terça a sexta-feira',
    '[2, 3, 4, 5]'
);


insert into diaSemana values(
	10,
	'Final de semana',
    '[0, 6]'
);


-- ---------------------------- diaSemana -- FIM




---------------------------- USUÁRIO WILLIAN -- INÍCIO

insert into ENDERECO values(
	1, -- id
	'18117121', -- cep not null,
	'SP', -- estado not null,
	'Votorantim', -- cidade not null,
    'Rua Pedro Nunes', -- lodradouro not null,
    'Conjunto Habitacional Jardim Serrano', -- bairro not null,
    97 -- numero not null
);

insert into usuario values(
	1,                   -- id
	null,                -- idEstabelecimento
	1,                   -- idEndereco
    'Willian M. Ribeiro',           -- nome
	15,                  -- codigoArea
	999998888,           -- celular
    '44455566677',       -- cpf
    'willian@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '2000-09-24',        -- dataNascimento
	0                    -- tipoUsuario ENUM(0, 1, 2) NOT NULL
);

---------------------------- USUÁRIO WILLIAN -- FIM



---------------------------- USUÁRIO LUCAS -- INÍCIO

insert into ENDERECO values(
	2, -- id
	'1112233', -- cep not null,
	'SP', -- estado not null,
	'Sorocaba', -- cidade not null,
    'Rua do Lucas', -- lodradouro not null,
    'Bairro do Lucas', -- bairro not null,
    1 -- numero not null
);

insert into usuario values(
	2,                   -- id
	null,                -- idEstabelecimento
	2,                   -- idEndereco
    'Lucas Maximiano dos Santos',   -- nome
	15,                  -- codigoArea
	999997777,           -- celular
    '11122244433',       -- cpf
    'lucas@gmail.com',   -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '2000-05-01',        -- dataNascimento
	0 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
);

---------------------------- USUÁRIO LUCAS -- FIM



---------------------------- USUÁRIO ADM JULIO -- INÍCIO

insert into usuario values(
	3,                       -- id
	null,                    -- idEstabelecimento
	null,                    -- idEndereco
    'Julio Cesar de Castro',           -- nome
	15,                      -- codigoArea
	999999999,               -- celular
    '11122233344',           -- cpf
    'kaguebushin@gmail.com', -- email
    'senha123',              -- senha
	null,                    -- fotoPerfil
    '1989-09-24',            -- dataNascimento
	2 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
);

---------------------------- USUÁRIO ADM JULIO -- FIM






-- -----------------------------------------------> Mc Donalds - Votorantim

insert into endereco values( -- Endereço do Mc Donalds 	VOTORANTIM
	3,                  -- id
	'18110375',         -- cep
	'SP',               -- estado
	'Votorantim',                   -- cidade
	'Avenida Moacir Oséias Guitti', -- lodradouro
	'Jardim Paraíso',  -- bairro
	's/n'                  -- numero
);

insert into estabelecimento values(
	1, -- id 
	1, -- idCategoria
	3, -- idEndereco
	'Mc Donalds - Votorantim', -- nome
	'21587059000106', -- cnpj
	null, -- fotoPrincipal   
	'Este é o Mc Donalds de Votorantim', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into usuario values( -- Mc Donalds - Votorantim
	4,                   -- id
	1,                -- idEstabelecimento
	null,                   -- idEndereco
    'usuario04 - MC Donalds',           -- nome
	15,                  -- codigoArea
	999999999,           -- celular
    '11122233355',       -- cpf
    'usuario04@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
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

insert into contato values(
	null,       -- id INT
	3,          -- idTipoContato INT not null, -- TELEFONE
	1,          -- idEstabelecimento INT not null,
	'32431749' -- contato VARCHAR(200) not null
);

insert into contato values(
	null,       -- id INT
	5,          -- idTipoContato INT not null, -- SITE
	1,          -- idEstabelecimento INT not null,
	'https://www.mcdonalds.com.br/' -- contato VARCHAR(200) not null
);

insert into contato values(
	null,       -- id INT
	6,          -- idTipoContato INT not null, -- CARDÁPIO ONLINE
	1,          -- idEstabelecimento INT not null,
	'https://www.mcdonalds.com.br/cardapio'
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

insert into endereco values( -- Endereço do Mc Donalds 	SOROCABA
	4,                  -- id
	'18047620',         -- cep
	'SP',               -- estado
	'Sorocaba',                   -- cidade
	'Avenida Antônio Carlos Comitre', -- lodradouro
	'Parque Campolim',  -- bairro
	'1055'                    -- numero
);

insert into estabelecimento values(
	2, -- id 
    1, -- idCategoria
    4, -- idEndereco
    'Mc Donalds - SOROCABA', -- nome
    '76842463000162', -- cnpj
    null, -- fotoPrincipal   
    'Este é o Mc Donalds de Sorocaba Campolim', -- descricao
    true, -- ativo
    false, -- oculto
    'Validado', -- statusValidacao
    null, -- nota
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);



insert into usuario values( -- Mc Donalds - Votorantim
	5,                   -- id
	2,                -- idEstabelecimento
	null,                   -- idEndereco
    'Dono do MC CAMPOLIM SOROCABA',           -- nome
	15,                  -- codigoArea
	999999999,           -- celular
    '11122233355',       -- cpf
    'usuario05@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
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

insert into contato values(
	null,       -- id INT
	3,          -- idTipoContato INT not null, -- TELEFONE
	2,          -- idEstabelecimento INT not null,
	'34115830' -- contato VARCHAR(200) not null
);

insert into contato values(
	null,       -- id INT
	5,          -- idTipoContato INT not null, -- SITE
	2,          -- idEstabelecimento INT not null,
	'https://www.mcdonalds.com.br/'
);

insert into contato values(
	null,       -- id INT
	6,          -- idTipoContato INT not null, -- CARDÁPIO ONLINE
	2,          -- idEstabelecimento INT not null,
	'https://www.mcdonalds.com.br/cardapio'
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

insert into endereco values(
	5, -- id
	'18110570', -- cep
	'SP', -- estado
	'Votorantim', -- cidade
	'Avenida Matheus Conegero', -- lodradouro
	'Parque Bela Vista', -- bairro
	'35' -- numero
);

insert into estabelecimento values(
	3, -- id 
	1, -- idCategoria
	5, -- idEndereco
	'Kikos Hot-Dog', -- nome
	'11892673000110',  -- cnpj
	null, -- fotoPrincipal   
	'Kikos Hot-Dog DESCRICAO', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into usuario values(
	6,                   -- id
	3,                -- idEstabelecimento
	5,                -- idEndereco
    'Dono do Kiko',           -- nome
	15,                  -- codigoArea
	999999999,           -- celular
    '11122233355',       -- cpf
    'usuario06@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
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

insert into contato values(
	null,       -- id INT
	3,          -- idTipoContato INT not null, -- TELEFONE
	3,          -- idEstabelecimento INT not null,
	'32432019' -- contato VARCHAR(200) not null
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

insert into endereco values(
	6, -- id
	'18116440', -- cep
	'SP', -- estado
	'Votorantim', -- cidade
	'Avenida Santos Dumont', -- lodradouro
	'Vila Domingues', -- bairro
	'526' -- numero
);

insert into estabelecimento values(
	4, -- id 
	2, -- idCategoria
	6, -- idEndereco
	'Pizzaria Booa', -- nome
	'59363162000137',  -- cnpj
	null, -- fotoPrincipal   
	'Pizzaria Booa - DESCRIÇÃO', -- descricao
	true, -- ativo
	false, -- oculto
	'Validado', -- statusValidacao
	null, -- nota
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into usuario values(
	7,                   -- id
	4,                -- idEstabelecimento
	5,                -- idEndereco
    'Dono da Pizzaria Booa Pizza usuario07',           -- nome
	15,                  -- codigoArea
	999999999,           -- celular
    '11122233355',       -- cpf
    'usuario07@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
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

insert into contato values(
	null,       -- id INT
	3,          -- idTipoContato INT not null, -- TELEFONE
	4,          -- idEstabelecimento INT not null,
	'32432020' -- contato VARCHAR(200) not null
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

insert into endereco values( 
	7, -- id
	'18048110', -- cep
	'SP', -- estado
	'Sorocaba', -- cidade
	'Avenida Gisele Constantino', -- lodradouro
	'Parque Campolim', -- bairro
	'1597' -- numero
);

insert into estabelecimento values(
	5,                      -- id 
	6,                      -- idCategoria
	7,                      -- idEndereco
	'Mada Bar',             -- nome
	'73936746000185',       -- cnpj
	null,                   -- fotoPrincipal   
	'Mada Bar - DESCRIÇÃO', -- descricao
	true,                   -- ativo
	false,                   -- oculto
	'Validado',             -- statusValidacao
	null, -- nota
	'2023-09-07', -- dataUltimoAcesso
	'2023-09-07' -- dataUltimoAcesso
);

insert into musica values(
	1, -- id                INT PRIMARY KEY,
	5, -- idEstabelecimento INT not null,
	1 -- idEstiloMusica    INT not null ---------> PAGODE
);

insert into musica values(
	2, -- id                INT PRIMARY KEY,
	5, -- idEstabelecimento INT not null,
	2 -- idEstiloMusica    INT not null ---------> SAMBA
);

insert into musica values(
	3, -- id                INT PRIMARY KEY,
	5, -- idEstabelecimento INT not null,
	3 -- idEstiloMusica    INT not null ---------> FUNK
);

insert into usuario values(
	8,                   -- id
	5,                -- idEstabelecimento
	7,                -- idEndereco
    'Mada Bar usuario08',           -- nome
	15,                  -- codigoArea
	999999999,           -- celular
    '11122233355',       -- cpf
    'usuario08@gmail.com', -- email
    'senha123',          -- senha
	null,                -- fotoPerfil
    '1989-09-24',        -- dataNascimento
	1 -- tipoUsuario ENUM(0, 1, 2) NOT NULL
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

insert into contato values(
	null,       -- id INT
	1,          -- idTipoContato INT not null, -- TELEFONE
	5,          -- idEstabelecimento INT not null,
	'999999999' -- contato VARCHAR(200) not null
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