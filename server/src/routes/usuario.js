const router = require('express').Router();
// 
const userController = require('./../controllers/usuario.controller')

router.get('/', async (req, res) => {

    const dadosUsuario = userController.getUserData()
    console.log(dadosUsuario);
    
    // Devolvendo ao front somente os dados do usuário em um objeto
    res.status(200).send(
        dadosUsuario[0]
    );
});


module.exports = router;