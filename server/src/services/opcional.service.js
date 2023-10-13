const db = require('../models/db.js');

const pegarTudo = async () => {
    const opcionaisQuery = `SELECT * FROM opcional;`;
    const connection = await db;

    const [opcionais] = await connection.query(opcionaisQuery);

    return opcionais;
}

module.exports = {
    pegarTudo
};