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

const atualizar = async () => {};

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

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};