const db = require('../db');

const insertUserData = async () => {
};

const getUserById = async (userId) => {
    const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = ?";
    const connection = await db;

    const [dadosUsuario] = await connection.query(dadosUsuarioQuery, userId);

    return dadosUsuario[0];
};

const updateUserData = async () => {
};

const deleteUserData = async () => {
};

module.exports = {
    getUserById
};