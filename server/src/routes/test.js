// Importando módulos
const router = require('express').Router();
const db = require('../db');


// router.post('/', (req, res) => {
//     console.log('passou pelo /home POST')
//     res.send('Dados da página de home.');
// });

/**
 * Query que busca os dados so usuário com base no email enviado
 * @returns login_data
 */
const getAllEstabelecimentos = async () => {
    const connection = await db;
    const estabelecimentoQuery = "SELECT * FROM estabelecimento";
    const [estabelecimentos] = await connection.query(estabelecimentoQuery);

    return estabelecimentos;
}

const getTest = async () => {
    const connection = await db;
    const testQuery = "SELECT blobTest FROM testtable WHERE id = 1";
    const [test] = await connection.query(testQuery);

    return test;
}



router.get('/', async (req, res) => {
    // const resultadoEstabelecimentos = await getAllEstabelecimentos();
    // console.log({resultadoEstabelecimentos});
    // res.status(200).send({
    //     resultadoEstabelecimentos
    // });

    const test = await getTest();

    console.log(test[0]);


    const jsonCriado = JSON.stringify(test[0])
    console.log(jsonCriado);

    // const blob = new Blob([jsonCriado], { type: "application/json" });
    // console.log(blob);


    // const testFormatado = test.toString("base64");


    res.status(200).send({
        image64: jsonCriado
    });
    
    
});

module.exports = router;