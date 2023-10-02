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
        console.error('ERROR:: ', error);
    }
};

const excluirPorId = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdUsuario,
    excluirPorId
};