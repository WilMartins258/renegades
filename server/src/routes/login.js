const router = require('express').Router();
const loginController = require('./../controllers/login.controller');

router.post('/', async (req, res) => {
    const loginInfo = req?.body;

    console.log('loginInfo:: ', loginInfo);

    try {
        const resultadoLogin = await loginController.getLoginData(loginInfo.email);

        console.log('resultadoLogin:: ', resultadoLogin);

        if (!resultadoLogin) {
            console.log('email não encontrado');
            res.status(404).send(
                'Email não encontrado'
            );
        } else {
            console.log('email encontrado');
            res.send(
                'Login bem-sucedido'
            );
        }
    } catch (error) {
        console.error('Erro no login:', error);
        res.status(500).send(
            'Erro ao processar o login'
        );
    }
});

module.exports = router;
