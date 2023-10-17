const router = require('express').Router();
const promocao_Service = require('../services/promocao.service.js');
const categoria_Service = require('../services/categoria.service.js');

router.get('/usuario', async (req, res) => {
    try {
        const promocoesAtivas = await promocao_Service.pegarPromocoesAtivas();
        const categorias = await categoria_Service.pegarTudo();

        for (let i=0; i < promocoesAtivas.length; i++) {
            if (promocoesAtivas[i].categoriasString) {
                promocoesAtivas[i].categoria = promocoesAtivas[i].categoriasString.split(',').map(item => item.trim());
                promocoesAtivas[i].endereco = `${promocoesAtivas[i].logradouro}, nº${promocoesAtivas[i].numeroEstabelecimento} - ${promocoesAtivas[i].bairro} / ${promocoesAtivas[i].cidade}`;
            } else {
                promocoesAtivas[i].categoria = [null];
            }
        }

        res.status(200).send({
            promocoesAtivas,
            categorias
        });
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.get('/', async (req, res) => {
    try {    

    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});


module.exports = router;