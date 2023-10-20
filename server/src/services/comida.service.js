const db = require('../models/db.js');

const pegarTudo = async () => {
    try {
        const comidasQuery = `SELECT * FROM comida  order by nome;`;
        const connection = await db;
    
        const [comidas] = await connection.query(comidasQuery);
    
        return comidas;
    } catch (error) {
        throw new Error(`Erro ao buscar comidas: ${error.message}`);
    }
}

module.exports = {
    pegarTudo
};