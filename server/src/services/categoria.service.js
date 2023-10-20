const db = require('../models/db.js');

const inserir = async (dadosCategoria) => {
    try {
        const categoriasQuery = `INSERT into categoria (nome, ativo) VALUES (?, ?);`;
        const connection = await db;
    
        const [insercaoCategoria] = await connection.query(categoriasQuery, dadosCategoria);

        return insercaoCategoria?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir categoria: ${error.message}`);
    }
};

const pegarTudo = async () => {
    try {
        const categoriasQuery = `SELECT * FROM categoria order by nome;`;
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
    inserir,
    pegarTudo,
    atualizar
};