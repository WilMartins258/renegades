const inserir = async (dadosOpcional, conn) => {
    try {
        const inserirOpcionalEstabelecimentoQuery = `INSERT INTO opcional_estabelecimento (idEstabelecimento, idOpcional) VALUES (?, ?);`;

        const [idOpcionalEstabelecimentoInserido] = await conn.query(inserirOpcionalEstabelecimentoQuery, dadosOpcional);

        return idOpcionalEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(`Erro ao inserir opcional do estabelecimento: ${error.message}`);
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