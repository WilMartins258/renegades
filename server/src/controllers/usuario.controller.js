const db = require('../db');

const insertUserData = async (dadosUsuario) => {
  try {
    const dadosUsuarioQuery = `INSERT INTO usuario (nome, email, senha)
                               VALUES (?, ?, ?);`;
    const connection = await db;

    const [insercaoUsuario] = await connection.query(dadosUsuarioQuery, dadosUsuario);

    return insercaoUsuario.insertId;
  } catch (error) {
    throw new Error(`Erro ao inserir dados do usuário: ${error.message}`);
  }
};

const getUserById = async (userId) => {
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

const updateUserData = async (newUserData) => {
  try {
    const atualizarUsuarioQuery = `
      UPDATE usuario
      SET nome = ?, codigoArea = ?, celular = ?,
      email = ?, senha = ?, fotoPerfil = ?, dataNascimento = ?
      WHERE id = ?;
    `;
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

const deleteUserData = async () => {
  try {
    
  } catch (error) {
    throw new Error(`Erro ao excluir dados do usuário: ${error.message}`);
  }
};

module.exports = {
  getUserById,
  updateUserData,
  insertUserData,
  deleteUserData
};
