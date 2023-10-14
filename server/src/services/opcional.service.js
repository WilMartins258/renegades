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
    inserir,
    pegarTudo
};