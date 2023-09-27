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

const pegarPorIdEstabelecimento = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};