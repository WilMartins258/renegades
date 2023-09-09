const express = require('express');
const router = express.Router();

// Importando controllers e serviços que serão utilizados nas rotas
const estabelecimentoController = require('./../controllers/estabelecimento.controller.js');