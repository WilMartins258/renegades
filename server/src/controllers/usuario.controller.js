const db = require('../db');

const insertUserData = async () => {
};

const getUserById = async (userId) => {
    const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = ?";
    const connection = await db;

    const [dadosUsuario] = await connection.query(dadosUsuarioQuery, userId);

    return dadosUsuario[0];
};

const updateUserData = async (newUserData) => {   
    const atualizarUsuarioQuery =   `UPDATE usuario
                                    SET nome = ?, sobrenome = ?, codigoArea = ?, celular = ?, 
                                    email = ?, senha = ?, fotoPerfil = ?, dataNascimento = ?
                                    WHERE id = ?;`;
    const connection = await db;
    
    const [atualizarUsuario] = await connection.query(atualizarUsuarioQuery, newUserData);
    
    return atualizarUsuario[0];
};

const deleteUserData = async () => {
};

module.exports = {
    getUserById,
    updateUserData
};