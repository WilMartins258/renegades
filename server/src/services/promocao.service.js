const db = require('../models/db.js');

const inserir = async (dadosPromocao) => {
    try {
        const promocaoQuery = `INSERT into opcional (nome, ativo) VALUES (?, ?);`;
        const connection = await db;

        const [insercaoPromocao] = await connection.query(promocaoQuery, dadosPromocao);

        return insercaoPromocao?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir promocao: ${error.message}`);
    }
};

const pegarPromocoesAtivas = async () => {
    try {
        const promocaoQuery = `SELECT * FROM promocao WHERE status = 'Ativa';`;
        const connection = await db;

        const [promocoesAtivas] = await connection.query(promocaoQuery);

        return promocoesAtivas;
    } catch (error) {
        throw new Error(`Erro ao buscar promocoes: ${error.message}`);
    }
}

const verificarValidadeDePromocoes = async () => {
    try {
        const promocoesQuery = `INSERT into opcional (nome, ativo) VALUES (?, ?);`;
        const connection = await db;

        const [insercaoOpcional] = await connection.query(promocoesQuery);

        return insercaoOpcional?.insertId;
    } catch (error) {
        throw new Error(`Erro ao verificar validade de promoções: ${error.message}`);
    }
};

module.exports = {
    inserir,
    pegarPromocoesAtivas,
    verificarValidadeDePromocoes
};