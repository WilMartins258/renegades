-- --------------------------> ID: 01 PADARIA REAL ---- IN�CIO




/*                                         IMAGEM ESTABELECIMENTO

Para que a imagem do estabelecimento cadastrado apare�a no site corretamente ela deve ser salva no caminho de pasta abaixo:

renegades\client\src\components\Estabelecimento\images

Para que funcione o nome do arquivo deve seguir o padr�o abaixo:

ID_DO_ESTABELECIMENTO.FORMATO DO ESTABELECIMENTO

Exemplo do caminho completo da foto da Padaria Real

renegades\client\src\components\Estabelecimento\images\1.png


Reparem que o formato do arquivo fica no campo chamado de fotoPrincipal e o id � o ID do estabelecimento.
*/


insert into estabelecimento values(
	1, -- id 
	'Padaria Real', -- nome
	'95638013000105', -- cnpj
	'png', -- fotoPrincipal   
	'A Padaria Real � um charmoso estabelecimento que encanta os clientes com seu aroma irresist�vel de p�es e doces frescos. Aqui voc� prova salgados, como a famosa coxinha, p�es artesanais, rod�zio de pizzas no jantar em nossa rede sofisticada e moderna de padarias.', -- descricao
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
    'Jos� Carlos Santos',           -- nome
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

/*                                         IMAGEM DAS RECOMENDA��ES

Para que as imagens das recomenda��es apare�am no site corretamente elas devem ser salvas no caminho de pasta abaixo:

renegades\client\src\images\recomendacao



Para que funcione o nome do arquivo deve seguir o padr�o abaixo:

ID_DA_RECOMENDACAO.FORMATO_DA_FOTO_DA_RECOMENDACAO

Exemplo do caminho completo da foto da recomenda��o da Padaria Real

renegades\client\src\images\recomendacao\1.png


Reparem que o formato do arquivo fica no campo chamado de foto e o id � o ID da recomendacao.
*/


insert into recomendacao values(
	1, -- id
	1, -- idEstabelecimento INT not null,
	'png', -- foto LONGBLOB not null,
	'A Coxinha da Real', -- nome VARCHAR(50) not null,
	'Nossa classica coxinha � com certeza uma das melhores de Sorocaba.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	2, -- id
	1, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'P�o Franc�s Quentinho', -- nome VARCHAR(50) not null,
	'Temos deliciosos e macios p�es franceses o dia todo.'-- descricao VARCHAR(50) not null
);

insert into recomendacao values(
	3, -- id
	1, -- idEstabelecimento INT not null,
	'jpg', -- foto LONGBLOB not null,
	'Cappuccino da Real', -- nome VARCHAR(50) not null,
	'Venha provar nosso delicioso Cappuccino e outros diversos caf�s.'-- descricao VARCHAR(50) not null
);


-- --------------------------> ID: 01 PADARIA REAL ---- FIM