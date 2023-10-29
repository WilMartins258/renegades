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
        SELECT cat.id, cat.nome
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

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};