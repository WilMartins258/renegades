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
        const contatoEstabelecimentoQuery = `
        SELECT ce.id, ce.idEstabelecimento, ce.idContato, c.nome, ce.contato, ce.isWhatsapp FROM contato_estabelecimento ce
	        JOIN contato c ON c.id = ce.idContato
            WHERE idEstabelecimento = ?;`;
        const connection = await db;

        const [contatoEstabelecimento] = await connection.query(contatoEstabelecimentoQuery, idEstabelecimento);

        return contatoEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar contatos do estabelecimento: ${error.message}`);
    }
};

const excluirTudoPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const contatoEstabelecimentoQuery = `
        DELETE FROM contato_estabelecimento
            WHERE idEstabelecimento = ?;`;

        await conn.query(contatoEstabelecimentoQuery, idEstabelecimento);
    } catch (error) {
        throw new Error(`Erro ao excluir contatos do estabelecimento: ${error.message}`);
    }
}

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluirTudoPorIdEstabelecimento
};