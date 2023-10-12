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
    "/categoria",
    require("./categoria.js")
);

router.use(
    "/comida",
    require("./comida.js")
);

router.use(
    "/opcional",
    require("./opcional.js")
);

router.use(
    "/estilomusica",
    require("./estilomusica.js")
);

router.use(
    "/usuario",
    require("./usuario.js")
);

router.use(
    "/estabelecimento",
    require("./estabelecimento.js")
);

router.use(
    "/carousel",
    require("./carousel.js")
);

router.use(
    "/favorito",
    require("./favorito.js")
);

router.use(
    "/avaliacao",
    require("./avaliacao.js")
);

router.use(
    "/test",
    require("./test.js")
);

router.use((req, res) => {
    res.status(404).send('Página não encontrada');
});

module.exports = router;