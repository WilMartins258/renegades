const db = require('../models/db.js');

const inserir = async (dadosOpcional, conn) => {
    try {
        const inserirOpcionalEstabelecimentoQuery = `INSERT INTO opcional_estabelecimento (idEstabelecimento, idOpcional) VALUES (?, ?);`;

        const [idOpcionalEstabelecimentoInserido] = await conn.query(inserirOpcionalEstabelecimentoQuery, dadosOpcional);

        return idOpcionalEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir opcional do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const opcionalEstabelecimentoQuery = `
        SELECT op.id, op.nome 
            FROM opcional_estabelecimento oe
            JOIN opcional op ON oe.idOpcional = op.id
                WHERE oe.idEstabelecimento = 1;`;
        const connection = await db;

        const [opcionalEstabelecimento] = await connection.query(opcionalEstabelecimentoQuery, idEstabelecimento);

        return opcionalEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar opcionais do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};