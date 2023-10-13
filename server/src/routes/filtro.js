const express = require('express');
const router = express.Router();

const estabelecimento_Service = require('./../services/estabelecimento.service.js');

router.get('/', async (req, res) => {
    try {
        const estabelecimentosFiltro = await estabelecimento_Service.filtros();

        res.status(200).send(estabelecimentosFiltro);  
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos',
            error: error.message
        });
    }
});

module.exports = router;