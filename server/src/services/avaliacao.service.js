const db = require('../models/db.js');

const inserir = async (dadosAvaliacao) => {
    try {
        const avaliacaoQuery = `
        INSERT INTO avaliacao (idUsuario, idEstabelecimento, descricao, data, nota) values (?, ?, ?, ?, ?);`;
        const connection = await db;

        const [insercaoAvaliacao] = await connection.query(avaliacaoQuery, dadosAvaliacao);

        return insercaoAvaliacao?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir avaliação do usuário: ${error.message}`);
    }
};

const atualizar = async (novosDadosAvaliacao) => {
    try {
        const avaliacaoQuery = `UPDATE avaliacao
                                    SET nota = ?, descricao = ?, data = ?
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
        SELECT a.id as 'idAvaliacao', e.id as 'idEstabelecimento', e.nome, a.descricao, a.nota, a.data
            FROM  estabelecimento e JOIN avaliacao a
            on e.id = a.idEstabelecimento
                WHERE idUsuario = ?;`;
        const connection = await db;

        const [avaliacoesUsuario] = await connection.query(avaliacaoQuery, idUsuario);

        return avaliacoesUsuario;
    } catch (error) {
        throw new Error(`Erro ao buscar avaliações do usuário: ${error.message}`);
    }
};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const avaliacaoQuery = `
        SELECT u.nome, a.descricao, a.nota as 'stars', a.data
            FROM  estabelecimento e 
            JOIN avaliacao a on e.id = a.idEstabelecimento
            JOIN usuario u on u.id = a.idUsuario
                WHERE e.id = ?
                order by a.data desc;`;
        const connection = await db;

        const [avaliacoesEstabelecimento] = await connection.query(avaliacaoQuery, idEstabelecimento);

        return avaliacoesEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar avaliações do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdUsuario,
    pegarPorIdEstabelecimento
};