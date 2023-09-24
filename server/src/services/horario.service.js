const db = require('../models/db.js');

const inserir = async (dadosHorario) => {
    try {
        const horarioQuery = `INSERT INTO horario (idEstabelecimento, idDiaSemana, horarioInicio, horarioFim) VALUES ( ?, ?, ?, ?);`;
        const connection = await db;

        const [idHorarioInserido] = await connection.query(horarioQuery, dadosHorario);

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