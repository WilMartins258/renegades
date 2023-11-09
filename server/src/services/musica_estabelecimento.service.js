const db = require('../models/db.js');

const inserir = async (dadoDeMusica, conn) => {
    try {
        const inserirMusicaEstabelecimentoQuery = `INSERT INTO musica_estabelecimento (idEstabelecimento, idEstiloMusica) VALUES (?, ?);`;

        const [idMusicaEstabelecimentoInserido] = await conn.query(inserirMusicaEstabelecimentoQuery, dadoDeMusica);

        return idMusicaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(error);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const musicaEstabelecimentoQuery = `
        SELECT m.id, m.nome, me.id as 'idMusicaEstabelecimento'
            FROM musica_estabelecimento me
            JOIN estiloMusica m ON me.idEstiloMusica = m.id
                WHERE me.idEstabelecimento = ?;`;
        const connection = await db;

        const [musicasEstabelecimento] = await connection.query(musicaEstabelecimentoQuery, idEstabelecimento);

        return musicasEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar musicas do estabelecimento: ${error.message}`);
    }
};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};