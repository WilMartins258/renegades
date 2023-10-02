const db = require('../models/db.js');

const inserir = async (dadosOpcional) => {};

const atualizar = async (novosDadosAvaliacao) => {
    try {
        const avaliacaoQuery = `UPDATE avaliacao
                                    SET nota = ?, descricao = ?
                                    WHERE id = ?;`;
        const connection = await db;

        await connection.query(avaliacaoQuery, novosDadosAvaliacao);
    } catch (error) {
        throw new Error(`Erro ao atualizar avaliação do usuário: ${error.message}`);
    }
};

const pegarPorIdUsuario = async (idUsuario) => {
    try {
        const avaliacaoQuery = `
        SELECT a.id as 'idAvaliacao', e.id as 'idEstabelecimento', e.nome, a.descricao, a.nota
            FROM  estabelecimento e JOIN avaliacao a
            on e.id = a.idEstabelecimento
                WHERE idUsuario = ?;`;
        const connection = await db;

        const [avaliacoes] = await connection.query(avaliacaoQuery, idUsuario);

        return avaliacoes;
    } catch (error) {
        throw new Error(`Erro ao buscar avaliações do usuário: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdUsuario
};