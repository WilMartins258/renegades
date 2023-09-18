const db = require('../models/db.js');

const createEstabelecimento = async (dadosEstabelecimento) => {
    try {
      const estabelecimentoQuery = ``;
      const connection = await db;
  
      const [insercaoEstabelecimento] = await connection.query(estabelecimentoQuery, dadosEstabelecimento);
  
      return insercaoEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao inserir dados do estabelecimento: ${error.message}`);
    }
};

const updateEstabelecimento = async (dadosEstabelecimento) => {
    try {
      const estabelecimentoQuery = ``;
      const connection = await db;
  
      const [atualizacaoEstabelecimento] = await connection.query(estabelecimentoQuery, dadosEstabelecimento);
  
      return atualizacaoEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao atualizar dados do estabelecimento: ${error.message}`);
    }
};

const getEstabelecimentoById = async (idEstabelecimento) => {
    try {
      const estabelecimentoQuery = ``;
      const connection = await db;
  
      const [dadosEstabelecimento] = await connection.query(estabelecimentoQuery, idEstabelecimento);
  
      return dadosEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao ler dados do estabelecimento: ${error.message}`);
    }
};

module.exports = {
    createEstabelecimento,
    updateEstabelecimento,
    getEstabelecimentoById
};