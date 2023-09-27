const router = require('express').Router();
const favorito_Service = require('../services/favorito.service.js');

router.get('/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        console.error('idUsuario:: ', idUsuario);
        
        const favoritos = await favorito_Service.pegarPorId(idUsuario);
        console.error('favoritos:: ', favoritos);

        res.status(200).send(favoritos);
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;