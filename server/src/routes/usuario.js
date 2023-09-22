const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
// const separarCelular_Service = require('../services/utils/separarCelular.service.js');
const dataToMySql_Service = require('../services/utils/dataToMySql.service.js');
const user_Service = require('../services/usuario.service.js');
const endereco_Service = require('../services/endereco.service.js');

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
        const dadosUsuario = await user_Service.pegarPorId(userId);

        const dadosEndereco = await endereco_Service.pegarPorIdDoUsuario(userId);

        if (dadosUsuario && dadosEndereco) {
            console.log('dadosUsuario && dadosEndereco')
            res.status(200).send({
                dadosUsuario,
                dadosEndereco
            });
        } else if (dadosUsuario) {
            console.log('dadosUsuario somente')
            res.status(200).send({dadosUsuario});
        }else {
            res.status(404).send('Id de usuário não encontrado!');
        }
    } catch (error) {
        console.error('Erro na rota /user:id GET', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.put('/', async (req, res) => {
    try {
        const reqBody = req.body;
        // const numeroDividido = separarCelular_Service.extrairCodigoAreaENumero(reqBody?.celularCompleto);
        const dataNascMySqlFormat = dataToMySql_Service.dataToMySqlFormat(reqBody?.dataNascimento);

        const novosDadosUsuario = {
            nome: reqBody.nome,
            // codigo: numeroDividido?.codigoArea,
            // celular: numeroDividido?.numero,
            email: reqBody.email,
            senha: reqBody.senha,
            foto: 'test-blob',
            dataNascimento: dataNascMySqlFormat,
            userId: reqBody.userId
        };

        const novosDadosUsuarioArray = Object.values(novosDadosUsuario);
        await user_Service.atualizar(novosDadosUsuarioArray);

        res.status(200).send(
            {
            msg: 'Dados do usuário alterados com sucesso!',
            id: idDoUsuario,
            nome: reqBody.nome,
            email: reqBody.email
        });
    } catch (error) {
        console.error('Erro na rota /user PUT:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.post('/', async (req, res) => {
    try {
        const reqBody = req.body;
        if (!reqBody.nome || !reqBody.email || !reqBody.senha) {
            return res.status(400).json({ 
                msg: 'Dados inválidas para criação de usuário.', 
                login: false 
            });
        }

        const dadosUsuario = {
            nome: reqBody.nome,
            email: reqBody.email,
            senha: reqBody.senha
        };

        const dadosUsuarioArray = Object.values(dadosUsuario);
        const checagemEmail = await user_Service.checarEmail(dadosUsuario.email);
        if (checagemEmail) {
            res.status(400).send({
                login: false,
                msg: 'O email fornecido já está associado a uma conta existente. Por favor, use outro email ou faça login se você já possui uma conta.'
            });
            
        } else {
            const usuarioInserido = await user_Service.inserir(dadosUsuarioArray);

            res.status(200).send({
                msg: 'Usuário adicionado ao sistema',
                login: true,
                id: usuarioInserido.idDoUsuario,
                nome: reqBody.nome,
                email: reqBody.email,
                tipoUsuario: 0
            });
        }
    } catch (error) {
        console.error('Erro na rota POST /', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a criação de usuário.',
            error: error.message,
            login: false
        });
    }
});

module.exports = router;
