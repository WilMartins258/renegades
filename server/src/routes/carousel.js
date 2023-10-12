const express = require('express');
const router = express.Router();

const estabelecimento_Service = require('./../services/estabelecimento.service.js');

router.get('/', async (req, res) => {
    try {
        const estabelecimentosCarousel = await estabelecimento_Service.carousel();

        res.status(200).send(estabelecimentosCarousel);  
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos',
            error: error.message
        });
    }
});

module.exports = router;