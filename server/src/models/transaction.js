const mysql = require("mysql2/promise");

async function startTransaction() {
    try {
        const pool = mysql.createPool({
            host: "localhost",
            user: "root",
            password: "123456",
            database: "renegades_stage" //,
			// connectionLimit: 10 // Limite de conexões no pool
        });

        const connection = await pool.getConnection();
        await connection.beginTransaction();
        console.log("Iniciou a transação no MySQL!");
        return connection;
    } catch (error) {
        console.error("Erro ao iniciar a transação no MySQL:", error);
        throw new Error("Erro ao iniciar a transação no banco de dados");
    }
}

module.exports = startTransaction();