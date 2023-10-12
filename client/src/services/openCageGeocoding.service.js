const axios = require('axios');

// Função para obter latitude e longitude a partir de um CEP usando OpenCage Geocoding API
const obterLatLongPorCEP = async (cep) => {
    console.log('cep:: ', cep);
    const API_KEY = '';
    const apiUrl = `https://api.opencagedata.com/geocode/v1/json?q=${cep}&key=${API_KEY}`;

    try {
        const response = await axios.get(apiUrl);
        const data = response.data;

        if (data.results.length > 0) {
            const latitude = data.results[0].geometry.lat;
            const longitude = data.results[0].geometry.lng;
            console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
        } else {
            console.log('CEP não encontrado.');
        }
    } catch (error) {
        console.error('Erro ao obter dados de geolocalização:', error);
    }
};

module.exports = {
    obterLatLongPorCEP
};