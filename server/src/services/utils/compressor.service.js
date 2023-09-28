const zlib = require('zlib');

// Função de compressão
const compressaoDeTexto = async (textoOriginal) => {
  return new Promise((resolve, reject) => {
    zlib.gzip(textoOriginal, (err, buffer) => {
      if (!err) {
        resolve(buffer.toString('base64'));
      } else {
        reject(err);
      }
    });
  });
};

// Função de descompressão
const descompressaoDeTexto = async (textoComprimido) => {
  return new Promise((resolve, reject) => {
    const buffer = Buffer.from(textoComprimido, 'base64');
    zlib.gunzip(buffer, (err, textoDescomprimido) => {
      if (!err) {
        resolve(textoDescomprimido.toString());
      } else {
        reject(err);
      }
    });
  });
};

module.exports = {
    compressaoDeTexto,
    descompressaoDeTexto
};

// Exemplo de uso
// const textoOriginal = 'Este é um exemplo de texto que será comprimido.';

// compressText(textoOriginal)
//   .then((textoComprimido) => {
//     console.log('Texto comprimido:', textoComprimido);
//     return decompressText(textoComprimido);
//   })
//   .then((textoDescomprimido) => {
//     console.log('Texto descomprimido:', textoDescomprimido);
//   })
//   .catch((err) => {
//     console.error('Erro:', err);
//   });
