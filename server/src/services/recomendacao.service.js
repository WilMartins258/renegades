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

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const recomendacoesQuery = `
        SELECT r.id, r.nome, r.descricao, r.foto 
            FROM recomendacao r
            WHERE r.idEstabelecimento = ?;`;

        const [recomendacoes] = await conn.query(recomendacoesQuery, idEstabelecimento);

        return recomendacoes;
    } catch (error) {
        throw new Error(`Erro ao buscar recomendações do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};