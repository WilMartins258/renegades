const inserir = async (dadosHorario, conn) => {
    try {
        const horarioQuery = `INSERT INTO horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) VALUES (?, ?, ?, ?);`;

        const [idHorarioInserido] = await conn.query(horarioQuery, dadosHorario);

        return idHorarioInserido?.insertId;
    } catch (error) {
        throw new Error(error);
    }
};

const atualizar = async () => {};

const pegarPorIdEstabelecimento = async (idEstabelecimento, conn) => {
    try {
        const horariosEstabelecimentoQuery = `
        SELECT ds.id, ds.diaSemana, ds.numeroDia, h.horarioInicio, h.horarioFim
            FROM horario h
            JOIN diaSemana ds ON h.idDiaSemana = ds.id
                WHERE h.idEstabelecimento = ?
                ORDER BY ds.id;`;

        const [horariosEstabelecimento] = await conn.query(horariosEstabelecimentoQuery, idEstabelecimento);

        return horariosEstabelecimento;
    } catch (error) {
        throw new Error(`Erro ao buscar horários do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};