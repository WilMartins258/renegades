const db = require('../models/db.js');

const inserir = async (dadosOpcional) => {};

const atualizar = async () => {};

const pegarPorIdUsuario = async (idUsuario) => {
    try {
        const avaliacaoQuery = `SELECT idEstabelecimento from avaliacao WHERE idUsuario = ?;`;
        const connection = await db;

        const [avaliacao] = await connection.query(avaliacaoQuery, idUsuario);

        return avaliacao;
    } catch (error) {
        console.error('ERROR:: ', error);
    }
};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdUsuario,
    excluir
};