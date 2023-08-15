// Importando módulos
const express = require('express');
const router = require('express').Router();

router.get('/', (req, res) => {
    res.send('Dados da PÁGINA DE LOGIN Renagades /GET.');
});

router.post('/', (req, res) => {
    console.log('passou pelo /login POST')
    res.send('Dados da PÁGINA DE LOGIN Renagades');
});

module.exports = router;