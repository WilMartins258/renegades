const router = require('express').Router();
const categoriaController = require('../controllers/opcionaol.controller.js');

router.get('/', async (req, res) => {
    const categorias = await categoriaController.getAllCategorias();
    
    res.status(200).send(
        categorias
    );
});

module.exports = router;