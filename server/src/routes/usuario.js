const express = require('express');
const router = express.Router();
const dataToMySql_Service = require('../services/utils/dataToMySql.service.js');
const usuario_Service = require('../services/usuario.service.js');
const extensaoImagem_Service = require('../services/utils/extensaoImagens.service.js');
const buffer_Service = require('../services/utils/buffer.service.js');
const fs = require('fs');

router.get('/', async (req, res) => {
    try {
        const usuarios = await usuario_Service.pegarTudo();

        if (usuarios) {
            for (let i=0; i < usuarios.length ;i++) {
                if (usuarios[i].status == 'Ativo') {
                    usuarios[i].ativo = true
                } else {
                    usuarios[i].ativo = false
                }
            }
        }

        res.status(200).send(usuarios);
    } catch (error) {
        console.log('Erro na rota GET /: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const userId = req?.params?.id;
        const dadosUsuario = await usuario_Service.pegarPorId(userId);

        if (dadosUsuario) {
            res.status(200).send(
                dadosUsuario
            );
        } else  {
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
        const {
            idUsuario,
            nome,
            dataNascimento,
            celular,
            email,
            senha,
            cep,
            estado,
            cidade,
            bairro,
            logradouro,
            numero,
            fotoBuffer,
            fotoType
        } = req.body;

        const dataNascMySqlFormat = dataToMySql_Service.dataToMySqlFormat(dataNascimento);

        const extensaoImagem = extensaoImagem_Service.encontrarExtensaoImagem(fotoType);
        const bufferFotoUusuario= await buffer_Service.transformarBufferEmValido(fotoBuffer);
        
        const novosDadosUsuario = {
            nome,
            celular,
            email,
            senha,
            fotoPerfil: extensaoImagem,
            dataNascimento: dataNascMySqlFormat,
            cep,
            estado,
            cidade,
            bairro,
            logradouro,
            numero,
            idUsuario
        };
        const novosDadosUsuarioArray = Object.values(novosDadosUsuario);
        await usuario_Service.atualizar(novosDadosUsuarioArray);

        fs.writeFile(`./../client/src/components/Usuario/images/${idUsuario}.${extensaoImagem}`, bufferFotoUusuario, (err) => {
            if (err) {
              console.error('Erro ao salvar imagem do usuário:', err);
            }
        });

        res.status(200).send({
            msg: 'Dados do usuário alterados com sucesso!',
            id: idUsuario,
            nome: nome,
            email: email
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
        const checagemEmail = await usuario_Service.checarEmail(dadosUsuario.email);
        if (checagemEmail) {
            res.status(400).send({
                login: false,
                msg: 'O email fornecido já está associado a uma conta existente. Por favor, use outro email ou faça login se você já possui uma conta.'
            });
            
        } else {
            const idUsuario = await usuario_Service.inserir(dadosUsuarioArray);

            res.status(200).send({
                msg: 'Usuário adicionado ao sistema',
                login: true,
                id: idUsuario,
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

router.get('/localizacao/:idUsuario', async (req, res) => {
    const idUsuario = req?.params?.idUsuario;

    const localizacao = await usuario_Service.buscarLocalizacaoPorId(idUsuario);
    
    try {
        res.status(200).send({localizacao});
    } catch (error) {
        console.log('Erro ao buscar localização do usuário: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;
