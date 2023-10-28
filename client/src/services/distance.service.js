const axios = require('axios');

// Calculo de distância usando a API do Google - Directions
const calcularDistancia = async (lat1, lon1, lat2, lon2) => {
  try {
    const apiKey = "";
    const apiUrl = `https://maps.googleapis.com/maps/api/directions/json?origin=${lat1}, ${lon1}&destination=${lat2}, ${lon2}&mode=driving&key=${apiKey}`;

    const response = await axios.get(apiUrl);
    const data = response.data;

    return data;    
  } catch (error) {
    console.log('Erro ao buscar distância do estabelecimento: ', error);
    return 'test fail';
  }
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

module.exports = {
    calcularDistancia,
    obterCoordenadasDoCEP
};