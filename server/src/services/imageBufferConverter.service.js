const router = require('express').Router();
const db = require('../db');
const fs = require("fs");

/**
 * O objetivo deste serviço é receber o buffer de uma imagem salva no banco e devolver o código em base 64 dessa imagem
 * To imagem ao ser inserina no banco passa a ser um buffer
 * @returns 
 */

const getImage = async () => {
    const connection = await db;
    const getImageQuery = "SELECT blobTest FROM testtable WHERE id = ?";
    const [image] = await connection.query(getImageQuery, 10);

    return image;
}

const insertImage = async (nomeImagem, codigoBase64Image) => {
    try {
        const connection = await db;
        const insertImageQuery = "INSERT INTO testtable VALUES (null, ?, ?);";
        const [insertedImage] = await connection.query(insertImageQuery, nomeImagem, codigoBase64Image);

        return insertedImage;
    } catch (error) {
        console.error(error);
    }   
}

router.get('/', async (req, res) => {
    console.log('Inicio do TEST');

    const insertImage = await insertImage();
    // console.log('insertImage::\n ', insertImage);

    /* O retorno é um objeto JSON conforme o exemplo abaixo
        {
            "blobTest":{
                "type":"Buffer",
                "data":[ 
                    BUFFER COM A IMAGEM
                ]
            }
        }
    */
    const retornoImagem = await getImage();
    // console.log('test[0]::\n ', retornoImagem[0]);

    const retornoImagemStringify = JSON.stringify(retornoImagem[0]);
    // console.log('testString::\n ', retornoImagemStringify);

    const retornoImagemJson = JSON.parse(retornoImagemStringify);
    // console.log('parsedJson::\n ', retornoImagemJson);

    const imgBufferData = retornoImagemJson.blobTest.data;
    // console.log('imgBufferData::\n ', imgBufferData);
    
    // A linha baixo contém o código base64 de um arquivo de texto que dentro dele tem o código base64 da imagem que preciso.
    const textImgBase64 = Buffer.from(imgBufferData).toString('base64');
    // console.log('textImgBase64::\n ', textImgBase64);

    // A linha abaixo finalmente contém o código da imagem em si em base 64
    const imageDataBase64 = Buffer.from(textImgBase64, 'base64').toString('utf-8');

    // Essa linha abaixo eu não entendi, mas é necessária para poder exibir a imagem
    const imgBuffer = Buffer.from(imageDataBase64, 'base64');

    // setando manualmente o header que indica o tipo de arquivo que está sendo enviado
    res.writeHead(200, {
        'Content-Type': 'image/png'
    });

    console.log('Fim do TEST');
    res.end(imgBuffer);
});

module.exports = router;

/*
    res.end(): Este método é usado para encerrar a resposta manualmente. Ele permite que você controle explicitamente quando a resposta é encerrada. Você precisa definir manualmente os cabeçalhos e o corpo da resposta antes de chamar esse método. É mais útil quando você precisa controlar cada aspecto da resposta ou quando precisa fazer algo mais complexo antes de finalizar a resposta.
*/
