// Importando módulos
const router = require('express').Router();
const db = require('../db');

    const getAllEstilosMusica = async () => {
        const estiloMusicaQuery = "SELECT * FROM estiloMusica";
        const connection = await db;

        const [estilosMusica] = await connection.query(estiloMusicaQuery);
    
        return estilosMusica;
    }

router.get('/', async (req, res) => {

    // O resultado disso é um array com cada estilo de música em um elemento
    const estilosMusica = await getAllEstilosMusica();
    
    res.status(200).send(
        estilosMusica
    );
});


module.exports = router;