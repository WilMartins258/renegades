const db = require('../models/db.js');

const inserir = async (dadosOpcional) => {};

const atualizar = async () => {};

const pegarPorIdUsuario = async (idUsuario) => {
    try {
        const favoritoQuery = `
                            SELECT f.id, e.id as 'idEstabelecimento', e.nome
                                FROM  estabelecimento e JOIN favorito f
                                on e.id = f.idEstabelecimento
                                    WHERE idUsuario = 1;`;
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

        const [favoritoDeletado] = await connection.query(favoritoQuery, idFavorito);

        return favoritoDeletado;
    } catch (error) {
        throw new Error(`Erro ao excluir favorito do usuário: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdUsuario,
    excluirPorIdFavorito
};