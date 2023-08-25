// Importando módulos
const router = require('express').Router();
const db = require('../db');

    const getAllCategorias = async () => {
        const categoriasQuery = "SELECT * FROM categoria";
        const connection = await db;

        const [categorias] = await connection.query(categoriasQuery);
    
        return categorias;
    }

router.get('/', async (req, res) => {

    // O resultado disso é um array com cada categoria em um elemento
    const categorias = await getAllCategorias();
    
    res.status(200).send(
        categorias
    );
});


module.exports = router;