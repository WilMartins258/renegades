const axios = require('axios');
const api = require('./backend.service.js')
const variaveisGlobais = require('./../../variaveis.js');

// Calculo de distância usando a API do Google - Directions
const calcularDistancia = async (lat1, lon1, lat2, lon2) => {
  const apiUrl = 'http://localhost:3001/distancia';
  const response = await axios.get(apiUrl);
  console.log('response:: ', response)
  return response;
};

async function obterCoordenadasDoCEP() {
  const numeroEndereco = "";
  const cep = "18117-260";
  const apiKey = "";

  const apiUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=${numeroEndereco},${cep}&key=${apiKey}`;
  // const apiUrl https://maps.googleapis.com/maps/api/geocode/json?address=243, 18117-570&key=AIzaS{{API_KEY}}

  try {
    const response = await axios.get(apiUrl);
    const data = response.data;
    // Aqui você pode lidar com os dados de resposta da API, como as coordenadas geográficas
    const latitude = data.results[0].geometry.location.lat;
    const longitude = data.results[0].geometry.location.lng;

    console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
    return ({
      latitude: latitude,
      longitude: longitude
    })
  } catch (error) {
    console.error('Erro ao obter os dados:', error);
  }
}

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
    calcularDistancia,
    obterCoordenadasDoCEP,
    obterDistanciaDoEstabelecimento
};