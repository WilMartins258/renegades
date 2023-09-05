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
    /*
       reqBody::  {
        userId: '2',
        nomeCompleto: 'Lucas Maximiano da Silva',
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

    const novosDadosEndereco = {
        cep: reqBody.cep,
        estado: reqBody.uf,
        cidade: reqBody.cidade,
        lodradouro: reqBody.rua,
        bairro: reqBody.bairro,
        numero: reqBody.numero,
        enderecoId: reqBody.enderecoId
    };

    const nomeDividido = dividirNomeService.dividirNome(reqBody?.nomeCompleto);
    const numeroDividido = dividirCelularService.extrairCodigoAreaENumero(reqBody?.celularCompleto);
    const dataNascMySqlFormat = dataToMySqlService.dataToMySqlFormat(reqBody?.dataNascimento);

    const novosDadosUsuario = {
        nome: nomeDividido.nome,
        sobrenome: nomeDividido.sobrenome,
        codigo: numeroDividido?.codigoArea,
        celular: numeroDividido?.numero,
        // cpf: null,
        email: reqBody.email,
        senha: reqBody.senha,
        foto: 'test-blob',
        dataNascimento: dataNascMySqlFormat,
        userId: reqBody.userId
    };

   const novosDadosUsuarioArray = Object.values(novosDadosUsuario);

    try {
        const newUserData = await userController.updateUserData(novosDadosUsuarioArray);
    } catch (error) {
        console.error('ERROR:: ', error);
    } finally {
        res.status(200).send(
            {
                msg: 'Dados do usuário alterados com sucesso!'
            }
        );
    }

    
    console.log('novosDadosUsuarioArray:: ', novosDadosUsuarioArray);

    // reqBody?.enderecoId

    // console.log('reqBody:: \n', reqBody);
    
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
