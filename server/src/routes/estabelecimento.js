const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const estabelecimento_Service = require('./../services/estabelecimento.service.js');
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
        const reqBody = req.body;
        // console.log('reqBody:: ', reqBody);
        
        const idUsuario = reqBody.idUsuario;
        console.log('idUsuario:: ', idUsuario);

        const dadosEndereco = {
            cep: reqBody.cep,
            uf: reqBody.endereco.uf,
            cidade: reqBody.endereco.cidade,
            rua: reqBody.endereco.rua,
            bairro: reqBody.endereco.bairro,
            numero: reqBody.numero
        };
        const dadosEnderecoArray = Object.values(dadosEndereco);
        
        const enderecoId = await endereco_Service.inserir(dadosEnderecoArray);

        const removerCaracteresEspeciais = (str) => {
            const resultado = str.replace(/[\/\.\-]/g, '');
            return resultado;
        };
        const cnpjTratado = removerCaracteresEspeciais(reqBody.cnpj);

        const dataDeHoje = new Date().toISOString().substring(0, 10);

        const dadosEstabelecimento = {
            idEndereco: enderecoId,
            nome: reqBody.nomeEstabelecimento,
            cnpj: cnpjTratado,
            photo: 'test-blob-photo',
            descricao: reqBody.descricaoEstabelecimento,
            ativo: true,
            oculto: false,
            statusValidacao: 'Pendente',
            nota: null,
            numeroAvaliacoes: 0,
            dataCadastro: dataDeHoje,
            dataUltimoAcesso: dataDeHoje
        }
        const dadosEstabelecimentoArray = Object.values(dadosEstabelecimento);

        const estabelecimentoId = await estabelecimento_Service.inserir(dadosEstabelecimentoArray);

        const dadosCategoria = reqBody.categoriasSelecionadas;
        for (let i = 0; i < dadosCategoria.length; i++) {
            try {
                await categoria_estabelecimento_Service.inserir([estabelecimentoId, dadosCategoria[i].id]);
            } catch (error) {
                throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
            }  
        };

        const dadosOpcionais = reqBody.opcoesSelecionadas;
        console.log('dadosOpcionais:: ', dadosOpcionais);
        for (let i = 0; i < dadosOpcionais.length; i++) {
            try {
                await opcional_estabelecimento_Service.inserir([estabelecimentoId, dadosOpcionais[i].id]);
            } catch (error) {
                throw new Error(`Erro ao inserir opcionais do estabelecimento: ${error.message}`);
            }  
        };

        const dadosHorario = reqBody.HorariosSelecionados;
        console.log('dadosHorario:: ', dadosHorario);
        for (let i = 0; i < dadosHorario.length; i++) {
            try {
                
            } catch (error) {
                throw new Error(`Erro ao inserir horários do estabelecimento: ${error.message}`);
            }  
        };

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