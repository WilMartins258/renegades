const db = require('../models/db.js');

const inserir = async (dadoDeMusica) => {
    try {
        const inserirMusicaEstabelecimentoQuery = `INSERT INTO musica_estabelecimento (idEstabelecimento, idEstiloMusica) VALUES ( ?, ? );`;
        const connection = await db;

        const [idMusicaEstabelecimentoInserido] = await connection.query(inserirMusicaEstabelecimentoQuery, dadoDeMusica);

        return idMusicaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(error);
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