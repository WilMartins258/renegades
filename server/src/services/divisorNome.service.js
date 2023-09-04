const dividirNome = (nomeCompleto) => {
    const partesDoNome = nomeCompleto.split(' ');
    const nome = partesDoNome[0];
    const sobrenome = partesDoNome.slice(1).join(' ');
    return { nome, sobrenome };
};

module.exports = {
    dividirNome
}