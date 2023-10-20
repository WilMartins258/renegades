const db = require('../models/db.js');

const inserir = async (dadosOpcional) => {
    try {
        const opcionaisQuery = `INSERT into opcional (nome, ativo) VALUES (?, ?);`;
        const connection = await db;

        const [insercaoOpcional] = await connection.query(opcionaisQuery, dadosOpcional);

        return insercaoOpcional?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir opcional: ${error.message}`);
    }
};

const atualizar = async (novosDadosOpcional) => {
    try {
        const opcionaisQuery = `
        UPDATE opcional
            SET nome = ?, ativo = ?
            WHERE id = ?;`;
        const connection = await db;

        await connection.query(opcionaisQuery, novosDadosOpcional);
    } catch (error) {
        throw new Error(`Erro ao atualizar opcional: ${error.message}`);
    }
};

const pegarTudo = async () => {
    try {
        const opcionaisQuery = `SELECT * FROM opcional  order by nome;`;
        const connection = await db;

        const [opcionais] = await connection.query(opcionaisQuery);

        return opcionais;
    } catch (error) {
        throw new Error(`Erro ao buscar opcionais: ${error.message}`);
    }
}

module.exports = {
    inserir,
    atualizar,
    pegarTudo
};