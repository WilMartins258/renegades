const router = require('express').Router();
const axios = require('axios');

router.get('/', async (req, res) => {
    try {
        console.log('distancia rota ');
          const apiKey = "";
          // const apiUrl = `https://maps.googleapis.com/maps/api/directions/json?origin=${lat1}, ${lon1}&destination=${lat2}, ${lon2}&mode=driving&key=${apiKey}`;

        //   const response = await axios.get(apiUrl);
        //   const data = response.data;

        //   console.log('data:: ', data)

        res.status(200).send('distância test');  
    } catch (error) {
        console.log('Erro ao buscar distância do estabelecimento: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message,
            msg: 'Erro na rota de distância'
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