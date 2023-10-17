const router = require('express').Router();

const promocao_Service = require('../services/promocao.service.js');

router.get('/', async (req, res) => {
    try {
        await promocao_Service.verificarValidadeDePromocoes();

        res.status(200).send();
    } catch (error) {
        res.status(500).send({
            msg: 'Erro ao processar solicitação.',
            erro: error
        });
    }
});

module.exports = router;