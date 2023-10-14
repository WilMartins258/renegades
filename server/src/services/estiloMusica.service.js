const db = require('../models/db.js');

const inserir = async (dadosEstiloMusica) => {
    try {
        const estiloMusicaQuery = `INSERT into estiloMusica (nome, ativo) VALUES (?, ?);`;
        const connection = await db;

        const [insercaoEstiloMusica] = await connection.query(estiloMusicaQuery, dadosEstiloMusica);

        return insercaoEstiloMusica?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir estilo de música: ${error.message}`);
    }
};

const atualizar = async (novosDadosEstiloMusica) => {
    try {
        const estiloMusicaQuery = `
        UPDATE estiloMusica
            SET nome = ?, ativo = ?
            WHERE id = ?;`;
        const connection = await db;

        await connection.query(estiloMusicaQuery, novosDadosEstiloMusica);
    } catch (error) {
        throw new Error(`Erro ao atualizar estilo de música: ${error.message}`);
    }
};

const pegarTudo = async () => {
    try {
        const estiloMusicaQuery = "SELECT * FROM estiloMusica;";
        const connection = await db;

        const [estilosMusica] = await connection.query(estiloMusicaQuery);

        return estilosMusica;
    } catch (error) {
        throw new Error(`Erro ao buscar estilos de música: ${error.message}`);
    }
}

module.exports = {
    inserir,
    atualizar,
    pegarTudo
};