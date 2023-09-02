const db = require('../db');

const insertUserData = async () => {
};

const getUserData = async () => {
    const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = 1";
    const connection = await db;

    const [dadosUsuario] = await connection.query(dadosUsuarioQuery);

    return dadosUsuario;
};

const updateUserData = async () => {
};

const deleteUserData = async () => {
};

module.exports = {
    getUserData
};