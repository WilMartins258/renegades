const encontrarExtensaoImagem = (str) => {
    let resultado = '';
    let encontrouPonto = false;

    for (let i = str.length - 1; i >= 0; i--) {
        if (str[i] === '/') {
            encontrouPonto = true;
            break;
        }
        resultado = str[i] + resultado;
    }

    if (encontrouPonto) {
        return resultado;
    } else {
        throw new Error(`'/' não encontrado na string.`);
    }
};

module.exports = {
    encontrarExtensaoImagem
} 