const router = require('express').Router();
const login_Service = require('./../services/login.service.js');

router.post('/', async (req, res) => {
    const loginInfo = req?.body;
    try {
        if (!loginInfo || !loginInfo.email || !loginInfo.senha) {
            return res.status(400).json({ 
                msg: 'Credenciais inválidas!', 
                login: false 
            });
        }

        const resultadoLogin = await login_Service.fazerLogin(loginInfo.email);

        if (!resultadoLogin) {
            res.status(404).send({
                msg: 'Email não encontrado!',
                login: false
            });
        } else {
            if (loginInfo.senha === resultadoLogin.senha && resultadoLogin.status === 'Ativo') {
                res.status(200).send({
                    login: true,
                    id: resultadoLogin.id,
                    idEstabelecimento: resultadoLogin?.idEstabelecimento,
                    nome: resultadoLogin.nome,
                    tipoUsuario: resultadoLogin.tipoUsuario,
                    fotoperfil: resultadoLogin.fotoperfil
                });
            } else {
                if (resultadoLogin.status === 'Ativo') {
                    res.status(401).send({
                        msg: 'Senha incorreta!',
                        login: false
                    });
                } else {
                    res.status(401).send({
                        msg: 'Este usuário está desativado. Por favor, entre em contato com o administrador através do e-mail: adm@betterchoice.com',
                        login: false
                    });
                }
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
