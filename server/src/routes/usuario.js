const router = require('express').Router();
const userController = require('./../controllers/usuario.controller')

router.get('/', async (req, res) => {
    const reqBody = req.body;

    // console.log('reqBody:: \n', req)
    res.status(200).send(
        'Adicione o ID do usuário desejado no final da rota, exemplo: usuario/id'
    );
});

router.put('/', async (req, res) => {
    console.log('Início da rota usuario PUT');
    const reqBody = req.body;

    console.log('reqBody:: \n', reqBody)
    res.status(200).send(
        'put'
    );
});

router.get('/:id', async (req, res) => {
    // Acesse o valor do parâmetro "id" usando req.params.id
    const userId = req.params.id;
    console.log('Início da rota usuario :id');

    // Recebe os dados de um usuário passando como parâmetro seu ID
    const dadosUsuario = await userController.getUserDataById(userId);

    console.log('Fim da rota usuario :id');
    if (dadosUsuario[0]) {
        res.status(200).send(
            dadosUsuario[0]
        );
    } else {
        res.status(404).send(
            'Id de usuário não encontrado!'
        );
    }
});

router.post('/', async (req, res) => {

    const dadosUsuario = {


    };


    res.status(200).send(
        `Usuário adicionado ao sistema`
    );
});

module.exports = router;