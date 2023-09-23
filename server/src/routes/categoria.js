const router = require('express').Router();
const categoria_Service = require('../services/categoria.service.js');

router.get('/', async (req, res) => {
    try {
        const categorias = await categoria_Service.pegarTudo();

        res.status(200).send(categorias);  
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;