const db = require('../models/db.js');

const inserir = async (dadosEstabelecimento) => {
    try {
      const estabelecimentoQuery = `
        INSERT INTO estabelecimento (nome, cnpj, fotoPrincipal, descricao, 
        cep, estado, cidade, logradouro, bairro, numeroEstabelecimento, dataCadastro, dataUltimoAcesso) 
        VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );`;
      const connection = await db;
  
      const [insercaoEstabelecimento] = await connection.query(estabelecimentoQuery, dadosEstabelecimento);
  
      return insercaoEstabelecimento?.insertId;
    } catch (error) {
      throw new Error(`Erro ao inserir dados do estabelecimento: ${error.message}`);
    }
};

const atualizar = async (dadosEstabelecimento) => {
    try {
      const estabelecimentoQuery = ``;
      const connection = await db;
  
      const [atualizacaoEstabelecimento] = await connection.query(estabelecimentoQuery, dadosEstabelecimento);
  
      return atualizacaoEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao atualizar dados do estabelecimento: ${error.message}`);
    }
};

const pegarPorId = async (idEstabelecimento) => {
    try {
      const estabelecimentoQuery = '';
      const connection = await db;
  
      const [dadosEstabelecimento] = await connection.query(estabelecimentoQuery, idEstabelecimento);
  
      return dadosEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao ler dados do estabelecimento: ${error.message}`);
    }
};

module.exports = {
  inserir,
  atualizar,
  pegarPorId
};