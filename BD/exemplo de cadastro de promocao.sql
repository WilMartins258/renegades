INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, status, dataInicio, dataFim) VALUES (
	1, -- idEstabelecimento
	'Mc lanche metade do pre�o', -- nome
	'Apresente o c�digo da promo��o no momento da finaliza��o da compra e receba um desconto de metade do valor do seu lanche', -- descricao
	'XXY-38', -- codigo
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa'
	'2023-10-14', -- dataInicio
	'2023-12-20' -- dataFim
);