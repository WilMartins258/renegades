const db = require('../models/db.js');

const inserir = async (dadosPromocao) => {
    try {
        const promocaoQuery = 'INSERT INTO promocao (idEstabelecimento, nome, descricao, codigo, dataInicio, dataFim) VALUES (?, ?, ?, ?, ?, ?);';
        const connection = await db;

        const [insercaoPromocao] = await connection.query(promocaoQuery, dadosPromocao);

        return insercaoPromocao?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir promocao: ${error.message}`);
    }
};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const promocaoQuery = 'SELECT * FROM promocao WHERE idEstabelecimento = ?;';
        const connection = await db;

        const [promocao] = await connection.query(promocaoQuery, idEstabelecimento);
        return promocao;
    } catch (error) {
        throw new Error(`Erro ao buscar promoções: ${error.message}`);
    }
};

const pegarTodasPromocoesAtivas = async () => {
    try {
        const promocaoQuery = `
        SELECT p.idEstabelecimento, p.nome as 'nomePromo', p.descricao, p.codigo, p.dataInicio, p.dataFim, e.numeroEstabelecimento, e.logradouro, e.bairro, e.cidade, e.nome,
        (
            SELECT GROUP_CONCAT(c.nome) 
            FROM categoria_estabelecimento cat_e 
            JOIN categoria c ON cat_e.idCategoria = c.id 
            WHERE cat_e.idEstabelecimento = p.idEstabelecimento
        ) AS categoriasString
        FROM promocao p
			LEFT JOIN estabelecimento e ON e.id = p.idEstabelecimento
				WHERE p.status = 'Ativa';`;
        const connection = await db;

        const [promocoesAtivas] = await connection.query(promocaoQuery);

        return promocoesAtivas;
    } catch (error) {
        throw new Error(`Erro ao buscar promocoes: ${error.message}`);
    }
}

const verificarValidadeDePromocoes = async () => {
    try {
        const connection = await db;
        await connection.execute('CALL AtualizarStatusPromocoes()');
    } catch (error) {
        throw new Error(`Erro ao verificar validade de promoções: ${error.message}`);
    }
};

module.exports = {
    inserir,
    pegarTodasPromocoesAtivas,
    pegarPorIdEstabelecimento,
    verificarValidadeDePromocoes
};