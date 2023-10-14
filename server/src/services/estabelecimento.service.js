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
    const carouselQuery = `SELECT id, nome as 'title', fotoPrincipal as 'formatoFoto' FROM estabelecimento order by nota desc limit 10;`;
    const connection = await db;

    const [estabelecimentosCarousel] = await connection.query(carouselQuery);

    return estabelecimentosCarousel;
  } catch (error) {
    throw new Error(`Erro ao buscar estabelecimento para o carousel: ${error.message}`);
  }
};

const filtros = async () => {
  try {
    const filtrosQuery = `
    SELECT e.id, 
      e.nome, 
      e.fotoPrincipal as 'formatoFoto', 
      e.cep, 
      (SELECT GROUP_CONCAT(idCategoria) FROM categoria_estabelecimento cat WHERE cat.idEstabelecimento = e.id) as idCategorias,
      (SELECT GROUP_CONCAT(idOpcional) FROM opcional_estabelecimento op WHERE op.idEstabelecimento = e.id) as idOpcionais,
      (SELECT GROUP_CONCAT(idComida) FROM comida_estabelecimento com WHERE com.idEstabelecimento = e.id) as idComidas
    FROM estabelecimento e;`;
    const connection = await db;

    const [estabelecimentosFiltros] = await connection.query(filtrosQuery);

    return estabelecimentosFiltros;
  } catch (error) {
    throw new Error(`Erro ao buscar estabelecimento para filtros: ${error.message}`);
  }
};

const pegarParaValidacao = async () => {
  try {
    const estabelecimentosQuery = `SELECT id, nome, status FROM estabelecimento;`;
    const connection = await db;

    const [estabelecimentosValidacao] = await connection.query(estabelecimentosQuery);

    return estabelecimentosValidacao;
    
  } catch (error) {
    throw new Error(`Erro ao buscar estabelecimento para validação: ${error.message}`);
  }
};

module.exports = {
  inserir,
  atualizar,
  pegarPorId,
  carousel,
  filtros,
  pegarParaValidacao
};