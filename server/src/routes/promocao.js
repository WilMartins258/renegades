const router = require('express').Router();
const promocao_Service = require('../services/promocao.service.js');

router.get('/', async (req, res) => {
    try {
        const promocoesAtivas = await promocao_Service.pegarPromocoesAtivas();

        res.status(200).send(promocoesAtivas);
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});


module.exports = router;