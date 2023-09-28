const router = require('express').Router();
const db = require('./../models/db.js');

const pegarTudo = async () => {
    const testQuery = 'SELECT * from testTable;';
    const connection = await db;

    const [test] = await connection.query(testQuery);

    return test;
};


router.get('/', async (req, res) => {
    const test = await pegarTudo();
    console.log('test:', test);

    
    // Converta o buffer em uma string e ele volta a ser código de base 64
    // const bufferString = test[0].blobTest.toString();

    test[0].blobTest = test[0].blobTest.toString();

    console.log('test:', test);


    res.status(200).send(test);
});

module.exports = router;