const db = require('../models/db.js');

const createOpcional_Estabelecimento = async (opcionalData) => {
    try {
        const inserirOpcionalEstabelecimentoQuery = `INSERT INTO opcional_estabelecimento  VALUES ( null, ?, ? );`;
        const connection = await db;

        const [idOpcionalEstabelecimentoInserido] = await connection.query(inserirOpcionalEstabelecimentoQuery, opcionalData);

        return idOpcionalEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir opcional do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    createOpcional_Estabelecimento
};