// Importando módulos
const express = require('express');
const router = require('express').Router();

router.get('/', (req, res) => {
    res.send('Dados da home Renagades. GET');
});

router.post('/', (req, res) => {
    console.log('passou pelo /home POST')
    res.send('Dados da página de home.');
});

module.exports = router;