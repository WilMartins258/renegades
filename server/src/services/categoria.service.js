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

const atualizar = async (novosDadosCategoria) => {
    try {
        const categoriasQuery = `
        UPDATE categoria
            SET nome = ?, ativo = ?
            WHERE id = ?;`;
        const connection = await db;
    
        await connection.query(categoriasQuery, novosDadosCategoria);
    } catch (error) {
        throw new Error(`Erro ao atualizar categoria: ${error.message}`);
    }
};

module.exports = {
    pegarTudo,
    atualizar
};