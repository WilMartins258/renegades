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

const atualizar = async () => {};

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

const excluir = async (idEstabelecimento) => {

}

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};