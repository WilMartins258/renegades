const db = require('../models/db.js');

const inserir = async (dadosOpcional) => {};

const atualizar = async () => {};

const pegarPorId = async (idUsuario) => {
    try {
        const favoritoQuery = `SELECT idEstabelecimento from favorito WHERE idUsuario = ?;`;
        const connection = await db;

        const [favoritos] = await connection.query(favoritoQuery, idUsuario);

        return favoritos;
    } catch (error) {
        console.error('ERROR:: ', error);
    }
};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorId,
    excluir
};