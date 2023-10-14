const router = require('express').Router();
const opcionaol_Service = require('../services/opcional.service.js');

router.get('/', async (req, res) => {
    try {
        const opcionais = await opcionaol_Service.pegarTudo();

        res.status(200).send(opcionais);
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;