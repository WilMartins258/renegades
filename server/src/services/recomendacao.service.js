const db = require('../models/db.js');

const inserir = async (dadosRecomendacao) => {
    try {
        const recomendacaoQuery = `INSERT INTO recomendacao (idEstabelecimento, nome, descricao, foto) VALUES (?, ?, ?, ?);`;
        const connection = await db;

        const [idRecomendacaoInserido] = await connection.query(recomendacaoQuery, dadosRecomendacao);

        return idRecomendacaoInserido?.insertId;
    } catch (error) {
        throw new Error(error);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};