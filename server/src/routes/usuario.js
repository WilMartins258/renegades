const express = require('express');
const router = express.Router();
const userController = require('./../controllers/usuario.controller.js');
const dividirNomeService = require('./../services/divisorNome.service.js');
const dividirCelularService = require('./../services/divisorCelular.service.js');
const dataToMySqlService = require('../services/dataToMySql.service.js');

router.get('/', async (req, res) => {
    const reqBody = req.body;

    // console.log('reqBody:: \n', req)
    res.status(200).send(
        'Adicione o ID do usuário desejado no final da rota, exemplo: usuario/id'
    );
});

router.get('/:id', async (req, res) => {
    // Acesse o valor do parâmetro "id" usando req.params.id
    const userId = req.params.id;
    // console.log('Início da rota usuario :id');

    // Recebe os dados de um usuário passando como parâmetro seu ID
    const dadosUsuario = await userController.getUserById(userId);

    // console.log('Fim da rota usuario :id');
    if (dadosUsuario) {
        res.status(200).send(
            dadosUsuario
        );
    } else {
        res.status(404).send(
            'Id de usuário não encontrado!'
        );
    }
});

router.put('/', async (req, res) => {
    console.log('Início da rota usuario PUT');
    const reqBody = req.body;
    console.log('reqBody:: ', reqBody);

    /*
        reqBody::  {
            nomeCompleto: 'Lucas Maximiano dos Santos...',
            dataNascimento: '01/05/2000',
            email: 'lucas@gmail.com',
            celularCompleto: '15999997777',
            senha: 'senha123',
            enderecoId: '2',
            cep: '1112233',
            rua: 'Rua do Lucas',
            numero: '1',
            bairro: 'Bairro do Lucas',
            cidade: 'Sorocaba',
            uf: 'SP'
        }
    */

    const nomeDividido = dividirNomeService.dividirNome(reqBody?.nomeCompleto);
    const numeroDividido = dividirCelularService.extrairCodigoAreaENumero(reqBody?.celularCompleto);
    const dataMySql = dataToMySqlService.dataToMySqlFormat(reqBody?.dataNascimento)

    const novosDadosUsuario = {
        nome: nomeDividido.nome,
        sobrenome: nomeDividido.sobrenome,
        dataNascimento: dataMySql,
        senha: reqBody.senha,
        email: reqBody.email,
        codigo: numeroDividido?.codigoArea,
        celular: numeroDividido?.numero,
    };

    const novosDadosUsuarioArray = Object.values(novosDadosUsuario);
    
    console.log('novosDadosUsuario:: ', novosDadosUsuario);
    console.log('novosDadosUsuarioArray:: ', novosDadosUsuarioArray);

    // reqBody?.enderecoId

    // console.log('reqBody:: \n', reqBody);
    res.status(200).send(
        'nomeDividido'
    );
});

router.post('/', async (req, res) => {

    // console.log('Início da rota usuario POST');
    const reqBody = req.body;

    // console.log('reqBody:: \n', reqBody);

    const dadosUsuario = {


    };


    res.status(200).send(
        `Usuário adicionado ao sistema`
    );
});

module.exports = router;
