const db = require('../db');

const insertUserData = async () => {
};

const getUserData = async (userId) => {
    const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = ?";
    const connection = await db;

    const [dadosUsuario] = await connection.query(dadosUsuarioQuery, userId);

    return dadosUsuario;
};

const updateUserData = async () => {
};

const deleteUserData = async () => {
};

module.exports = {
    getUserData
};