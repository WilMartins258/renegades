const db = require('../models/db.js');

const inserir = async (dadosRecomendacao, conn) => {
    try {
        const recomendacaoQuery = `INSERT INTO recomendacao (idEstabelecimento, nome, descricao, foto) VALUES (?, ?, ?, ?);`;

        const [idRecomendacaoInserido] = await conn.query(recomendacaoQuery, dadosRecomendacao);

        return idRecomendacaoInserido?.insertId;
    } catch (error) {
        throw new Error(error);
    }
};

const atualizar = async (novosDadosRecomendacao, conn) => {
    try {
        const recomendacaoQuery = `
        UPDATE recomendacao
        SET nome = ?, descricao = ?
        WHERE id = ?;`;

        await conn.query(recomendacaoQuery, novosDadosRecomendacao);
    } catch (error) {
        throw new Error('Erro ao atualizar recomendação: ', error);
    }
};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const recomendacoesQuery = `
        SELECT r.id, r.nome, r.descricao, r.foto as 'formatoFoto'
            FROM recomendacao r
            WHERE r.idEstabelecimento = ?;`;
        const connection = await db;

        const [recomendacoes] = await connection.query(recomendacoesQuery, idEstabelecimento);

        return recomendacoes;
    } catch (error) {
        throw new Error(`Erro ao buscar recomendações do estabelecimento: ${error.message}`);
    }
};

const excluir = async (idRecomendacao, conn) => {
    try {
        const recomendacaoQuery = `DELETE FROM recomendacao WHERE id = ?;`;

        await conn.query(recomendacaoQuery, idRecomendacao);
    } catch (error) {
        throw new Error(error);
    }
}

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};