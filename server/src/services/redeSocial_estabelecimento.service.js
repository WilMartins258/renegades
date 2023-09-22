const db = require('../models/db.js');

/*
    idEstabelecimento   INT not null,
	idRedeSocial    INT not null,
	redeSocial          VARCHAR(300) not null
*/
const inserir = async (dadosRedeSocial) => {
    try {
        const inserirRedeSocailEstabelecimentoQuery = `INSERT INTO redeSocial_estabelecimento (idEstabelecimento, idRedeSocial, redeSocial) VALUES ( ?, ?, ? );`;
        const connection = await db;

        const [idRedeSocialEstabelecimentoInserido] = await connection.query(inserirRedeSocailEstabelecimentoQuery, dadosRedeSocial);

        return idRedeSocialEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir rede social do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorId = async () => {};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorId,
    excluir
};