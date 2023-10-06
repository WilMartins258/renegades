const db = require('../models/db.js');

const pegarTudo = async () => {
    try {
        const categoriasQuery = `SELECT * FROM categoria;`;
        const connection = await db;
    
        const [categorias] = await connection.query(categoriasQuery);
    
        return categorias;
    } catch (error) {
        throw new Error(`Erro ao buscar categorias: ${error.message}`);
    }
}

const atualizar = async () => {};

module.exports = {
    pegarTudo,
    atualizar
};