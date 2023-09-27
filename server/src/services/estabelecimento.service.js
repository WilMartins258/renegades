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
      const estabelecimentoQuery = '';
  
      const [dadosEstabelecimento] = await conn.query(estabelecimentoQuery, idEstabelecimento);
  
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