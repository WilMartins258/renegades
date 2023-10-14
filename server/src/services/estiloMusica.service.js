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

const pegarTudo = async () => {
    const estiloMusicaQuery = "SELECT * FROM estiloMusica;";
    const connection = await db;

    const [estilosMusica] = await connection.query(estiloMusicaQuery);

    return estilosMusica;
}

module.exports = {
    inserir,
    pegarTudo
};