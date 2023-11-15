const router = require('express').Router();
const estabelecimento_Service = require('./../services/estabelecimento.service.js');
const distancia_Service = require('../services/utils/distancia.service.js');

router.get('/cep', async (req, res) => {
    try {
        const { cep } = req.query;
        const estabelecimentos = await estabelecimento_Service.filtros();
        // console.log('cep:: ', cep)
  
        let distancias = [];
        try {
            distancias = await distancia_Service.obterDistanciaDeTodosEstabelecimentos(null, cep,estabelecimentos);
        } catch (error) {
            console.log('Erro ao lidar com a distância dos estabelecimentos: ', error);
        }
        // console.log('distancias:: ', distancias)

  
        res.status(200).send({distancias});
    } catch (error) {
        console.log('Erro distâncias dos estabelecimentos por meio do cep: ', error);
        res.status(500).send({
            errorMsg: 'Erro ao buscar distâncias dos estabelecimentos',
            msg: error.message,
            error: error
        }); 
    }
});

router.get('/', async (req, res) => {
  try {
      const {
          latitude,
          longitude
      } = req.query;
      const estabelecimentos = await estabelecimento_Service.filtros();

      let distancias = [];
      try {
          distancias = await distancia_Service.obterDistanciaDeTodosEstabelecimentos(latitude, longitude,estabelecimentos);
      } catch (error) {
          console.log('Erro ao lidar com a distância dos estabelecimentos: ', error);
      }

      res.status(200).send({distancias});
  } catch (error) {
      console.log('Erro distâncias dos estabelecimentos: ', error);
      res.status(500).send({
          errorMsg: 'Erro ao buscar distâncias dos estabelecimentos',
          msg: error.message,
          error: error
      }); 
  }
});


/*
  // try {
  //   console.log('calcularDistancia')
  //   const apiKey = "";
  //   const apiUrl = `https://maps.googleapis.com/maps/api/directions/json?origin=${lat1}, ${lon1}&destination=${lat2}, ${lon2}&mode=driving&key=${apiKey}`;

  //   const response = await axios.get(apiUrl);
  //   const data = response.data;

  //   console.log('data:: ', data)


  //   // return data;
  // } catch (error) {
  //   console.log('Erro ao buscar distância do estabelecimento: ', error);
  //   // return 'test fail';
  // }

*/

module.exports = router;