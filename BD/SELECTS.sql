USE renegades_stage;

SELECT * FROM categoria;
SELECT * FROM estiloMusica;
SELECT * FROM contato;
SELECT * FROM redeSocial;
SELECT * FROM comida;
SELECT * FROM diaSemana;
SELECT * FROM opcional;
SELECT * FROM usuario;
SELECT * FROM estabelecimento;
SELECT * FROM horario;
SELECT * FROM recomendacao;
SELECT * FROM promocao;
SELECT * FROM redeSocial_estabelecimento;
SELECT * FROM contato_estabelecimento;
SELECT * FROM opcional_estabelecimento;
SELECT * FROM comida_estabelecimento;
SELECT * FROM categoria_estabelecimento;
SELECT * FROM musica_estabelecimento;
SELECT * FROM avaliacao;
SELECT * FROM favorito;

SELECT p.idEstabelecimento, p.nome, p.descricao, p.codigo, p.dataInicio, p.dataFim
	FROM promocao p
    LEFT JOIN categoria_estabelecimento cat_e ON cat_e.idEstabelecimento = p.idEstabelecimento
    WHERE p.status = 'Ativa';

-- Query para identificar estabelecimentos pelos opcionais
-- SELECT e.nome
	-- FROM estabelecimento e
    -- LEFT JOIN opcional_estabelecimento op_e ON e.id = op_e.idEstabelecimento
    -- LEFT JOIN opcional op ON op.id = op_e.idOpcional
		-- WHERE op.id = 5;

