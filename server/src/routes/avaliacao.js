const router = require('express').Router();
const avaliacao_Service = require('../services/avaliacao.service.js');

router.get('/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        const avaliacao = await avaliacao_Service.pegarPorIdUsuario(idUsuario);

        res.status(200).send(avaliacao);
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

module.exports = router;