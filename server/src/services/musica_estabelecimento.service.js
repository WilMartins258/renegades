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

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const musicaEstabelecimentoQuery = `
        `;

        const [musicasEstabelecimento] = await conn.query(musicaEstabelecimentoQuery, idEstabelecimento);

        return musicasEstabelecimento;
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