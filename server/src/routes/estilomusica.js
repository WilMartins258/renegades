const router = require('express').Router();
const estiloMusica_Service = require('../services/estiloMusica.service.js');

router.get('/', async (req, res) => {
    try {
        const todosEstilosMusica = await estiloMusica_Service.pegarTudo();

        res.status(200).send(todosEstilosMusica);
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

        const novosDadosEstiloMusica = {
            nome: nome,
            ativo: ativo,
            id: id
        };
        const novosDadosEstiloMusicaArray = Object.values(novosDadosEstiloMusica);

        await estiloMusica_Service.atualizar(novosDadosEstiloMusicaArray);
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

        const dadosEstiloMusica = {
            nome: nome,
            ativo: ativo
        };
        const dadosEstiloMusicaArray = Object.values(dadosEstiloMusica);

        const id = await estiloMusica_Service.inserir(dadosEstiloMusicaArray);

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