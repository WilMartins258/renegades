const router = require('express').Router();
const estiloMusicaService = require('../services/estiloMusica.service.js');

router.get('/', async (req, res) => {
    try {
        const todosEstilosMusica = await estiloMusicaService.pegarTudo();

        res.status(200).send(todosEstilosMusica);
    } catch (error) {
        console.error('ERROR:: ', error);
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

        const id = await estiloMusicaService.inserir(dadosEstiloMusicaArray);

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