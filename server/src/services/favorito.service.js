const db = require('../models/db.js');

const inserir = async (dadosFavorito) => {
    try {
        const favoritoInsertQuery = `INSERT into favorito (idUsuario, idEstabelecimento) values (?, ?)`;
        const connection = await db;

        await connection.query(favoritoInsertQuery, dadosFavorito);
    } catch (error) {
        throw new Error(`Erro ao adicionar favorito: ${error.message}`);
    }
};

const pegarPorIdUsuario = async (idUsuario) => {
    try {
        const favoritoQuery = `
                            SELECT f.id, e.id as 'idEstabelecimento', e.nome
                                FROM  estabelecimento e JOIN favorito f
                                on e.id = f.idEstabelecimento
                                    WHERE idUsuario = ?;`;
        const connection = await db;

        const [favoritos] = await connection.query(favoritoQuery, idUsuario);

        return favoritos;
    } catch (error) {
        throw new Error(`Erro ao buscar favoritos do usuário: ${error.message}`);
    }
};

const excluirPorIdFavorito = async (idFavorito) => {
    try {
        const favoritoQuery = 'DELETE FROM favorito WHERE id = ?;';
        const connection = await db;

        await connection.query(favoritoQuery, idFavorito);
    } catch (error) {
        throw new Error(`Erro ao excluir favorito do usuário: ${error.message}`);
    }
};

const excluirPorDadosFavorito = async (dadosFavorito) => {
    try {
        const favoritoQuery = 'DELETE FROM favorito WHERE idUsuario = ? AND idEstabelecimento = ?;';
        const connection = await db;

        await connection.query(favoritoQuery, dadosFavorito);
    } catch (error) {
        throw new Error(`Erro ao excluir favorito do usuário: ${error.message}`);
    }
};

module.exports = {
    inserir,
    pegarPorIdUsuario,
    excluirPorIdFavorito,
    excluirPorDadosFavorito
};