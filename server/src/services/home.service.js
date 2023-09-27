const db = require('../models/db.js');

const pegarTudo = async () => {
    const connection = await db;
    const estabelecimentoQuery = "SELECT * FROM estabelecimento";
    const [estabelecimentos] = await connection.query(estabelecimentoQuery);

    return estabelecimentos;
}

module.exports = {
    pegarTudo
};