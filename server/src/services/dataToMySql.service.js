const dataToMySqlFormat = (dataNoFormatoBR) => {
    const partes = dataNoFormatoBR.split('/');
    if (partes.length === 3) {
      const dia = partes[0];
      const mes = partes[1];
      const ano = partes[2];
      return `${ano}-${mes}-${dia}`;
    } else {
      return null; // Retornar null se a data estiver em um formato inválido.
    }
};

module.exports = {
    dataToMySqlFormat
} 
