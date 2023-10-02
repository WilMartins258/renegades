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

        await favorito_Service.excluirPorIdFavorito(idFavorito);
        
        res.status(200).send({
            exclusao: true
        });
    } catch (error) {
        console.error('ERROR:: ', error);
        res.status(200).send({
            exclusao: false,
            msg: error
        });
    }
});

module.exports = router;