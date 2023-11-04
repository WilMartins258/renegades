const axios = require('axios');
const variaveisGlobais = require('../../../variaveis.js');
const db = require('./../../models/db.js');

const procurarEstabelecimentosSemCoordenadas = async () => {
    try {
        const query = `SELECT id FROM estabelecimento WHERE latitude is null AND cep is not null;`; 
        const connection = await db;

        const [estabelecimentosSemCoordenadas] = await connection.query(query);

        return estabelecimentosSemCoordenadas;
    } catch (error) {
        throw new Error('Erro ao buscar estabelecimentos sem localização: ', error);
    }
};

const salvarCoordenadasDoEstabelecimento = async (dadosCoordenadas) => {
    try {
        const query = `
        UPDATE estabelecimento 
            SET latitude = ?, longitude = ?
            WHERE id = ?;`; 
        const connection = await db;
        connection.query(query, dadosCoordenadas);
        
    } catch (error) {
        throw new Error('Erro ao salvar coordenadas do estabelecimentos: ', error);
    }
};


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
        // console.log(`coordenadas casa:: ${lat1}, ${lon1}`);
        // console.log(`coordenadas estabelecimento:: ${lat2}, ${lon2}`);
        // console.log('obterDistanciaDoEstabelecimento');
        const apiKey = variaveisGlobais.googleApiKey();
        const apiUrl = `https://maps.googleapis.com/maps/api/directions/json?origin=${lat1},${lon1}&destination=${lat2},${lon2}&mode=driving&key=${apiKey}`

        const response = await axios.get(apiUrl);
        // console.log('legs:: ', response.data.routes[0].legs[0].distance.value);
        return response.data.routes[0].legs[0].distance.value;
    } catch (error) {
        throw new Error('Erro ao fazer a requisição para a API do Google Maps Directions: ', error);
    }
};

module.exports = {
    obterCoordenadasViaGoogleApi,
    obterDistanciaDoEstabelecimento,
    procurarEstabelecimentosSemCoordenadas,
    salvarCoordenadasDoEstabelecimento
} 
