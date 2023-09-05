const extrairCodigoAreaENumero = (numeroCompleto) => {
    // Remova quaisquer caracteres não numéricos do número completo.
    const numeroLimpo = numeroCompleto.replace(/\D/g, '');
  
    // Verifique se o número tem pelo menos 10 dígitos.
    if (numeroLimpo.length >= 10) {
      // Os primeiros dígitos são o código de área, e os últimos 9 são o número.
      const codigoArea = numeroLimpo.slice(0, -9);
      const numero = numeroLimpo.slice(-9);
      return { codigoArea, numero };
    } else {
      // Se o número não tiver pelo menos 10 dígitos, retorne um objeto com valores nulos.
      return { codigoArea: null, numero: null };
    }
};

module.exports = {
    extrairCodigoAreaENumero
}