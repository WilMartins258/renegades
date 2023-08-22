// Importando módulos
const express = require('express');
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

router.get('/', async (req, res) => {
    const resultadoEstabelecimentos = await getAllEstabelecimentos(loginInfo.email);

    console.log({resultadoEstabelecimentos});
    
    res.send('Dados da home Renagades. GET');
});

module.exports = router;