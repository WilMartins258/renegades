const router = require('express').Router();
const loginService = require('./../services/login.service.js');

router.post('/', async (req, res) => {
    const loginInfo = req?.body;

    try {
        if (!loginInfo || !loginInfo.email || !loginInfo.senha) {
            return res.status(400).json({ 
                msg: 'Credenciais inválidas!', 
                login: false 
            });
        }

        const resultadoLogin = await loginService.getLoginData(loginInfo.email);

        if (!resultadoLogin) {
            res.status(404).send({
                msg: 'Email não encontrado!',
                login: false
            });
        } else {
            if (loginInfo.senha === resultadoLogin.senha) {
                res.status(200).send({
                    login: true,
                    id: resultadoLogin.id,
                    nome: resultadoLogin.nome,
                    tipoUsuario: resultadoLogin.tipoUsuario,
                    fotoperfil: resultadoLogin.fotoperfil
                });
            } else {
                res.status(401).send({
                    msg: 'Senha incorreta!',
                    login: false
                });
            }
        }
    } catch (error) {
        console.error('ERRO:: ', error);
        res.status(500).send({
            msg: 'Erro ao processar o login.',
            login: false
        });
    }
});

module.exports = router;
