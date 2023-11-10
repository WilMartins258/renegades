INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, status, dataInicio, dataFim) VALUES (
	1, -- idEstabelecimento
	'Mc lanche metade do preço', -- nome
	'Apresente o código da promoção no momento da finalização da compra e receba um desconto de metade do valor do seu lanche', -- descricao
	'XXY-38', -- codigo
	'Ativa', -- ENUM('Ativa', 'Inativa', 'Vencida') DEFAULT 'Ativa'
	'2023-10-14', -- dataInicio
	'2023-12-20' -- dataFim
);