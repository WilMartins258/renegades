const router = require('express').Router();
const categoriasController = require('./../controllers/categorias.controller.js');

router.get('/', async (req, res) => {
    const categorias = await categoriasController.getAllCategorias();
    
    res.status(200).send(
        categorias
    );
});

module.exports = router;