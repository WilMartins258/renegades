const router = require('express').Router();
const opcionaolController = require('../controllers/opcionaol.controller.js');

router.get('/', async (req, res) => {
    try {
        const opcionais = await opcionaolController.getAllOpcionais();

        res.status(200).send(opcionais);
    } catch (error) {
        console.error('ERROR:: ', error);
    }
});

module.exports = router;