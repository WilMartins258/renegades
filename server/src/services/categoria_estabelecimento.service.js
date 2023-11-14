const db = require('../models/db.js');

const inserir = async (dadosCategoria, conn) => {
    try {
        const inserirCategoriaEstabelecimentoQuery = `INSERT INTO categoria_estabelecimento (idEstabelecimento, idCategoria) VALUES (?, ?);`;

        const [idCategoriaEstabelecimentoInserido] = await conn.query(inserirCategoriaEstabelecimentoQuery, dadosCategoria);

        return idCategoriaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const categoriaEstabelecimentoQuery = `
        SELECT cat.id, cat.nome, ce.id as 'idCategoriaEstabelecimento'
            FROM categoria_estabelecimento ce
            JOIN categoria cat ON ce.idCategoria = cat.id
                WHERE ce.idEstabelecimento = ?;`;
        const connection = await db;

        const [categoriaEstabelecimento] = await connection.query(categoriaEstabelecimentoQuery, idEstabelecimento);

        return categoriaEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar categorias do estabelecimento: ${error.message}`);
    }
};

const excluir = async (dadosExclusao, conn) => {
    try {
        const excluirCategoriaEstabelecimentoQuery = `DELETE FROM categoria_estabelecimento WHERE idEstabelecimento = ? AND idCategoria = ?;`;

        await conn.query(excluirCategoriaEstabelecimentoQuery, dadosExclusao);
    } catch (error) {
        throw new Error(`Erro ao excluir categoria do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};