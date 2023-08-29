// Importando módulos
const router = require('express').Router();
const db = require('../db');

/**
 * Query que busca os dados so usuário com base no email enviado
 * @returns login_data
 */
const userLogin = async (userEmail) => {
    const connection = await db;
    const loginQuery = "SELECT nome, email, senha FROM usuario WHERE email = ?";
    const [loginData] = await connection.query(loginQuery, userEmail);

    return loginData;
}

// router.get('/', (req, res) => {
//     res.send('Dados da PÁGINA DE LOGIN Renagades /GET.');
// });

router.get('/', async (req, res) => {
    console.log('/login GET \n\n');

    // É o objeto que contém tudo o que foi enviado lá do front, neste caso vai conter apenas uma email e uma senha
    const loginInfo = req?.body;

    // Chamando a consulta de email e senha e passando o e-mail enviado no front como parâmetro
    const resultadoLogin = await userLogin(loginInfo.email);

    // Testando para ver se houve algum resultado ao buscar pelo email enviado pelo front
    if (resultadoLogin[0]) {
        console.log('Email encontrado!');
        // Caso o email seja encontrado

        console.log({resultadoLogin: resultadoLogin[0]});
        console.log({senha: resultadoLogin[0].senha});

        // Testando se a senha enviada corresponde a senha salva no banco para o usuário
        if (resultadoLogin[0].senha === loginInfo.senha){
            // Senha correta

            console.log(`Bem-vindo(a), ${loginInfo.nome}!!!`);            
            return res.status(200).send({
                login: true,
                msg: `Bem-vindo(a), ${resultadoLogin[0].nome}!!!`
            });
        } else {
            // Senha correta
            console.log('Senha incorreta');

            return res.status(200).send({
                login: false,
                msg: 'Senha incorreta'
            });
        }
    } else {
        // Caso o email NÃO seja encontrado
        console.log('E-mail não encontrado');
        return res.status(200).send({
            login: false,
            msg: 'E-mail não encontrado'
        });
    }
  
    // return res.send('Dados da PÁGINA DE LOGIN Renagades');
});

module.exports = router;