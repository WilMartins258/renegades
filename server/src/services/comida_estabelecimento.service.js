const db = require('../models/db.js');

const inserir = async (dadosComida, conn) => {
    try {
        const inserirComidaEstabelecimentoQuery = `INSERT INTO comida_estabelecimento (idEstabelecimento, idComida) VALUES (?, ?);`;

        const [idComidaEstabelecimentoInserido] = await conn.query(inserirComidaEstabelecimentoQuery, dadosComida);

        return idComidaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir comida do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const comidaEstabelecimentoQuery = ``;
        const connection = await db;

        const [comidasEstabelecimento] = await connection.query(comidaEstabelecimentoQuery, idEstabelecimento);

        return comidasEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar comidas do estabelecimento: ${error.message}`);
    }
};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};