const db = require('../models/db.js');

/**
 * Query que busca os dados so usuário com base no email enviado
 */
const fazerLogin = async (userEmail) => {
    const loginQuery = `SELECT id, nome, email, senha, fotoperfil, tipoUsuario 
                        FROM usuario 
                        WHERE email = ?;`;
    const connection = await db;

    const [loginData] = await connection.query(loginQuery, userEmail);

    return loginData[0];
}

module.exports = {
    fazerLogin
}