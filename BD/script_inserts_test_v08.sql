-- RESET

DELETE FROM AVALIACAO;
DELETE FROM USUARIO;
DELETE FROM ESTABELECIMENTO;
DELETE FROM CELULAR;
DELETE FROM ENDERECO;
DELETE FROM CONTATO;
DELETE FROM CATEGORIA;
DELETE FROM CARDAPIO;
DELETE FROM HORARIO;
DELETE FROM CUPOM;
DELETE FROM ESTILOMUSICA;
DELETE FROM TEST;


-- INSERTS

-- --------------------------------------------------------- CATEGORIA

insert into test values(
	null,
    null
);

insert into categoria values(
	null,
	'Lanchonete'
);

insert into categoria values(
	null,
	'Pizzaria'
);

insert into categoria values(
	null,
	'Hamburgueria'
);

insert into categoria values(
	null,
	'Restaurante'
);

insert into categoria values(
	null,
	'Pastelaria'
);

insert into categoria values(
	null,
	'Barzinho'
);

insert into categoria values(
	null,
	'Sorveteria'
);

insert into categoria values(
	null,
	'Açaiteria'
);

insert into categoria values(
	null,
	'Padaria'
);

insert into categoria values(
	null,
	'Churrascaria'
);

insert into categoria values(
	null,
	'Cafeteria'
);

insert into categoria values(
	null,
	'Sushi bar'
);

insert into categoria values(
	null,
	'Food truck'
);

insert into categoria values(
	null,
	'Creperia'
);

insert into categoria values(
	null,
	'Doceria'
);

insert into categoria values(
	null,
	'Comida de rua'
);

insert into categoria values(
	null,
	'Sucaria'
);

insert into categoria values(
	null,
	'Sucaria'
);

-- ---------------------------------------------------------> CATEGORIA


-- CELULAR

-- ---------------------------------------------------------> CELULAR

insert into celular values(
	1,          -- id
	15,         -- codigoArea
	'999999999' -- numero
);

insert into celular values(
	2,          -- id
	15,            -- codigoArea
	'8888888888'    -- numero
);

insert into celular values(
	3,          -- id
	15,         -- codigoArea
	'777777777' -- numero
);

insert into celular values(
	4,          -- id
	15,         -- codigoArea
	'111111111' -- numero
);

insert into celular values(
	5,          -- id
	15,         -- codigoArea
	'222222222' -- numero
);

insert into celular values(
	6,          -- id
	15,         -- codigoArea
	'3333333333' -- numero
);

insert into celular values(
	7,          -- id
	15,         -- codigoArea
	'444444444' -- numero
);

insert into celular values(
	8,          -- id
	15,         -- codigoArea
	'555555555' -- numero
);

insert into celular values(
	9,          -- id
	15,         -- codigoArea
	'123456789' -- numero
);

-- ---------------------------------------------------------> CELULAR

-- ENDERECO

insert into endereco values( -- Endereço do usuário 1 (Willian)
	1,          -- id
	'18117121',         -- cep
	'SP',        -- estado
	'Votorantim',         -- cidade
	'Rua Pedro Nunes',         -- lodradouro
	'Conjunto Habitacional Jardim Serrano',         -- bairro
	97         -- numero
);

insert into endereco values( -- Endereço do usuário 2 (Lucas)
	2,                 -- id
	'1112233',         -- cep
	'SP',              -- estado
	'Sorocaba',        -- cidade
	'Rua do Lucas',    -- lodradouro
	'Bairro do Lucas', -- bairro
	1                  -- numero
);

-- USUARIO

insert into usuario values(
	1,                   -- id
	1,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'Willian',           -- nome
	'Martins',           -- sobrenome
	'willmartins',       -- nomeUsuario
	'44455566677',       -- cpf
	'willian@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-09-24'         -- dataNascimento
);

insert into usuario values(
	2,                   -- id
	2,                   -- idCelular
	null,                -- idEstabelecimento
	1,                -- idEndereco
	'Lucas Maximiano',           -- nome
	'dos Santos',           -- sobrenome
	'lusantos',       -- nomeUsuario
	'11122244433',       -- cpf
	'lucas@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-05-01'         -- dataNascimento
);

insert into usuario values(
	3,                   -- id
	3,                   -- idCelular
	null,                -- idEstabelecimento
	2,                -- idEndereco
	'Julio Cesar',           -- nome
	'Castro',           -- sobrenome
	'kaguebushin',       -- nomeUsuario
	'11122233344',       -- cpf
	'kaguebushin@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'1989-09-24'         -- dataNascimento
);

insert into usuario values(
	5,                   -- id
	5,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'usuario05',           -- nome
	'usuario05',           -- sobrenome
	'usuario05',       -- nomeUsuario
	null,       -- cpf
	'usuario05@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01'         -- dataNascimento
);

insert into usuario values(
	6,                   -- id
	6,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'usuario06',           -- nome
	'usuario06',           -- sobrenome
	'usuario06',       -- nomeUsuario
	null,       -- cpf
	'usuario06@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01'         -- dataNascimento
);

insert into usuario values(
	7,                   -- id
	7,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'usuario07',           -- nome
	'usuario07',           -- sobrenome
	'usuario07',       -- nomeUsuario
	null,       -- cpf
	'usuario07@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01'         -- dataNascimento
);

insert into usuario values(
	8,                   -- id
	8,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'usuario08',           -- nome
	'usuario08',           -- sobrenome
	'usuario08',       -- nomeUsuario
	null,       -- cpf
	'usuario08@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01'         -- dataNascimento
);

insert into usuario values(
	9,                   -- id
	9,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'usuario09',           -- nome
	'usuario09',           -- sobrenome
	'usuario09',       -- nomeUsuario
	null,       -- cpf
	'usuario09@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01'         -- dataNascimento
);

-- -----------------------------------------------> Mc Donalds - Votorantim

insert into endereco values( -- Endereço do Mc Donalds
	3,                  -- id
	'18110375',         -- cep
	'SP',               -- estado
	'Votorantim',                   -- cidade
	'Avenida Moacir Oséias Guitti', -- lodradouro
	'Jardim Paraíso',  -- bairro
	's/n'                  -- numero
);

insert into horario values(
	1, -- id                
	'[0, 1, 2, 3, 4, 5, 6]', -- diasFuncionamento 
	100000,            -- domingoInicio     TIME,
	000000,            -- domingoFim        TIME,
	100000,            -- segundaInicio     TIME,
	020000,            -- segundaFim        TIME,
	100000,            -- tercaInicio       TIME,
	020000,            -- tercaFim          TIME,
	100000,            -- quartaInicio      TIME,
	020000,            -- quartaFim         TIME,
	100000,            -- quintaInicio      TIME,
	020000,            -- quintaFim         TIME,
	100000,            -- sextaInicio       TIME,
	040000,            -- sextaFim          TIME,
	100000,            -- sabadoInicio      TIME,
	040000             -- sabadoFim         TIME
);

insert into contato values(
	1,                                      -- id
	15,                                     -- codigoArea01
	999999999,                              -- numero01 
	true,                                   -- temWhasapp01 
	15,                                     -- codigoArea02 
	32431749,                               -- numero02 
	false,                                  -- temWhasapp02 
	'https://www.mcdonalds.com.br/',        -- site  
	'https://www.mcdonalds.com.br/cardapio' -- cardapioOnline 
);

insert into cardapio values(
	1, -- id              INT PRIMARY KEY AUTO_INCREMENT,
	'test',              -- fotoItem01      BLOB not null,
	'Big Mac',           -- nomeItem01      VARCHAR(50) not null,
	'Big Mac descrição', -- descricaoItem01 VARCHAR(50) not null,
	null,                -- fotoItem02      BLOB,
	null,                -- nomeItem02      VARCHAR(50),
	null,                -- descricaoItem02 VARCHAR(50),
	null,                -- fotoItem03      BLOB,
	null,                -- nomeItem03      VARCHAR(50),
	null                -- descricaoItem03 VARCHAR(50)
);

-- ESTABELECIMENTO

insert into estabelecimento values ( -- Mc Donalds - Votorantim
	1, -- id
	1, -- idCategoria
	null, -- idEstiloMusica
	1, -- idContato
	3, -- idEndereco
	1, -- idHorario
	1, -- idCardapio
	null, -- idAvaliacao
	null, -- idcupom
	'Mc Donalds - Votorantim', -- nome
	'21587059000106', -- cnpj
	null, -- fotoPrincipal
	'Este é o Mc Donalds de Votorantim', -- descricao
	null, -- musicaAoVivo
	false, -- rodizio
	false, -- agendamento
	true, -- estacionamento
	true, -- ativo
	true, -- visivel
	'Validado',
	null, -- nota
	'2023-08-15' -- dataUltimoAcesso
);

insert into usuario values( -- Mc Donalds - Votorantim
	4,                     -- id
	4,                     -- idCelular
	1,                     -- idEstabelecimento
	null,                  -- idEndereco
	'usuario04',           -- nome
	'usuario04',           -- sobrenome
	'usuario04',           -- nomeUsuario
	null,                  -- cpf
	'usuario04@gmail.com', -- email
	'senha123',            -- senha
	null,                  -- fotoPerfil
	'2000-01-01'           -- dataNascimento
);

-- <----------------------------------------------> Mc Donalds - Votorantim
