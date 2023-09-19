const db = require('../models/db.js');

/*
    idEstabelecimento
    idCategoria
*/
const createCategoria_Estabelecimento = async (categoriaData) => {
    try {
        const inserirCategoriaEstabelecimentoQuery = `INSERT INTO categoria_estabelecimento  VALUES ( null, ?, ? );`;
        const connection = await db;

        const [idCategoriaEstabelecimentoInserido] = await connection.query(inserirCategoriaEstabelecimentoQuery, categoriaData);

        return idCategoriaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    createCategoria_Estabelecimento
};