const db = require('../models/db.js');

const getAllOpcionais = async () => {
    const getAllOpcionaisQuery = `SELECT * FROM opcional;`;
    const connection = await db;

    const [opcionais] = await connection.query(getAllOpcionaisQuery);

    return opcionais;
}

module.exports = {
    getAllOpcionais
};