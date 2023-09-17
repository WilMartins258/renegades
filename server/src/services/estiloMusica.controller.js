const db = require('../db');

const getAllEstilosMusica = async () => {
    const estiloMusicaQuery = "SELECT * FROM estiloMusica;";
    const connection = await db;

    const [estilosMusica] = await connection.query(estiloMusicaQuery);

    return estilosMusica;
}

module.exports = {
    getAllEstilosMusica
};