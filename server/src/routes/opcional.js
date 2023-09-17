const router = require('express').Router();
const opcionaolService = require('../services/opcionaol.service.js');

router.get('/', async (req, res) => {
    try {
        const opcionais = await opcionaolService.getAllOpcionais();

        res.status(200).send(opcionais);
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;