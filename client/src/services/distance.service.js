const axios = require('axios');

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

async function obterCoordenadasDoCEP() {
  const numeroEndereco = "";
  const cep = "18117-260";
  const apiKey = "";

  const apiUrl = `https://maps.googleapis.com/maps/api/geocode/json?address=${numeroEndereco},${cep}&key=${apiKey}`;

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