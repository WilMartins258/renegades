const router = require('express').Router();
const opcionaolController = require('../controllers/opcionaol.controller.js');

router.get('/', async (req, res) => {
    const opcionais = await opcionaolController.getAllOpcionais();
    
    res.status(200).send(
        opcionais
    );
});

module.exports = router;