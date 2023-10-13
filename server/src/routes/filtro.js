const express = require('express');
const router = express.Router();

const estabelecimento_Service = require('./../services/estabelecimento.service.js');
const categoria_Service = require('../services/categoria.service.js');
const opcionaol_Service = require('../services/opcional.service.js');
const comida_Service = require('../services/comida.service.js');

router.get('/', async (req, res) => {
    try {
        const estabelecimentos = await estabelecimento_Service.filtros();
        const categorias = await categoria_Service.pegarTudo();
        const opcionais = await opcionaol_Service.pegarTudo();
        const comidas = await comida_Service.pegarTudo();

        res.status(200).send({
            estabelecimentos,
            categorias,
            opcionais,
            comidas
        });  
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos',
            error: error.message
        });
    }
});

module.exports = router;