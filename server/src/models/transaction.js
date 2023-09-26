const mysql = require("mysql2/promise");

async function startTransaction() {
    try {
        const connection = await mysql.createConnection("mysql://root:123456@localhost:3306/renegades_stage");
        await connection.beginTransaction();
        console.log("Iniciou a transação no MySQL!");
        return connection;
    } catch (error) {
        console.error("Erro ao iniciar a transação no MySQL:", error);
        throw new Error("Erro ao iniciar a transação no banco de dados");
    }
}

module.exports = startTransaction();
