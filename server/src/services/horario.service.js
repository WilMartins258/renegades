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

const pegarPorIdEstabelecimento = async () => {};

module.exports = {
    inserir,
    atualizar,
    pegarPorIdEstabelecimento
};