const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const estabelecimentoController = require('./../controllers/estabelecimento.controller.js');

router.get('/:id', async (req, res) => {
    try {
        const idEstabelecimento = req.params.id;
        const dadosEstabelecimento = await estabelecimentoController.getEstabelecimentoById(idEstabelecimento);
        if (dadosEstabelecimento) {
            res.status(200).send(dadosEstabelecimento);
        } else {
            res.status(404).send('Id de estabelecimento não encontrado!');
        }
    } catch (error) {
        console.error('Erro na rota GET /:id', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.post('/', async (req, res) => {
    try {
        const reqBody = req.body;
        console.log('reqBody:: ', reqBody);
        
        const dataDeHoje = new Date();

        console.log('dataDeHoje:: ', dataDeHoje);
        
        const dadosEstabelecimento = {
            nome: reqBody.nomeEstabelecimento,
            idCategoria: 'test',
            idEndereco: 'test',
            descricao: reqBody.descricaoEstabelecimento,
            cnpj: reqBody.cnpj,
            photo: 'test-blob-photo'
        }

        const dadosEndereco = {
            cep: reqBody.cep,
            rua: reqBody.endereco.rua,
            bairro: reqBody.endereco.bairro,
            cidade: reqBody.endereco.cidade,
            uf: reqBody.endereco.uf,
            numero: reqBody.numero
        };

        const dadosCategoria = {}
        const dadosOpcionais = {}

        const criacaoEstabelecimento = estabelecimentoController.createEstabelecimento(dadosEstabelecimento);


        res.status(200).send(
            'estabelecimento POST ok'
        );
    } catch (error) {
        console.error('Erro na rota POST /', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a criação de estabelecimento.',
            error: error.message
        });
    }
});

router.put('/', async (req, res) => {
    try {
        const reqBody = req.body;

        res.status(200).send(
            {
            msg: 'Dados do estabelecimento alterados com sucesso!'
        });
    } catch (error) {
        console.error('Erro na rota PUT: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;