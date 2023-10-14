const router = require('express').Router();
const categoria_Service = require('../services/categoria.service.js');

router.get('/', async (req, res) => {
    try {
        const categorias = await categoria_Service.pegarTudo();

        res.status(200).send(categorias);  
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.put('/', async (req, res) => {
    try {
        const {
            nome,
            ativo,
            id
        } = req.body;

        const novosDadosCategoria = {
            nome: nome,
            ativo: ativo,
            id: id
        };
        const novosDadosCategoriaArray = Object.values(novosDadosCategoria);

        await categoria_Service.atualizar(novosDadosCategoriaArray);
        res.status(200).send();  
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.post('/', async (req, res) => {
    try {
        const {
            nome,
            ativo
        } = req.body;

        const dadosCategoria = {
            nome: nome,
            ativo: ativo
        };
        const dadosCategoriaArray = Object.values(dadosCategoria);

        const id = await categoria_Service.inserir(dadosCategoriaArray);

        res.status(200).send({id});
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;