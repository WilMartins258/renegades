const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const estabelecimentoService = require('./../services/estabelecimento.service.js');
const enderecoService = require('./../services/endereco.service.js');

router.get('/:id', async (req, res) => {
    try {
        const idEstabelecimento = req.params.id;
        const dadosEstabelecimento = await estabelecimentoService.getEstabelecimentoById(idEstabelecimento);
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
        // console.log('reqBody:: ', reqBody);
        
        const dataDeHoje = new Date().toISOString().substring(0, 10);

        const dadosEndereco = {
            cep: reqBody.cep,
            uf: reqBody.endereco.uf,
            cidade: reqBody.endereco.cidade,
            rua: reqBody.endereco.rua,
            bairro: reqBody.endereco.bairro,
            numero: reqBody.numero
        };
        const dadosEnderecoArray = Object.values(dadosEndereco);
        
        const enderecoId = await enderecoService.createEndereco(dadosEnderecoArray);
        console.log('enderecoId:: ', enderecoId);

        const dadosEstabelecimento = {
            idEndereco: 'test',
            nome: reqBody.nomeEstabelecimento,
            cnpj: reqBody.cnpj,
            photo: 'test-blob-photo',
            descricao: reqBody.descricaoEstabelecimento,
            // ativo: true,
            // oculto: false,
            // statusValidacao: 'Pendente',
            // nota: null,
            // numeroAvaliacoes: 0,
            dataCadastro: dataDeHoje,
            dataUltimoAcesso: dataDeHoje
        }
        // console.log('dadosEstabelecimento:: ', dadosEstabelecimento);
           
        const dadosCategoria = {}
        console.log('dadosCategoria:: ', dadosCategoria);
        
        const dadosOpcionais = {}
        console.log('dadosOpcionais:: ', dadosOpcionais);

        // const criacaoEstabelecimento = estabelecimentoService.createEstabelecimento(dadosEstabelecimento);


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