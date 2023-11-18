const db = require('../models/db.js');

/**
 * Query que busca os dados so usuário com base no email enviado
 */
const fazerLogin = async (emailDoUsuario) => {
    const loginQuery = `SELECT id, nome, idEstabelecimento, email, senha, fotoperfil, tipoUsuario, status
                        FROM usuario 
                        WHERE email = ?;`;
    const connection = await db;

    const [dadosDoLogin] = await connection.query(loginQuery, emailDoUsuario);

    return dadosDoLogin[0];
}

module.exports = {
    fazerLogin
}