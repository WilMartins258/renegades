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

const excluir = async (dadosExclusao, conn) => {
    try {
        const estabelecimentoQuery = `DELETE FROM musica_estabelecimento WHERE idEstabelecimento = ? AND idEstiloMusica = ?;`;

        await conn.query(estabelecimentoQuery, dadosExclusao);
    } catch (error) {
        throw new Error(`Erro ao excluir estilo de música do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};