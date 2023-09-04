const express = require('express');
const router = express.Router();
const enderecoController = require('./../controllers/endereco.controller.js');

router.get('/:id', async (req, res) => {

    const enderecoId = req.params.id;
    // console.log('Início da rota usuario :id');

    // Recebe os dados de um endereco passando como parâmetro seu ID
    const enderecoData = await enderecoController.getEnderecoById(enderecoId);

    res.status(200).send(enderecoData);
});

module.exports = router;
