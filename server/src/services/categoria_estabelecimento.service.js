const db = require('../models/db.js');

const inserir = async (categoriaData) => {
    try {
        const inserirCategoriaEstabelecimentoQuery = `INSERT INTO categoria_estabelecimento  VALUES ( null, ?, ? );`;
        const connection = await db;

        const [idCategoriaEstabelecimentoInserido] = await connection.query(inserirCategoriaEstabelecimentoQuery, categoriaData);

        return idCategoriaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
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