const router = require('express').Router();
const promocao_Service = require('../services/promocao.service.js');

router.get('/', async (req, res) => {
    try {
        const recomendacoesAtivas = await recomendacao_Service.pegarRecomendacoesAtivas();

        res.status(200).send(recomendacoesAtivas);
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});


module.exports = router;