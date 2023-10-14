const db = require('../models/db.js');

const pegarTudo = async () => {
    try {
        const opcionaisQuery = `SELECT * FROM opcional;`;
        const connection = await db;

        const [opcionais] = await connection.query(opcionaisQuery);

        return opcionais;
    } catch (error) {
        throw new Error(`Erro ao buscar opcionais: ${error.message}`);
    }
}

module.exports = {
    pegarTudo
};