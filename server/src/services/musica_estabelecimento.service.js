const inserir = async (dadoDeMusica, conn) => {
    try {
        const inserirMusicaEstabelecimentoQuery = `INSERT INTO musica_estabelecimento (idEstabelecimento, idEstiloMusica) VALUES (?, ?);`;

        const [idMusicaEstabelecimentoInserido] = await conn.query(inserirMusicaEstabelecimentoQuery, dadoDeMusica);

        return idMusicaEstabelecimentoInserido?.insertId;
    } catch (error) {
        throw new Error(error);
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