const express = require('express');
const router = express.Router();
const fs = require('fs');

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
const contato_estabelecimento_Service = require('../services/contato_estabelecimento.service.js');
const avaliacao_Service = require('../services/avaliacao.service.js');

const extensaoImagem_Service = require('../services/utils/extensaoImagens.service.js');
const buffer_Service = require('../services/utils/buffer.service.js');

const categoria_Service = require('../services/categoria.service.js');
const opcional_Service = require('../services/opcional.service.js');
const comida_Service = require('../services/comida.service.js');
const estiloMusica_Service = require('../services/estiloMusica.service.js');

router.get('/validacao', async (req, res) => {
    try {
        const estabelecimentos = await estabelecimento_Service.pegarParaValidacao();

        res.status(200).send(estabelecimentos);
    } catch (error) {
        console.error('Erro na rota GET /validacao', error);
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos para validação',
            error: error.message
        });
    }
});

router.get('/carousel', async (req, res) => {
    try {
        const estabelecimentosCarousel = await estabelecimento_Service.carousel();

        res.status(200).send(estabelecimentosCarousel);  
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos para o carousel.',
            error: error.message
        });
    }
});

router.get('/filtro', async (req, res) => {
    try {
        const estabelecimentos = await estabelecimento_Service.filtros();
        const categorias = await categoria_Service.pegarTudo();
        const opcionais = await opcional_Service.pegarTudo();
        const comidas = await comida_Service.pegarTudo();

        try {
            for (let i=0; i < estabelecimentos.length; i++) {
                if (estabelecimentos[i].categoriasString) {
                    estabelecimentos[i].categoria = estabelecimentos[i].categoriasString.split(',').map(item => item.trim());
                } else {
                    estabelecimentos[i].categoria = [null];
                }

                if (estabelecimentos[i].opcionaisString) {
                    estabelecimentos[i].opcionais = estabelecimentos[i].opcionaisString.split(',').map(item => item.trim());
                } else {
                    estabelecimentos[i].opcionais = [null];
                }

                if (estabelecimentos[i].comidasString) {
                    estabelecimentos[i].comidas = estabelecimentos[i].comidasString.split(',').map(item => item.trim());
                } else {
                    estabelecimentos[i].comidas = [null];
                }
            };
        } catch (error) {
            console.log('Erro ao tratar componentes do estabelecimento: ', error);
        }

        res.status(200).send({
            estabelecimentos,
            categorias,
            opcionais,
            comidas
        });  
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos para os filtros.',
            error: error.message
        });
    }
});

router.get('/:id', async (req, res) => {
    let connection;
    try {
        connection = await transaction;
        if (req.params.id) {
            const dadosEstabelecimento = await estabelecimento_Service.pegarPorId(req.params.id);
            const dadosCategoria = await categoria_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosCategoriaArray = dadosCategoria.map(categoria => categoria.nome);
            const dadosOpcionais = await opcional_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosOpcionaisArray = dadosOpcionais.map(opcional => opcional.nome);
            const dadosRedesSociais = await redeSocial_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosMusica = await musica_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosMusicaArray = dadosMusica.map(musica => musica.nome);
            const dadosHorarios = await horario_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosRecomendacao = await recomendacao_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosAvaliacao = await avaliacao_Service.pegarPorIdEstabelecimento(req.params.id);
            const dadosContatos = await contato_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);

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
                tocaMusica: tocaMusica,
                dadosAvaliacao,
                dadosContatos
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

router.get('/meuEstabelecimento/:id', async (req, res) => {
    try {
        const categorias = await categoria_Service.pegarTudo();
        const opcionais = await opcional_Service.pegarTudo();
        const estilosMusica = await estiloMusica_Service.pegarTudo();
        const comidas = await comida_Service.pegarTudo();
        const dadosEstabelecimento = await estabelecimento_Service.pegarPorId(req.params.id);
        const opcionaisEstabelecimento = await opcional_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
        const categoriasEstabelecimento = await categoria_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
        const redeSociaisEstabelecimento = await redeSocial_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
        const musicasEstabelecimento = await musica_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
        const horariosEstabelecimento = await horario_Service.pegarPorIdEstabelecimento(req.params.id);
        const recomendacoesEstabelecimento = await recomendacao_Service.pegarPorIdEstabelecimento(req.params.id);
        const comidasEstabelecimento = await comida_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
        const contatosEstabelecimento = await contato_estabelecimento_Service.pegarPorIdEstabelecimento(req.params.id);
        const avaliacao = await avaliacao_Service.pegarPorIdEstabelecimento(req.params.id);

        for (let i=0; i < recomendacoesEstabelecimento.length ;i++) {
            recomendacoesEstabelecimento[i].name = recomendacoesEstabelecimento[i].nome;
            recomendacoesEstabelecimento[i].description = recomendacoesEstabelecimento[i].descricao;
        };

        for (let i=0; i < redeSociaisEstabelecimento.length ;i++) {
            redeSociaisEstabelecimento[i].perfil = redeSociaisEstabelecimento[i].redeSocial;
            redeSociaisEstabelecimento[i].redeSocial = redeSociaisEstabelecimento[i].nome;
        };

        for (let i=0; i < horariosEstabelecimento.length ;i++) {
            horariosEstabelecimento[i].dia = horariosEstabelecimento[i].id;
            horariosEstabelecimento[i].abre = horariosEstabelecimento[i].horarioInicio;
            horariosEstabelecimento[i].fecha = horariosEstabelecimento[i].horarioFim;
        };

       res.status(200).send({
        ...dadosEstabelecimento[0],
        categorias,
        opcionais,
        estilosMusica,
        comidas,
        opcionaisEstabelecimento,
        categoriasEstabelecimento,
        redeSociaisEstabelecimento,
        musicasEstabelecimento,
        horariosEstabelecimento,
        recomendacoesEstabelecimento,
        comidasEstabelecimento,
        contatosEstabelecimento,
        avaliacao
       }); 
    } catch (error) {
        console.log('Erro ao buscar dados do estabelecimento para a página de atualização de dados: ', error);
        res.status(500).send({
            errorMsg: 'Erro ao buscar dados do estabelecimento para a página de atualização de dados.',
            msg: 'Erro ao buscar dados do estabelecimento para a página de atualização de dados.',
            error: error.message
        });
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
            tiposDeComidaSelecionados,
            contatosSelecionados
        } = req.body;

        const removerCaracteresEspeciais = (str) => {
            const resultado = str.replace(/[\/\.\-]/g, '');
            return resultado;
        };

        const bufferImagemEstabelecimento = await buffer_Service.transformarBufferEmValido(estabelecimentoPhoto);
        const cnpjTratado = removerCaracteresEspeciais(cnpj);
        const dataDeHoje = new Date().toISOString().substring(0, 10);

        const extensaoImagem = extensaoImagem_Service.encontrarExtensaoImagem(estabelecimentoPhotoType);

        const dadosEstabelecimento = {
            nome: nomeEstabelecimento,
            cnpj: cnpjTratado,
            fotoPrincipal: `${extensaoImagem}`,
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

        for (let i = 0; i < contatosSelecionados.length; i++) {
            try {
                await contato_estabelecimento_Service.inserir([idEstabelecimento, contatosSelecionados[i].id, contatosSelecionados[i].numero, contatosSelecionados[i].isWhatsapp], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir contatos do estabelecimento: ${error.message}`);
            }
        };

        for (let i = 0; i < categoriasSelecionadas.length; i++) {
            try {
                await categoria_estabelecimento_Service.inserir([idEstabelecimento, categoriasSelecionadas[i].id], connection);
            } catch (error) {
                throw new Error(`Erro ao inserir categoria do estabelecimento: ${error.message}`);
            }
        };

        fs.writeFile(`./../client/src/components/Estabelecimento/images/${idEstabelecimento}.${extensaoImagem}`, bufferImagemEstabelecimento, (err) => {
            if (err) {
              console.error('Erro ao salvar imagem do estabelecimento:', err);
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

        for (let i = 0; i < recomendacao.length; i++) {
            try {
                const extensaoRecomendacao = extensaoImagem_Service.encontrarExtensaoImagem(recomendacao[i].type);
                const idRecomendacao = await recomendacao_Service.inserir([idEstabelecimento, recomendacao[i].name, recomendacao[i].description, extensaoRecomendacao], connection);

                const bufferImagemRecomendacao = await buffer_Service.transformarBufferEmValido(recomendacao[i].photoBuffer);

                fs.writeFile(`./../client/src/images/recomendacao/${idRecomendacao}.${extensaoRecomendacao}`, bufferImagemRecomendacao, (err) => {
                    if (err) {
                        console.error('Erro ao salvar imagem da recomendação:', err);
                    }
                });
            } catch (error) {
                throw new Error(`Erro ao inserir recomendacao do estabelecimento: ${error.message}`);
            }
        };

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
        console.log('Erro na rota PUT: ', error);
        res.status(500).send({
            errorMsg: 'Ocorreu um erro ao processar a solicitação.',
            error: error.message
        });
    }
});

router.put('/status', async (req, res) => {
    try {
        const { novoStatus, id } = req.body;

        const dadosEstabelecimento = {
            novoStatus: novoStatus,
            id: id
        }
        const dadosEstabelecimentoArray = Object.values(dadosEstabelecimento);

        const atualizarEstabelecimento = await estabelecimento_Service.atualizarStatus(dadosEstabelecimentoArray);

        res.status(200).send({atualizarEstabelecimento});
    } catch (error) {
        console.log('Erro ao atualizar status do estabelecimento: ', error);
        res.status(500).send({
            errorMsg: 'Erro ao atualizar status do estabelecimento.',
            msg: error.message,
            error: error
        });
    }
});

module.exports = router;