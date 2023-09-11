const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const estabelecimentoController = require('./../controllers/estabelecimento.controller.js');

router.post('/', async (req, res) => {

    res.status(200).send(
        'estabelecimento funcinando'
    );
});

module.exports = router;