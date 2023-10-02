const router = require('express').Router();
const favorito_Service = require('../services/favorito.service.js');

router.get('/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        
        const favoritos = await favorito_Service.pegarPorIdUsuario(idUsuario);

        res.status(200).send(favoritos);
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

router.delete('/:idFavorito', async (req, res) => {
    try {
        const idFavorito = req?.params?.idFavorito;

        console.error('idFavorito:: ', idFavorito);

        const removerFavorito = await favorito_Service.excluirPorId(idFavorito);



        res.status(200).send('favoritos');
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;