const inserir = async (dadosCategoria, conn) => {
    try {
        const inserirCategoriaEstabelecimentoQuery = `INSERT INTO categoria_estabelecimento (idEstabelecimento, idCategoria) VALUES (?, ?);`;

        const [idCategoriaEstabelecimentoInserido] = await conn.query(inserirCategoriaEstabelecimentoQuery, dadosCategoria);

        return idCategoriaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const categoriaEstabelecimentoQuery = '';

        const [idCategoriaEstabelecimento] = await conn.query(categoriaEstabelecimentoQuery, idEstabelecimento);

        return idCategoriaEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
    }
};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento,
    excluir
};