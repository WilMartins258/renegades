const router = require('express').Router();
const avaliacao_Service = require('../services/avaliacao.service.js');

router.get('/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        console.log('idUsuario:: ', idUsuario);
        
        const avaliacao = await avaliacao_Service.pegarPorIdUsuario(idUsuario);
        console.log('avaliacao:: ', avaliacao);

        res.status(200).send(avaliacao);
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;