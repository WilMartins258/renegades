const router = require('express').Router();
const estiloMusicaService = require('../services/estiloMusica.service.js');

router.get('/', async (req, res) => {
    try {
        const todosEstilosMusica = await estiloMusicaService.getAllEstilosMusica();

        res.status(200).send(todosEstilosMusica);
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;