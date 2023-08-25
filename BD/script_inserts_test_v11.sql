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
DELETE FROM PROMOCAO;
DELETE FROM ESTILOMUSICA;
DELETE FROM testTable;
DELETE FROM tipoContato;
DELETE FROM categoriaHorario;


-- INSERTS

-- --------------------------------------------------------- CATEGORIA -- INÍCIO

insert into test values(
	null,
    null
);

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


-- ---------------------------------------------------------> CATEGORIA -- FIM

-- ---------------------------------------------------------> ESTILO DE MÚSICA -- INÍCIO

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

-- ---------------------------------------------------------> ESTILO DE MÚSICA -- FIM


-- --------------------------------------------------------- tipoContato -- INÍCIO

insert into tipoContato values(
	1,
	'Whatsapp'
);

insert into tipoContato values(
	2,
	'Celular (sem Whatsapp)'
);

insert into tipoContato values(
	3,
	'Telefone'
);

insert into tipoContato values(
	4,
	'Instagram'
);

insert into tipoContato values(
	5,
	'Site do estabelecimento'
);

insert into tipoContato values(
	6,
	'Cardápio Online'
);

insert into tipoContato values(
	7,
	'Facebook'
);

-- --------------------------------------------------------- tipoContato -- FIM

-- --------------------------------------------------------- XXXXX -- INÍCIO
-- --------------------------------------------------------- XXXXX -- FIM

-- --------------------------------------------------------- XXXXX -- INÍCIO
-- --------------------------------------------------------- XXXXX -- FIM

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
	'2000-09-24',         -- dataNascimento
	null
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
	'2000-05-01',         -- dataNascimento
	null
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
	'1989-09-24',         -- dataNascimento
	null
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
	'2000-01-01',         -- dataNascimento
	null
);

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
	'Mc Donalds - Votorantim', -- nome
	'21587059000106', -- cnpj
	null, -- fotoPrincipal
	'Este é o Mc Donalds de Votorantim', -- descricao
	false, -- musicaAoVivo
	false, -- rodizio
	false, -- agendamento
	true, -- estacionamento
	false, -- areaKids         
	true, -- ativo
	true, -- visivel
	'Validado', -- validado         
	null, -- nota
	'2023-08-21' -- dataUltimoAcesso
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
	'2000-01-01',           -- dataNascimento
	null
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
	'1055'                  -- numero
);

insert into horario values(
	2, -- id                
	'[0, 1, 2, 3, 4, 5, 6]', -- diasFuncionamento 
	090000,            -- domingoInicio     TIME,
	020000,            -- domingoFim        TIME,
	090000,            -- segundaInicio     TIME,
	020000,            -- segundaFim        TIME,
	090000,            -- tercaInicio       TIME,
	020000,            -- tercaFim          TIME,
	090000,            -- quartaInicio      TIME,
	020000,            -- quartaFim         TIME,
	090000,            -- quintaInicio      TIME,
	020000,            -- quintaFim         TIME,
	090000,            -- sextaInicio       TIME,
	040000,            -- sextaFim          TIME,
	090000,            -- sabadoInicio      TIME,
	050000             -- sabadoFim         TIME
);

insert into contato values(
	2,                                      -- id
	15,                                     -- codigoArea01
	999999999,                              -- numero01 
	true,                                   -- temWhasapp01 
	15,                                     -- codigoArea02 
	34115830,                               -- numero02 
	false,                                  -- temWhasapp02 
	'https://www.mcdonalds.com.br/',        -- site  
	'https://www.mcdonalds.com.br/cardapio' -- cardapioOnline 
);

insert into cardapio values(
	2, -- id              INT PRIMARY KEY AUTO_INCREMENT,
	'Sorocaba MC',              -- fotoItem01      BLOB not null,
	'Big Mac - Sorocaba',           -- nomeItem01      VARCHAR(50) not null,
	'Big Mac Sorocaba descrição', -- descricaoItem01 VARCHAR(50) not null,
	null,                -- fotoItem02      BLOB,
	null,                -- nomeItem02      VARCHAR(50),
	null,                -- descricaoItem02 VARCHAR(50),
	null,                -- fotoItem03      BLOB,
	null,                -- nomeItem03      VARCHAR(50),
	null                -- descricaoItem03 VARCHAR(50)
);

insert into estabelecimento values ( -- Mc Donalds - Sorocaba
	2, -- id
	1, -- idCategoria
	null, -- idEstiloMusica
	2, -- idContato
	4, -- idEndereco
	2, -- idHorario
	2, -- idCardapio
	'Mc Donalds - Sorocaba', -- nome
	'76842463000162', -- cnpj
	null, -- fotoPrincipal
	'Este é o Mc Donalds de Sorocaba Campolim', -- descricao
	false, -- musicaAoVivo
	false, -- rodizio
	false, -- agendamento
	true, -- estacionamento
	false, -- areaKids         
	true, -- ativo
	true, -- visivel
	'Validado', -- validado         
	null, -- nota
	'2023-08-21' -- dataUltimoAcesso
);

insert into usuario values(
	5,                   -- id
	4,                   -- idCelular
	2,                -- idEstabelecimento
	null,                -- idEndereco
	'Dono do MC CAMPOLIM SOROCABA',           -- nome
	'usuario05',           -- sobrenome
	'usuario05',       -- nomeUsuario
	null,       -- cpf
	'usuario05@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01',         -- dataNascimento
	null
);



-- <----------------------------------------------> Mc Donalds - SOROCABA


-- -----------------------------------------------> Kiko's Hot-Dog

insert into endereco values(
	5, -- id
	'18110570', -- cep
	'SP', -- estado
	'Votorantim', -- cidade
	'Avenida Matheus Conegero', -- lodradouro
	'Parque Bela Vista', -- bairro
	'35' -- numero
);

insert into horario values(
	3, -- id                
	'[0, 1, 2, 3, 4, 5, 6]', -- diasFuncionamento 
	180000, -- domingoInicio     TIME,
	000000, -- domingoFim        TIME,
	180000, -- segundaInicio     TIME,
	000000, -- segundaFim        TIME,
	180000, -- tercaInicio       TIME,
	000000, -- tercaFim          TIME,
	180000, -- quartaInicio      TIME,
	000000, -- quartaFim         TIME,
	180000, -- quintaInicio      TIME,
	000000, -- quintaFim         TIME,
	180000, -- sextaInicio       TIME,
	000000, -- sextaFim          TIME,
	180000, -- sabadoInicio      TIME,
	000000  -- sabadoFim         TIME
);

insert into contato values(
	3,                                      -- id
	15,                                     -- codigoArea01
	999999999,                              -- numero01 
	true,                                   -- temWhasapp01 
	15,                                     -- codigoArea02 
	32432019,                               -- numero02 
	false,                                  -- temWhasapp02 
	null,        -- site  
	null -- cardapioOnline 
);

insert into cardapio values(
	3, -- id              INT PRIMARY KEY AUTO_INCREMENT,
	'Foto hot dog especial',              -- fotoItem01      BLOB not null,
	'hot dog especial',           -- nomeItem01      VARCHAR(50) not null,
	'hot dog especial descricao', -- descricaoItem01 VARCHAR(50) not null,
	null,                -- fotoItem02      BLOB,
	null,                -- nomeItem02      VARCHAR(50),
	null,                -- descricaoItem02 VARCHAR(50),
	null,                -- fotoItem03      BLOB,
	null,                -- nomeItem03      VARCHAR(50),
	null                -- descricaoItem03 VARCHAR(50)
);

insert into estabelecimento values (
	3, -- id
	1, -- idCategoria
	null, -- idEstiloMusica
	3, -- idContato
	5, -- idEndereco
	3, -- idHorario
	3, -- idCardapio
	'Kikos Hot-Dog', -- nome
	'11892673000110', -- cnpj
	null, -- fotoPrincipal
	'Kikos Hot-Dog DESCRICAO', -- descricao
	false, -- musicaAoVivo
	false, -- rodizio
	false, -- agendamento
	false, -- estacionamento
	false, -- areaKids         
	true, -- ativo
	true, -- visivel
	'Validado', -- validado  
	null, -- nota
	'2023-08-21' -- dataUltimoAcesso
);

insert into usuario values(
	6,                   -- id
	5,                   -- idCelular
	3,                -- idEstabelecimento
	null,                -- idEndereco
	'Dono do Kiko',           -- nome
	'usuario06',           -- sobrenome
	'usuario06',       -- nomeUsuario
	null,       -- cpf
	'usuario06@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01',         -- dataNascimento
	null
);



-- <----------------------------------------------> Kiko's Hot-Dog

-- -----------------------------------------------> Pizzaria Booa Pizza

insert into endereco values(
	6, -- id
	'18116440', -- cep
	'SP', -- estado
	'Votorantim', -- cidade
	'Avenida Santos Dumont', -- lodradouro
	'Vila Domingues', -- bairro
	'526' -- numero
);

insert into horario values(
	4, -- id                
	'[0, 1, 2, 3, 4, 5, 6]', -- diasFuncionamento 
	180000, -- domingoInicio     TIME,
	000000, -- domingoFim        TIME,
	180000, -- segundaInicio     TIME,
	000000, -- segundaFim        TIME,
	180000, -- tercaInicio       TIME,
	000000, -- tercaFim          TIME,
	180000, -- quartaInicio      TIME,
	000000, -- quartaFim         TIME,
	180000, -- quintaInicio      TIME,
	000000, -- quintaFim         TIME,
	180000, -- sextaInicio       TIME,
	000000, -- sextaFim          TIME,
	180000, -- sabadoInicio      TIME,
	000000  -- sabadoFim         TIME
);

insert into contato values(
	4,                                      -- id
	15,                                     -- codigoArea01
	999999999,                              -- numero01 
	true,                                   -- temWhasapp01 
	15,                                     -- codigoArea02 
	32432020,                               -- numero02 
	false,                                  -- temWhasapp02 
	'https://www.mcdonalds.com.br/',        -- site  
	'https://www.mcdonalds.com.br/cardapio' -- cardapioOnline 
);

insert into cardapio values(
	4, -- id              INT PRIMARY KEY AUTO_INCREMENT,
	'pizza booa',              -- fotoItem01      BLOB not null,
	'Pizza de Calabresa',           -- nomeItem01      VARCHAR(50) not null,
	'Pizza de calabresa deliciosa', -- descricaoItem01 VARCHAR(50) not null,
	null,                -- fotoItem02      BLOB,
	null,                -- nomeItem02      VARCHAR(50),
	null,                -- descricaoItem02 VARCHAR(50),
	null,                -- fotoItem03      BLOB,
	null,                -- nomeItem03      VARCHAR(50),
	null                -- descricaoItem03 VARCHAR(50)
);

insert into estabelecimento values (
	4, -- id
	2, -- idCategoria
	null, -- idEstiloMusica
	4, -- idContato
	6, -- idEndereco
	4, -- idHorario
	4, -- idCardapio
	'Pizzaria Booa', -- nome
	'59363162000137', -- cnpj
	null, -- fotoPrincipal
	'Além de cachorros-quentes, a lanchonete oferece fritas e bebidas em ambiente informal e colorido com mezanino. DESCRICAO', -- descricao
	false, -- musicaAoVivo
	true, -- rodizio
	false, -- agendamento
	false, -- estacionamento
	false, -- areaKids         
	true, -- ativo
	true, -- visivel
	'Validado', -- validado  
	null, -- nota
	'2023-08-21' -- dataUltimoAcesso
);

insert into usuario values(
	7,                   -- id
	7,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'Dono da Pizzaria Booa Pizza usuario07',           -- nome
	'usuario07',           -- sobrenome
	'usuario07',       -- nomeUsuario
	null,       -- cpf
	'usuario07@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01',         -- dataNascimento
	null
);



-- <----------------------------------------------> Pizzaria Booa Pizza

-- -----------------------------------------------> Mada Bar

insert into endereco values(
	7, -- id
	'18048110', -- cep
	'SP', -- estado
	'Sorocaba', -- cidade
	'Avenida Gisele Constantino', -- lodradouro
	'Parque Campolim', -- bairro
	'1597' -- numero
);

-- Esses horários são fictícios pois naõ há dados no Google
insert into horario values(
	5, -- id                
	'[0, 1, 2, 3, 4, 5, 6]', -- diasFuncionamento 
	200000, -- domingoInicio     TIME,
	040000, -- domingoFim        TIME,
	200000, -- segundaInicio     TIME,
	040000, -- segundaFim        TIME,
	200000, -- tercaInicio       TIME,
	040000, -- tercaFim          TIME,
	200000, -- quartaInicio      TIME,
	040000, -- quartaFim         TIME,
	200000, -- quintaInicio      TIME,
	040000, -- quintaFim         TIME,
	200000, -- sextaInicio       TIME,
	040000, -- sextaFim          TIME,
	200000, -- sabadoInicio      TIME,
	040000  -- sabadoFim         TIME
);

insert into contato values(
	5,                                      -- id
	15,                                     -- codigoArea01
	999999999,                              -- numero01 
	true,                                   -- temWhasapp01 
	15,                                     -- codigoArea02 
	974042717,                               -- numero02 
	false,                                  -- temWhasapp02 
	'https://www.mcdonalds.com.br/',        -- site  
	'https://www.mcdonalds.com.br/cardapio' -- cardapioOnline 
);

insert into cardapio values(
	5, -- id              INT PRIMARY KEY AUTO_INCREMENT,
	'Drink do Mada FOTO',              -- fotoItem01      BLOB not null,
	'Drink do Mada',           -- nomeItem01      VARCHAR(50) not null,
	'Drink do Mada DESCRICAO', -- descricaoItem01 VARCHAR(50) not null,
	null,                -- fotoItem02      BLOB,
	null,                -- nomeItem02      VARCHAR(50),
	null,                -- descricaoItem02 VARCHAR(50),
	null,                -- fotoItem03      BLOB,
	null,                -- nomeItem03      VARCHAR(50),
	null                -- descricaoItem03 VARCHAR(50)
);

insert into estabelecimento values (
	5, -- id
	6, -- idCategoria
	3, -- idEstiloMusica
	5, -- idContato
	7, -- idEndereco
	5, -- idHorario
	5, -- idCardapio
	'Mada Bar', -- nome
	'73936746000185', -- cnpj
	null, -- fotoPrincipal
	'Mada Bar DESCRICAO', -- descricao
	false, -- musicaAoVivo
	false, -- rodizio
	false, -- agendamento
	false, -- estacionamento
	false, -- areaKids         
	true, -- ativo
	true, -- visivel
	'Validado', -- validado  
	null, -- nota
	'2023-08-21' -- dataUltimoAcesso
);

insert into usuario values(
	8,                   -- id
	8,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'Mada Bar usuario08',           -- nome
	'usuario08',           -- sobrenome
	'usuario08',       -- nomeUsuario
	null,       -- cpf
	'usuario08@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01',         -- dataNascimento
	null
);



-- <----------------------------------------------> Mada Bar
