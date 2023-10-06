const inserir = async (dadosComida, conn) => {
    try {
        const inserirComidaEstabelecimentoQuery = ``;

        const [idComidaEstabelecimentoInserido] = await conn.query(inserirComidaEstabelecimentoQuery, dadosComida);

        return idComidaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir comida do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const comidaEstabelecimentoQuery = ``;

        const [comidasEstabelecimento] = await conn.query(comidaEstabelecimentoQuery, idEstabelecimento);

        return comidasEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar comidas do estabelecimento: ${error.message}`);
    }
};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};