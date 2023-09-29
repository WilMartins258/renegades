const router = require('express').Router();
const db = require('./../models/db.js');

const compressor_Service = require('./../services/utils/compressor.service.js');

const pegarTudo = async () => {
    const testQuery = 'SELECT * from testTable;';
    const connection = await db;

    const [test] = await connection.query(testQuery);

    return test;
};


router.get('/', async (req, res) => {
    const test = await pegarTudo();
    // console.log('test:', test);
    console.log('test[0]:', test[0]);

    
    // Converta o buffer em uma string e ele volta a ser código de base 64
    // const bufferString = test[1].blobTest.toString();
    // console.log('bufferString:', bufferString);

    // const imagemComprimida = await compressor_Service.compressaoDeTexto(bufferString);
    // console.log('imagemComprimida:', imagemComprimida);


    // test[1].blobTest = test[1].blobTest.toString();

    // console.log('test:', test);


    res.status(200).send('bufferString');
});

module.exports = router;