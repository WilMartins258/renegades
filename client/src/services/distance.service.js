// Calculo de distância usando a Fórmula de Haversine
const calcularDistancia = (lat1, lon1, lat2, lon2) => {
    const raioTerra = 6371; // Raio da Terra em quilômetros
    const dLat = (lat2 - lat1) * (Math.PI / 180);
    const dLon = (lon2 - lon1) * (Math.PI / 180);
    const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const distancia = raioTerra * c; // Distância em quilômetros
    return distancia;
};

// Aqui vamos implementar a função da API para descobrir latitude e longitude baseado no CEP do estabelecimento
const obterCoordenadasDoCEP = (cep) => {
    // Faça uma requisição para o serviço de geocodificação usando o CEP
    // Retorne as coordenadas (latitude e longitude) obtidas da resposta da API
};

module.exports = {
    calcularDistancia,
    obterCoordenadasDoCEP
};