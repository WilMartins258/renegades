const router = require('express').Router();
const promocao_Service = require('../services/promocao.service.js');
const categoria_Service = require('../services/categoria.service.js');
const data_Service = require('../services/utils/dataToMySql.service.js');

router.get('/usuario', async (req, res) => {
    try {
        await promocao_Service.verificarValidadeDePromocoes();
        const promocoesAtivas = await promocao_Service.pegarTodasPromocoesAtivas();
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

router.get('/estabelecimento/:idEstabelecimento', async (req, res) => {
    try {
        await promocao_Service.verificarValidadeDePromocoes();
        const todasPromocoes = await promocao_Service.pegarPorIdEstabelecimento(req.params.idEstabelecimento);

        const promocoesAtivas = []
        const promocoesInativas = []
        const promocoesVencidas = []
        for (let i=0; i < todasPromocoes.length; i++) {
            if (todasPromocoes[i].status == 'Ativa') {
                promocoesAtivas.push(todasPromocoes[i]);
            } else if (todasPromocoes[i].status == 'Inativa') {
                promocoesInativas.push(todasPromocoes[i]);
            } else {
                promocoesVencidas.push(todasPromocoes[i]);
            }
        }

        res.status(200).send({
            promocoesAtivas,
            promocoesInativas,
            promocoesVencidas
        });
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao buscar promoções do estabelecimento.',
            msg: 'Ocorreu um erro ao buscar promoções do estabelecimento.',
            error: error,
            message: message
        });
    }
});

router.post('/', async (req, res) => {
    try {
        const {
            codigo,
            nome,
            descricao,
            dataInicio,
            dataFim,
            idEstabelecimento
        } = req.body

        const dadosPromocao = {
            idEstabelecimento: idEstabelecimento,
            nome: nome,
            descricao: descricao,
            codigo: codigo,
            dataInicio: data_Service.dataToMySqlFormat(dataInicio),
            dataFim: data_Service.dataToMySqlFormat(dataFim)
        };
        const dadosPromocaoArray = Object.values(dadosPromocao);

        const idPromocao = await promocao_Service.inserir(dadosPromocaoArray);

        res.status(200).send({
            idPromocao: idPromocao
        });
    } catch (error) {
        console.log('ERROR:: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao salvar a promoção.',
            msg: 'Ocorreu um erro ao salvar a promoção.',
            error: error.message
        });
    }
});

module.exports = router;