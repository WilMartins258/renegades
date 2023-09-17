const db = require('../db');

const getEnderecoById = async (enderecoId) => {
    const dadosEnderecoQuery = "SELECT * FROM endereco WHERE id = ?";
    const connection = await db;
    
    const [dadosEndereco] = await connection.query(dadosEnderecoQuery, enderecoId);

    return dadosEndereco[0];
};

const updateEnderecoData = async (newEnderecoData) => {
    const atualizarEnderecoQuery =   `
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
    updateEnderecoData
};