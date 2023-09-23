const db = require('../models/db.js');

const pegarTudo = async () => {
    const estiloMusicaQuery = "SELECT * FROM estiloMusica;";
    const connection = await db;

    const [estilosMusica] = await connection.query(estiloMusicaQuery);

    return estilosMusica;
}

module.exports = {
    pegarTudo
};