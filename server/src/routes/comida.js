const router = require('express').Router();
const comida_Service = require('../services/comida.service.js');

router.get('/', async (req, res) => {
    try {
        const comidas = await comida_Service.pegarTudo();

        res.status(200).send(comidas);  
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;