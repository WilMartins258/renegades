const db = require('../models/db.js');

const pegarTudo = async () => {
    const connection = await db;
    const testQuery = "SELECT * FROM testTable";
    const [tests] = await connection.query(testQuery);

    return tests;
}

module.exports = {
    pegarTudo
};