const router = require('express').Router();
const estiloMusicaController = require('../controllers/estiloMusica.controller.js');

router.get('/', async (req, res) => {
    try {
        const todosEstilosMusica = await estiloMusicaController.getAllEstilosMusica();

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