const router = require('express').Router();
const categoriaController = require('../controllers/categoria.controller.js');

router.get('/', async (req, res) => {
    try {
        const categorias = await categoriaController.getAllCategorias();

        res.status(200).send(
            categorias
        );  
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;