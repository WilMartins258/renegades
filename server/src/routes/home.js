// Importando módulos
// const express = require('express');
const router = require('express').Router();
// const cors = require('cors');

// router.use(express.json());
// router.use(cors());

router.get('/', (req, res) => {
    res.send('Dados da home Renagades.');
});