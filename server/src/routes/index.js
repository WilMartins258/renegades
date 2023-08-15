// Importando módulos
const express = require('express');
const router = require('express').Router();
const cors = require('cors');

router.use(express.json());
router.use(cors());

// Rotas do backend

router.use(
    "/",
    require("./home.js")
);

router.use(
    "/login",
    require("./login.js")
);

module.exports = router;