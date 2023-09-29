const router = require('express').Router();
const avaliacao_Service = require('../services/avaliacao.service.js');

router.get('/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        console.error('idUsuario:: ', idUsuario);
        
        const avaliacao = await avaliacao_Service.pegarPorIdUsuario(idUsuario);
        console.error('avaliacao:: ', avaliacao);

        res.status(200).send(avaliacao);
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;