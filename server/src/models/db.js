/**
 * Esse arquivo tem o único intuito de estabelecer uma conexão com o banco de dados e disponibilizá-la para todo o projeto
 * @returns connection -> Retorna uma instância de conexão com o banco de dados
 */
async function connect() {
    try {
        if (global.connection && global.connection.state !== 'disconnected') {
            return global.connection;
        }

        const mysql = require("mysql2/promise");
        const connection = await mysql.createConnection("mysql://root:1234@localhost:3306/renegades_stage");
        console.log("Conectou com MySQL!");
        global.connection = connection;
        return connection;
    } catch (error) {
        console.error("Erro ao conectar com MySQL:", error);
        throw new Error("Erro ao conectar com o banco de dados");
    }
}

module.exports = connect();
