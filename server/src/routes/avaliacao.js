const router = require('express').Router();
const avaliacao_Service = require('../services/avaliacao.service.js');

router.get('/:idUsuario', async (req, res) => {
    try {
        const idUsuario = req?.params?.idUsuario;
        const avaliacao = await avaliacao_Service.pegarPorIdUsuario(idUsuario);

        res.status(200).send(avaliacao);
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

router.put('/', async (req, res) => {
    try {
        const { idAvaliacao, descricao, nota } = req.body;
        const dataDeHoje = new Date().toISOString().substring(0, 10);
        
        await avaliacao_Service.atualizar([nota, descricao, dataDeHoje, idAvaliacao]);

        res.status(200).send({   
            atualizacao: true
        });
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(400).send({
            msg: error
        });
    }
});

module.exports = router;