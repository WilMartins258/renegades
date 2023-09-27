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

const pegarPorId = async () => {};

const excluir = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorId,
    excluir
};