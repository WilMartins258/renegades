const db = require('../models/db.js');

const inserir = async (dadosRedeSocial, conn) => {
    try {
        const inserirRedeSocailEstabelecimentoQuery = `INSERT INTO redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) VALUES ( ?, ?, ? );`;

        const [idRedeSocialEstabelecimentoInserido] = await conn.query(inserirRedeSocailEstabelecimentoQuery, dadosRedeSocial);

        return idRedeSocialEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir rede social do estabelecimento: ${error.message}`);
    }
};

const atualizar = async (novosDadosRedeSocial, conn) => {
    try {
        const redesSociaisEstabelecimentoQuery = `
        UPDATE redeSocial_estabelecimento
            SET redeSocial = ?
                WHERE idEstabelecimento = ? AND idRedeSocial = ?;`;

        await conn.query(redesSociaisEstabelecimentoQuery, novosDadosRedeSocial);
    } catch (error) {
        throw new Error(`Erro ao atualizar rede social do estabelecimento: ${error.message}`);
    }
};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const redesSociaisEstabelecimentoQuery = `
        SELECT rs.id, rs.nome, rse.redeSocial, rse.id as 'idRedeSocialEstabelecimento'
            FROM redeSocial_estabelecimento rse
            JOIN redeSocial rs ON rse.idRedeSocial = rs.id
                WHERE rse.idEstabelecimento = ?;`;
        const connection = await db;

        const [redesSociaisEstabelecimento] = await connection.query(redesSociaisEstabelecimentoQuery, idEstabelecimento);

        return redesSociaisEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar redes sociais do estabelecimento: ${error.message}`);
    }
};

const excluir = async (dadosExclusao, conn) => {
    try {
        const estabelecimentoQuery = `DELETE FROM redeSocial_estabelecimento WHERE idEstabelecimento = ? AND idRedeSocial = ?;`;

        await conn.query(estabelecimentoQuery, dadosExclusao);
    } catch (error) {
        throw new Error(`Erro ao excluirrede social do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};