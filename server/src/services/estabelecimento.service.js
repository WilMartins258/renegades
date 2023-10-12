const db = require('../models/db.js');

const inserir = async (dadosEstabelecimento, conn) => {
    try {
      const estabelecimentoQuery = `
        INSERT INTO estabelecimento (nome, cnpj, fotoPrincipal, descricao, 
        cep, estado, cidade, logradouro, bairro, numeroEstabelecimento, dataCadastro, dataUltimoAcesso) 
        VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );`;
  
      const [insercaoEstabelecimento] = await conn.query(estabelecimentoQuery, dadosEstabelecimento);
  
      return insercaoEstabelecimento?.insertId;
    } catch (error) {
      throw new Error(`Erro ao inserir dados do estabelecimento: ${error.message}`);
    }
};

const atualizar = async (dadosEstabelecimento, conn) => {
    try {
      const estabelecimentoQuery = ``;
  
      const [atualizacaoEstabelecimento] = await conn.query(estabelecimentoQuery, dadosEstabelecimento);
  
      return atualizacaoEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao atualizar dados do estabelecimento: ${error.message}`);
    }
};

const pegarPorId = async (idEstabelecimento, conn) => {
    try {
      const estabelecimentoQuery = `
      SELECT nome, fotoPrincipal as 'formatoFoto', descricao, nota, numeroEstabelecimento, logradouro, bairro, cidade, estado, cep
        FROM estabelecimento
        WHERE id = ?;`;
  
      const [dadosEstabelecimento] = await conn.query(estabelecimentoQuery, idEstabelecimento);
  
      return dadosEstabelecimento;
    } catch (error) {
      throw new Error(`Erro ao ler dados do estabelecimento: ${error.message}`);
    }
};

const carousel = async () => {
  try {
    const carouselQuery = `SELECT id, fotoPrincipal FROM estabelecimento order by nota desc limit 10;`;
    const connection = await db;

    const [estabelecimentosCarousel] = await connection.query(carouselQuery);

    return estabelecimentosCarousel;
  } catch (error) {
    throw new Error(`Erro ao buscar estabelecimento para o carousel: ${error.message}`);
  }
};

module.exports = {
  inserir,
  atualizar,
  pegarPorId,
  carousel
};