const dataFormat = (dataString) => {
    // Exemplo de dataString:: "2000-05-01T03:00:00.000Z";

    const data = new Date(dataString);

    const dia = String(data.getDate()).padStart(2, '0');
    const mes = String(data.getMonth() + 1).padStart(2, '0'); // Os meses são base 0, então somamos 1
    const ano = data.getFullYear();

    const dataFormatada = `${dia}/${mes}/${ano}`;
    // console.log(dataFormatada); // Saída: "01/05/2000"

    return dataFormatada;
};

export default dataFormat;