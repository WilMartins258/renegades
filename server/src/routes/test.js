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
    const testQuery = "SELECT blobTest FROM testtable WHERE id = 3";
    const [test] = await connection.query(testQuery);

    return test;
}


/*
    o código abaixo pega a imagem em base64, tranforma em buffer e depois transforma novamente na no código base64 que facilmente se torna imagem.
*/
router.get('/', async (req, res) => {
    const fs = require('fs');
    const test = await getTest();

    const retiradoDoBack = test[0];

    // const base64Code = "";

    // const buffer = Buffer.from(base64Code, "base64");

    // console.log(buffer);

    // const base64Text = buffer.toString('base64');

    // console.log(base64Text);



    res.status(200).send(retiradoDoBack);
    // res.status(200).send({testbuffer: base64Text});
});

module.exports = router;