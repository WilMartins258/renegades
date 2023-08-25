// Importando módulos
const express = require('express');
const router = require('express').Router();
const cors = require('cors');

router.use(express.json());
router.use(cors());

// Rotas do backend

router.use(
    "/",
    require("./pages/home.js")
);

router.use(
    "/login",
    require("./pages/login.js")
);

module.exports = router;