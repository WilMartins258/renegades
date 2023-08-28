// Importando módulos
const router = require('express').Router();
const db = require('../db');

    /*
        Fixando no usuário de ID 1 momentaneamente
    */
    const getUserData = async () => {
        const dadosUsuarioQuery = "SELECT * FROM usuario WHERE id = 1";
        const connection = await db;

        const [dadosUsuario] = await connection.query(dadosUsuarioQuery);
    
        return dadosUsuario;
    }

router.get('/', async (req, res) => {

    const dadosUsuario = await getUserData();

    // console.log(dadosUsuario);
    
    // Devolvendo ao front somente os dados do usuário em um objeto
    res.status(200).send(
        dadosUsuario[0]
    );
});


module.exports = router;