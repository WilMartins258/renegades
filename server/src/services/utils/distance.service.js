const axios = require('axios');
const variaveisGlobais = require('./../../../variaveis.js');

const calcularDistancia = async (lat1, lon1, lat2, lon2) => {
    const apiUrl = 'http://localhost:3001/distancia';
    const response = await axios.get(apiUrl);
    console.log('response:: ', response);
    return response;
};

const obterCoordenadasViaGoogleApi = async (numeroResidencial, cep) => {
    console.log('obterCoordenadasViaGoogleApi');
    const apiKey = variaveisGlobais.googleApiKey;
    const apiUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=${numeroResidencial},${cep}&key=${apiKey}`;
    
    try {
        const response = await axios.get(apiUrl);
        console.log('response.data:: ', response.data);
        return response.data;
    } catch (error) {
        throw new Error('Erro ao fazer a requisição para a API do Google Maps Geocoding: ', error);
    }
};

const obterDistanciaDoEstabelecimento = async (lat1, lon1, lat2, lon2) => {
    try {
        console.log('obterDistanciaDoEstabelecimento');
        const apiKey = variaveisGlobais.googleApiKey;
        const apiUrl = `https://maps.googleapis.com/maps/api/directions/json?origin=${lat1},${lon1}&destination=${lat2},${lon2}&mode=driving&key=${apiKey}`

        const response = await axios.get(apiUrl);
        console.log('response.data:: ', response.data);
        return response.data;
    } catch (error) {
        throw new Error('Erro ao fazer a requisição para a API do Google Maps Directions: ', error);
    }
};

module.exports = {
    obterCoordenadasViaGoogleApi,
    obterDistanciaDoEstabelecimento
} 
