// Importando módulos
const express = require('express');
const router = require('./routes/router.js');
const cors = require('cors');

// Criando uma instância do express
const app = express();

app.use(express.json());
app.use(router);
app.use(cors);

const PORT = 3001;

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});