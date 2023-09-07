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
            res.status(404).send({
                msg: 'Email não encontrado',
                login: false
            });
        } else {
            console.log('email encontrado');

            // if ()
            res.send({
                msg: 'Bem-vindo(a)',
                login: true
            });
        }
    } catch (error) {
        console.error('Erro no login:', error);
        res.status(500).send({
            msg: 'Erro ao processar o login',
            login: false
        });
    }
});

module.exports = router;
