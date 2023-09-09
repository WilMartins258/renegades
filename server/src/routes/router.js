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

router.use(
    "/categorias",
    require("./categorias.js")
);

router.use(
    "/estilomusica",
    require("./estilomusica.js")
);

router.use(
    "/tipocontato",
    require("./tipoContato.js")
);

router.use(
    "/usuario",
    require("./usuario.js")
);

router.use(
    "/endereco",
    require("./endereco.js")
);

router.use(
    "/estabelecimento",
    require("./estabelecimento.js")
);

router.use(
    "/test",
    require("./test.js")
);

router.use((req, res) => {
    res.status(404).send('Página não encontrada');
});

module.exports = router;