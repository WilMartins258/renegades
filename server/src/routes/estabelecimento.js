const express = require('express');
const router = express.Router();
const fs = require('fs');
// const nelson = require('./../images/estabelecimento');

// Importando services e transaction
const transaction = require('./../models/transaction.js');
const estabelecimento_Service = require('./../services/estabelecimento.service.js');
const usuario_Service = require('./../services/usuario.service.js');
const categoria_estabelecimento_Service = require('../services/categoria_estabelecimento.service.js');
const opcional_estabelecimento_Service = require('../services/opcional_estabelecimento.service.js');
const redeSocial_estabelecimento_Service = require('../services/redeSocial_estabelecimento.service.js');
const musica_estabelecimento_Service = require('../services/musica_estabelecimento.service.js');
const horario_Service = require('../services/horario.service.js');
const recomendacao_Service = require('../services/recomendacao.service.js');
const comida_estabelecimento_Service = require('../services/comida_estabelecimento.service.js');

const extensaoImagem_Service = require('../services/utils/extensaoImagens.service.js');

router.get('/:id', async (req, res) => {
    let connection;
    try {
        connection = await transaction;
        if (req.params.id) {
            const dadosEstabelecimento = await estabelecimento_Service.pegarPorId(req.params.id, connection);
            const dadosCategoria = await categoria_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id, connection);
            const dadosCategoriaArray = dadosCategoria.map(categoria => categoria.nome);
            const dadosOpcionais = await opcional_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id, connection);
            const dadosOpcionaisArray = dadosOpcionais.map(opcional => opcional.nome);
            const dadosRedesSociais = await redeSocial_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id, connection);
            const dadosMusica = await musica_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id, connection);
            const dadosMusicaArray = dadosMusica.map(musica => musica.nome);
            const dadosHorarios = await horario_Service.pegarPorIdEstabelecimento(req.params.id, connection);
            const dadosRecomendacao = await recomendacao_Service.pegarPorIdEstabelecimento(req.params.id, connection);

            let tocaMusica = false;
            if (dadosOpcionaisArray) {
                for (let i=0; i < dadosOpcionaisArray.length ;i++) {
                    if (dadosOpcionaisArray[i] == 'Toca Música') {
                        tocaMusica = true;
                    }
                }
            }

            res.status(200).send({
                ...dadosEstabelecimento[0],
                dadosCategoriaArray,
                dadosOpcionaisArray,
                dadosRedesSociais,
                dadosMusicaArray,
                dadosHorarios,
                dadosRecomendacao,
                tocaMusica: tocaMusica
            });
        } else {
            res.status(404).send('Id de estabelecimento não encontrado!');
        }
    } catch (error) {
        console.error('Erro na rota GET /:id', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    } finally {
        if (connection) {
            try {
                connection.release();
            } catch (releaseError) {
                console.error('Erro ao liberar a conexão:', releaseError);
            }
        }
    }
});

router.post('/', async (req, res) => {
    let connection;
    try {
        connection = await transaction;
        const {
            idUsuario,
            nomeEstabelecimento,
            descricaoEstabelecimento,
            cnpj,
            estabelecimentoPhoto,
            estabelecimentoPhotoType,
            endereco,
            cep,
            numero,
            categoriasSelecionadas,
            recomendacao,
            opcoesSelecionadas,
            estilosSelecionadas,
            rdSocialSelecionadas,
            horariosSelecionados,
            tiposDeComidaSelecionados
        } = req.body;

        const removerCaracteresEspeciais = (str) => {
            const resultado = str.replace(/[\/\.\-]/g, '');
            return resultado;
        };

        const transformarBuffer = async (objetoBuffer) => {
            const valoresBuffer = Object.values(objetoBuffer);
            return Buffer.from(valoresBuffer);
        };

        const bufferImagemEstabelecimento = await transformarBuffer(estabelecimentoPhoto);
        const cnpjTratado = removerCaracteresEspeciais(cnpj);
        const dataDeHoje = new Date().toISOString().substring(0, 10);

        const extensaoImagem = extensaoImagem_Service.encontrarExtensaoImagem(estabelecimentoPhotoType);

        const dadosEstabelecimento = {
            nome: nomeEstabelecimento,
            cnpj: cnpjTratado,
            fotoPrincipal: `.${extensaoImagem}`,
            descricao: descricaoEstabelecimento,
            cep: cep,
            estado: endereco.uf,
            cidade: endereco.cidade,
            logradouro: endereco.rua,
            bairro: endereco.bairro,
            numero: numero,
            dataCadastro: dataDeHoje,
            dataUltimoAcesso: dataDeHoje
        }
        const dadosEstabelecimentoArray = Object.values(dadosEstabelecimento);

        const idEstabelecimento = await estabelecimento_Service.inserir(dadosEstabelecimentoArray, connection);
        await usuario_Service.inserirIdEstabelecimento([idEstabelecimento, idUsuario], connection);

        for (let i = 0; i < categoriasSelecionadas.length; i++) {
            try {
                await categoria_estabelecimento_Service.inserir([idEstabelecimento, categoriasSelecionadas[i].id], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
            }
        };

        fs.writeFile(`./../../../client/src/components/Estabelecimento/images/${idEstabelecimento}.${extensaoImagem}`, bufferImagemEstabelecimento, (err) => {
            if (err) {
              console.error('Erro ao salvar a imagem:', err);
            } else {
              console.log('Imagem salva com sucesso em:', `./src/images/estabelecimento/${idEstabelecimento}.${extensaoImagem}`);
            }
        });

        for (let i = 0; i < opcoesSelecionadas.length; i++) {
            try {
                await opcional_estabelecimento_Service.inserir([idEstabelecimento, opcoesSelecionadas[i].id], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir opcionais do estabelecimento: ${error.message}`);
            }
        };

        for (let i = 0; i < rdSocialSelecionadas.length; i++) {
            try {
                await redeSocial_estabelecimento_Service.inserir([idEstabelecimento, rdSocialSelecionadas[i].idRede, rdSocialSelecionadas[i].perfil], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir redes sociais do estabelecimento: ${error.message}`);
            }
        };

        for (let i = 0; i < estilosSelecionadas.length; i++) {
            try {
                await musica_estabelecimento_Service.inserir([idEstabelecimento, estilosSelecionadas[i].id], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir estilos musicais ao estabelecimento: ${error.message}`);
            }
        };

        for (let i = 0; i < horariosSelecionados.length; i++) {
            try {
                await horario_Service.inserir([idEstabelecimento, horariosSelecionados[i].dia, horariosSelecionados[i].abre, horariosSelecionados[i].fecha], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir horários do estabelecimento: ${error.message}`);
            }
        };

        for (let i = 0; i < tiposDeComidaSelecionados.length; i++) {
            try {
                await comida_estabelecimento_Service.inserir([idEstabelecimento, tiposDeComidaSelecionados[i].id], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir comidas do estabelecimento: ${error.message}`);
            }
        };

        // for (let i = 0; i < recomendacao.length; i++) {
        //     try {
        //         await recomendacao_Service.inserir([idEstabelecimento, recomendacao[i].name, recomendacao[i].description, recomendacao[i].photo], connection);
        //     } catch (error) {
        //         throw new Error(`Erro ao inserir recomendacao do estabelecimento: ${error.message}`);
        //     }
        // };

        await connection.commit();

        res.status(200).send({
            msg: 'Estabelecimento adicionado com sucesso!',
            tipoUsuario: 1,
            idEstabelecimento: idEstabelecimento
        });
    } catch (error) {
        console.error('Erro na rota POST /estabelecimento', error);
        if (connection) {
            try {
                await connection.rollback();
                console.error('POST/estabelecimento: rollback()');
            } catch (rollbackError) {
                console.error('Erro ao fazer rollback da transação:', rollbackError);
            }
        }
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a criação de estabelecimento.',
            error: error.message
        });
    } finally {
        if (connection) {
            try {
                connection.release();
            } catch (releaseError) {
                console.error('Erro ao liberar a conexão:', releaseError);
            }
        }
    }
});

router.put('/', async (req, res) => {
    try {
        const reqBody = req.body;

        res.status(200).send({
            msg: 'Dados do estabelecimento alterados com sucesso!'
        });
    } catch (error) {
        console.error('Erro na rota PUT: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

module.exports = router;