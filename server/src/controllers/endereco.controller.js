const db = require('../db');

const getEnderecoById = async (enderecoId) => {
    const dadosEnderecoQuery = "SELECT * FROM endereco WHERE id = ?";
    const connection = await db;
    
    const [dadosEndereco] = await connection.query(dadosEnderecoQuery, enderecoId);

    return dadosEndereco[0];
};

module.exports = {
    getEnderecoById
};