const router = require('express').Router();

const home_Service = require('./../services/home.service.js');

router.get('/', async (req, res) => {
    const todosEstabelecimentos = await home_Service.pegarTudo();
    console.log({todosEstabelecimentos});

    res.status(200).send({
        todosEstabelecimentos
    });   
    
});

module.exports = router;