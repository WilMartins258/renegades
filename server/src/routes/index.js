// Importando módulos
const express = require('express');
const router = require('express').Router();
const cors = require('cors');

router.use(express.json());
router.use(cors());

router.get('/', (req, res) => {
    console.log('passou pelo /')
    res.send('Dados da página inicial Renagades.');
});

// Rotas do backend

router.use(
    "/home",
    require("./home.js")
);

router.use(
    "/login",
    require("./login.js")
);

// router.use(
//     "/register",
//     require("./register.js")
// );

// router.use(
//     "/home-logged",
//     require("./home-logged.js")
// );


module.exports = router;