const router = require('express').Router();
const opcionaol_Service = require('../services/opcional.service.js');

router.get('/', async (req, res) => {
    try {
        const opcionais = await opcionaol_Service.pegarTudo();

        res.status(200).send(opcionais);
    } catch (error) {
        console.log('ERROR:: ', error);
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

        const novosDadosOpcional = {
            nome: nome,
            ativo: ativo,
            id: id
        };
        const novosDadosOpcionalArray = Object.values(novosDadosOpcional);

        await opcionaol_Service.atualizar(novosDadosOpcionalArray);
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

        const dadosOpcional = {
            nome: nome,
            ativo: ativo
        };
        const dadosOpcionalArray = Object.values(dadosOpcional);

        const id = await opcionaol_Service.inserir(dadosOpcionalArray);

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