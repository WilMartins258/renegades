// Importando módulos
const express = require('express');
const router = require('./routes/router.js');
const cors = require('cors');

// Criando uma instância do express
const app = express();

app.use(cors());
app.use(express.json({ limit: '5mb' })); // Define o tamanho máximo dos payloads para 5Mb
app.use(router);

const PORT = 3001;

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});