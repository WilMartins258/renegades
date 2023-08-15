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


-- INSERTS

-- CELULAR

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

-- ENDERECO

insert into endereco values( -- Endereço do usuário 1 (Willian)
	2,          -- id
	'18117-121',         -- cep
	'SP',        -- estado
	'Votorantim',         -- cidade
	'Rua Pedro Nunes',         -- lodradouro
	'Conjunto Habitacional Jardim Serrano',         -- bairro
	97,         -- numero
);

insert into endereco values( -- Endereço do usuário 2 (Lucas)
	2,          -- id
	'11122-33',         -- cep
	'SP',        -- estado
	'Sorocaba',         -- cidade
	'Rua do Lucas',         -- lodradouro
	'Bairro do Lucas',         -- bairro
	1,         -- numero
);

insert into endereco values( -- Endereço do Mc Donalds
	3,                  -- id
	'18110-375',         -- cep
	'SP',               -- estado
	'Votorantim',         -- cidade
	'Rua do Lucas',     -- lodradouro
	'Bairro do Lucas',  -- bairro
	1,                  -- numero
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
	4,                   -- id
	4,                   -- idCelular
	null,                -- idEstabelecimento
	null,                -- idEndereco
	'usuario04',           -- nome
	'usuario04',           -- sobrenome
	'usuario04',       -- nomeUsuario
	null,       -- cpf
	'usuario04@gmail.com', -- email
	'senha123',          -- senha
	null,                -- fotoPerfil
	'2000-01-01'         -- dataNascimento
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

-- ESTABELECIMENTO

insert into estabelecimento values (
	1, -- id
	null, -- idCategoria
	null, -- idContato
	3, -- idEndereco
	null, -- idHorario
	null, -- idCardapio
	null, -- idAvaliacao
	null, -- idcupom
	'Mc Donalds - Votorantim', -- nome
	'21587059000106' -- cnpj
	null, -- fotoPrincipal
	'Melhor lanchonete de votoramtim!!!', -- descricao
	null, -- estiloMusica
	null, -- musicaAoVivo
	false, -- rodizio
	null, -- nota
	false, -- agendamento
	true, -- estacionamento
	true, -- ativo
	true, -- visivel
	'Validado', -- validado ENUM('Pendente', 'Validado', 'Não validado'),
	'2023-08-14' -- dataUltimoAcesso
);
