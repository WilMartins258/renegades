const db = require('../models/db.js');

const inserir = async (dadosOpcional) => {
    try {
        const inserirOpcionalEstabelecimentoQuery = `INSERT INTO opcional_estabelecimento  VALUES ( null, ?, ? );`;
        const connection = await db;

        const [idOpcionalEstabelecimentoInserido] = await connection.query(inserirOpcionalEstabelecimentoQuery, dadosOpcional);

        return idOpcionalEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir opcional do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorId = async () => {};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorId,
    excluir
};