const db = require('../models/db.js');

const inserir = async (dadosContato, conn) => {
    try {
        const inserirContatoEstabelecimentoQuery = `INSERT into contato_estabelecimento (idEstabelecimento, idContato, contato, isWhatsapp) VALUES (?, ?, ?, ?);`;

        await conn.query(inserirContatoEstabelecimentoQuery, dadosContato);
    } catch (error) {
        throw new Error(`Erro ao inserir contato do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento) => {
    try {
        const contatoEstabelecimentoQuery = `SELECT * FROM contato_estabelecimento WHERE idEstabelecimento = ?;`;
        const connection = await db;

        const [contatoEstabelecimento] = await connection.query(contatoEstabelecimentoQuery, idEstabelecimento);

        return contatoEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar contatos do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};