const db = require('../models/db.js');

const pegarTudo = async () => {
    const categoriasQuery = `SELECT * FROM categoria;`;
    const connection = await db;

    const [categorias] = await connection.query(categoriasQuery);

    return categorias;
}

const atualizar = async () => {};

module.exports = {
    pegarTudo,
    atualizar
};