const inserir = async (dadosContato, conn) => {
    try {
        const inserirContatoEstabelecimentoQuery = ``;

        const [idContatoEstabelecimento] = await conn.query(inserirContatoEstabelecimentoQuery, dadosContato);

        return idContatoEstabelecimento?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir contato do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const contatoEstabelecimentoQuery = ``;

        const [contatoEstabelecimento] = await conn.query(contatoEstabelecimentoQuery, idEstabelecimento);

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