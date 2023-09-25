const retornaCodigoBase64 = async (imagem) => {
  console.log('retornaCodigoBase64 retornaCodigoBase64 retornaCodigoBase64');
  return new Promise((resolve, reject) => {
    const leitorDeImagem = new FileReader();

    leitorDeImagem.onloadend = () => {
      resolve(String(leitorDeImagem.result));
    };

    leitorDeImagem.onerror = () => {
      reject(new Error('Erro ao ler a imagem.'));
    };

    leitorDeImagem.readAsDataURL(imagem);
  });
};

const retornaImagem = async (codigoBase64) => {};

export {
    retornaCodigoBase64,
    retornaImagem
};
  