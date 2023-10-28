const router = require('express').Router();

router.get('/', async (req, res) => {
    try {
        console.log('distancia rota ');
        

        res.status(200).send('distância test');  
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message,
            msg: 'Erro na rota de distância'
        });
    }
});

module.exports = router;