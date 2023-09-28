const router = require('express').Router();

router.get('/', async (req, res) => {



    res.status(200).send('test 123');
});

module.exports = router;