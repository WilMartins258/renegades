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
    "/estiloMusica",
    require("./estiloMusica.js")
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
    "/recomendacao",
    require("./recomendacao.js")
);

router.use((req, res) => {
    res.status(404).send('Página não encontrada');
});

module.exports = router;