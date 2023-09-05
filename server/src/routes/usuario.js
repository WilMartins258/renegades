const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const userController = require('./../controllers/usuario.controller.js');
const separarNomeService = require('../services/separarNome.service.js');
const separarCelularService = require('../services/separarCelular.service.js');
const dataToMySqlService = require('../services/dataToMySql.service.js');

router.get('/', async (req, res) => {
    try {
        const reqBody = req.body;
        res.status(200).send(
            'Adicione o ID do usuário desejado no final da rota, exemplo: usuario/id'
        );
    } catch (error) {
        console.error('Erro na rota GET /: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const userId = req.params.id;
        const dadosUsuario = await userController.getUserById(userId);
        if (dadosUsuario) {
            res.status(200).send(dadosUsuario);
        } else {
            res.status(404).send('Id de usuário não encontrado!');
        }
    } catch (error) {
        console.error('Erro na rota GET /:id', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.put('/', async (req, res) => {
    try {
        const reqBody = req.body;

        const nomeDividido = separarNomeService.dividirNome(reqBody?.nomeCompleto);
        const numeroDividido = separarCelularService.extrairCodigoAreaENumero(reqBody?.celularCompleto);
        const dataNascMySqlFormat = dataToMySqlService.dataToMySqlFormat(reqBody?.dataNascimento);

        const novosDadosUsuario = {
            nome: nomeDividido.nome,
            sobrenome: nomeDividido.sobrenome,
            codigo: numeroDividido?.codigoArea,
            celular: numeroDividido?.numero,
            email: reqBody.email,
            senha: reqBody.senha,
            foto: 'test-blob',
            dataNascimento: dataNascMySqlFormat,
            userId: reqBody.userId
        };

        const novosDadosUsuarioArray = Object.values(novosDadosUsuario);
    
        const newUserData = await userController.updateUserData(novosDadosUsuarioArray);

        res.status(200).send({
            msg: 'Dados do usuário alterados com sucesso!'
        });
    } catch (error) {
        console.error('Erro na rota PUT /', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.post('/', async (req, res) => {
    try {
        console.log('Início da rota usuario POST');
        const reqBody = req.body;

        // Lógica para adicionar um usuário aqui

        res.status(200).send(`Usuário adicionado ao sistema`);
    } catch (error) {
        console.error('Erro na rota POST /', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;
