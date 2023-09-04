const db = require('../db');

const insertUserData = async () => {
};

const getUserDataById = async (userId) => {
    const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = ?";
    const connection = await db;

    const [dadosUsuario] = await connection.query(dadosUsuarioQuery, userId);

    console.log('dadosUsuario:: \n', dadosUsuario);

    return dadosUsuario;
};

const updateUserData = async () => {
};

const deleteUserData = async () => {
};

module.exports = {
    getUserDataById
};