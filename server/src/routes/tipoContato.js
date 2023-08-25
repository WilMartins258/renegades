// Importando módulos
const router = require('express').Router();
const db = require('../db');

    const getAllTipoContato = async () => {
        const tipoContatoQuery = "SELECT * FROM tipoContato";
        const connection = await db;

        const [tipoContato] = await connection.query(tipoContatoQuery);
    
        return tipoContato;
    }

router.get('/', async (req, res) => {

    // O resultado disso é um array com cada tipo de contato em um elemento
    const tipoContato = await getAllTipoContato();
    
    res.status(200).send(
        tipoContato
    );
});


module.exports = router;