const db = require('../models/db.js');

const getEnderecoById = async (enderecoId) => {
    const dadosEnderecoQuery = "SELECT * FROM endereco WHERE id = ?";
    const connection = await db;

    const [dadosEndereco] = await connection.query(dadosEnderecoQuery, enderecoId);

    return dadosEndereco[0];
};

// enderecoData = [cep, uf, cidade, rua, bairro, numero]
const createEndereco = async (enderecoData) => {
    try {
        const inserirEnderecoQuery = `INSERT INTO endereco VALUES ( null, ?, ?, ?, ?, ?, ? );`;
        const connection = await db;

        const [idEnderecoInserido] = await connection.query(inserirEnderecoQuery, enderecoData);

        return idEnderecoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir dados do endereço: ${error.message}`);
    }
};

const updateEnderecoData = async (newEnderecoData) => {
    const atualizarEnderecoQuery = `
        UPDATE endereco
        SET cep = ?, estado = ?, cidade = ?, lodradouro = ?, 
        bairro = ?, numero = ?
        WHERE id = ?;
    `;
    const connection = await db;

    const [atualizarEndereco] = await connection.query(atualizarEnderecoQuery, newEnderecoData);

    return atualizarEndereco[0];
};

module.exports = {
    getEnderecoById,
    updateEnderecoData,
    createEndereco
};