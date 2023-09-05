const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const userController = require('./../controllers/usuario.controller.js');
const separarNomeService = require('../services/separarNome.service.js');
const separarCelularService = require('../services/separarCelular.service.js');
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
    const reqBody = req.body;

    const nomeDividido = separarNomeService.dividirNome(reqBody?.nomeCompleto);
    const numeroDividido = separarCelularService.extrairCodigoAreaENumero(reqBody?.celularCompleto);
    const dataNascMySqlFormat = dataToMySqlService.dataToMySqlFormat(reqBody?.dataNascimento);

    const novosDadosUsuario = {
        nome: nomeDividido.nome,
        sobrenome: nomeDividido.sobrenome,
        codigo: numeroDividido?.codigoArea,
        celular: numeroDividido?.numero,
        // cpf: null, // Posteriormente ou iremos remover o CPF do banco ou iremos adicionar ele ao front
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
});

router.post('/', async (req, res) => {
    console.log('Início da rota usuario POST');
    const reqBody = req.body;

    // console.log('reqBody:: \n', reqBody);

    const dadosUsuario = {


    };


    res.status(200).send(
        `Usuário adicionado ao sistema`
    );
});

module.exports = router;
