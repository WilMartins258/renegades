const db = require('../models/db.js');

const checarEmail = async (email) => {
  const checkEmailQuery = `SELECT email 
                            FROM usuario 
                            WHERE email = ?;`;
  const connection = await db;

  const [checkEmail] = await connection.query(checkEmailQuery, email);

  return checkEmail[0];
};

const inserirIdEstabelecimento = async (ids) => {
  try {
    const idQuery = `UPDATE usuario set idEstabelecimento = ? WHERE id = ?;`;
    const connection = await db;

    const [insercaoId] = await connection.query(idQuery, ids);

    return insercaoId;
  } catch (error) {
    throw new Error(`Erro ao inserir id do estabelecimento no usuário: ${error.message}`);
  }
};

const inserir = async (dadosUsuario) => {
  try {
    const dadosUsuarioQuery = `INSERT INTO usuario (nome, email, senha)
                               VALUES (?, ?, ?);`;
    const connection = await db;

    const [insercaoUsuario] = await connection.query(dadosUsuarioQuery, dadosUsuario);

    return insercaoUsuario;
  } catch (error) {
    throw new Error(`Erro ao inserir dados do usuário: ${error.message}`);
  }
};

const pegarPorId = async (userId) => {
  try {
    const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = ?";
    const connection = await db;

    const [dadosUsuario] = await connection.query(dadosUsuarioQuery, userId);

    if (!dadosUsuario || dadosUsuario.length === 0) {
      throw new Error('Usuário não encontrado');
    }

    return dadosUsuario[0];
  } catch (error) {
    throw new Error(`Erro ao buscar dados do usuário por ID: ${error.message}`);
  }
};

const atualizar = async (newUserData) => {
  try {
    const atualizarUsuarioQuery = `
      UPDATE usuario
        SET nome = ?, celular = ?, email = ?, 
        senha = ?, fotoPerfil = ?, dataNascimento = ?,
        cep = ?, estado = ?, cidade = ?, bairro = ?,
        logradouro = ?, numeroResidencia = ?
        WHERE id = ?;`;
    const connection = await db;

    const [atualizarUsuario] = await connection.query(atualizarUsuarioQuery, newUserData);

    if (atualizarUsuario.affectedRows === 0) {
      throw new Error('Nenhum usuário foi atualizado');
    }

    return atualizarUsuario;
  } catch (error) {
    throw new Error(`Erro ao atualizar dados do usuário: ${error.message}`);
  }
};

const excluir = async () => {
  try {
    
  } catch (error) {
    throw new Error(`Erro ao excluir dados do usuário: ${error.message}`);
  }
};

module.exports = {
  checarEmail,
  inserirIdEstabelecimento,
  inserir,
  atualizar,
  pegarPorId,
  excluir
};
