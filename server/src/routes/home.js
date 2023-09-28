const router = require('express').Router();

const home_Service = require('./../services/home.service.js');
const test_Service = require('./../services/test.service.js');

router.get('/', async (req, res) => {
    const tests = await test_Service.pegarTudo();
    console.log('tests:: ', tests);

    res.status(200).send({
        test: 'testing 123'
    });
});

module.exports = router;