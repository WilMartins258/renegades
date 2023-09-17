const express = require('express');
const router = express.Router();
const enderecoService = require('./../services/endereco.service.js');

router.get('/:id', async (req, res) => {

    const enderecoId = req.params.id;
    // console.log('Início da rota usuario :id');

    // Recebe os dados de um endereco passando como parâmetro seu ID
    const enderecoData = await enderecoService.getEnderecoById(enderecoId);

    res.status(200).send(enderecoData);
});

router.put('/', async (req, res) => {
    try {
        const reqBody = req.body;

        const novosDadosEndereco = {
            cep: reqBody.cep,
            estado: reqBody.uf,
            cidade: reqBody.cidade,
            lodradouro: reqBody.rua,
            bairro: reqBody.bairro,
            numero: reqBody.numero,
            enderecoId: reqBody.enderecoId
        };
        
        const novosDadosEnderecoArray = Object.values(novosDadosEndereco);
        
        const newEnderecoData = await enderecoService.updateEnderecoData(novosDadosEnderecoArray);

        res.status(200).send({
            msg: 'Dados de endereço do usuário alterados com sucesso!'
        });
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error
        });
    }
});

module.exports = router;
