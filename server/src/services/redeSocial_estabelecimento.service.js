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

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const redesSociaisEstabelecimentoQuery = `
        `;

        const [redesSociaisEstabelecimento] = await conn.query(redesSociaisEstabelecimentoQuery, idEstabelecimento);

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