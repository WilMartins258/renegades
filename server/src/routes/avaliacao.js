const router = require('express').Router();
const avaliacao_Service = require('../services/avaliacao.service.js');
const estabelecimento_Service = require('../services/estabelecimento.service.js');

router.get('/usuario/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        const avaliacao = await avaliacao_Service.pegarPorIdUsuario(idUsuario);

        res.status(200).send(avaliacao);
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

router.get('/estabelecimento/:idEstabelecimento', async (req, res) => {
    try {
        const idEstabelecimento = req?.params?.idEstabelecimento;
        const avaliacao = await avaliacao_Service.pegarPorIdEstabelecimento(idEstabelecimento);
        const notaEstabelecimento = await estabelecimento_Service.pegarNotaEstabelecimentoPorId(idEstabelecimento);

        res.status(200).send({
            avaliacao,
            notaEstabelecimento
        });
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

router.post('/', async (req, res) => {
    try {
        const { idUsuario, idEstabelecimento, descricao, nota } = req.body;
        const dataDeHoje = new Date().toISOString().substring(0, 10);

        const dadosNovaAvaliacao = {
            idUsuario: idUsuario,
            idEstabelecimento: idEstabelecimento,
            descricao: descricao,
            data: dataDeHoje,
            nota: nota
        };
        const dadosNovaAvaliacaoArray = Object.values(dadosNovaAvaliacao);
        
        const novoIdAvaliacao = await avaliacao_Service.inserir(dadosNovaAvaliacaoArray);

        res.status(200).send({novoIdAvaliacao});
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

router.put('/', async (req, res) => {
    try {
        const { idAvaliacao, descricao, nota } = req.body;
        const dataDeHoje = new Date().toISOString().substring(0, 10);
        
        await avaliacao_Service.atualizar([nota, descricao, dataDeHoje, idAvaliacao]);

        res.status(200).send({   
            atualizacao: true
        });
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

module.exports = router;