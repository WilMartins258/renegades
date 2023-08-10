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

router.use(
    "/home", 
    require("./home.js")
);


// Rotas do backend
// router.use(
//     "/login", 
//     require("./login")
// );

// router.use(
//     "/register", 
//     require("./register")
// );

// router.use(
//     "/home-logged", 
//     require("./home-logged")
// );


module.exports = router;