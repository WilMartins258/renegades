const router = require('express').Router();
// 
const userController = require('./../controllers/usuario.controller')

router.get('/', async (req, res) => {

    // Posteriormente este dado deverá vir do front talvez sendo passado pela URL
    const userId = 2;

    const dadosUsuario = await userController.getUserData(userId)
    console.log(dadosUsuario[0]);

    // const dadosUsuarioJson = JSON.parse(dadosUsuario[0]);
    
    // Devolvendo ao front somente os dados do usuário em um objeto
    res.status(200).send(
        dadosUsuario[0]
    );
});


module.exports = router;