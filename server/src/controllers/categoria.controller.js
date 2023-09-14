const db = require('../db');

const getAllCategorias = async () => {
    const getAllCategoriasQuery = `SELECT * FROM categoria;`;
    const connection = await db;

    const [categorias] = await connection.query(getAllCategoriasQuery);

    return categorias;
}


module.exports = {
    getAllCategorias
};