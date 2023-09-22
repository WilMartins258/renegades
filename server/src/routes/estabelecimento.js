const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const estabelecimento_Service = require('./../services/estabelecimento.service.js');
const usuario_Service = require('./../services/usuario.service.js');
const endereco_Service = require('./../services/endereco.service.js');
const categoria_estabelecimento_Service = require('../services/categoria_estabelecimento.service.js');
const opcional_estabelecimento_Service = require('../services/opcional_estabelecimento.service.js');

router.get('/:id', async (req, res) => {
    try {
        const idEstabelecimento = req.params.id;
        const dadosEstabelecimento = await estabelecimento_Service.pegarPorId(idEstabelecimento);
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
        const {
            idUsuario,
            nomeEstabelecimento,
            descricaoEstabelecimento,
            cnpj,
            estabelecimentoPhoto,
            endereco,
            cep,
            numero,
            categoriasSelecionadas,
            recomendacao,
            opcoesSelecionadas,
            estilosSelecionadas,
            rdSocialSelecionadas,
            horariosSelecionados
        } = req.body;
        
        const removerCaracteresEspeciais = (str) => {
            const resultado = str.replace(/[\/\.\-]/g, '');
            return resultado;
        };
        const cnpjTratado = removerCaracteresEspeciais(cnpj);

        const dataDeHoje = new Date().toISOString().substring(0, 10);

        const dadosEstabelecimento = {
            nome: nomeEstabelecimento,
            cnpj: cnpjTratado,
            fotoPrincipal: estabelecimentoPhoto,
            descricao: descricaoEstabelecimento,
            cep: cep,
            estado: endereco.uf,
            cidade: endereco.cidade,
            logradouro: endereco.rua,
            bairro: endereco.bairro,
            numero: numero,
            dataCadastro: dataDeHoje,
            dataUltimoAcesso: dataDeHoje
        }
        const dadosEstabelecimentoArray = Object.values(dadosEstabelecimento);
                
        const idEstabelecimento = await estabelecimento_Service.inserir(dadosEstabelecimentoArray);       
        await usuario_Service.inserirIdEstabelecimento([idEstabelecimento, idUsuario]);

        for (let i = 0; i < categoriasSelecionadas.length; i++) {
            try {
                await categoria_estabelecimento_Service.inserir([idEstabelecimento, categoriasSelecionadas[i].id]);
            } catch (error) {
                throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
            }  
        };

        for (let i = 0; i < opcoesSelecionadas.length; i++) {
            try {
                await opcional_estabelecimento_Service.inserir([idEstabelecimento, opcoesSelecionadas[i].id]);
            } catch (error) {
                throw new Error(`Erro ao inserir opcionais do estabelecimento: ${error.message}`);
            }
        };

        // for (let i = 0; i < horariosSelecionados.length; i++) {
        //     try {
                
        //     } catch (error) {
        //         throw new Error(`Erro ao inserir horários do estabelecimento: ${error.message}`);
        //     }  
        // };

        res.status(200).send({
            msg: 'Estabelecimento adicionado com sucesso!',
            tipoUsuario: 1,
            idEstabelecimento: idEstabelecimento
        });
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

        res.status(200).send({
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