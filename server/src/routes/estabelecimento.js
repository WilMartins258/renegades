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
const distancia_Service = require('../services/utils/distancia.service.js');

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

        for (let i=0; i < contatosEstabelecimento.length ;i++) {
            contatosEstabelecimento[i].dia = contatosEstabelecimento[i].id;
            contatosEstabelecimento[i].numeroContato = contatosEstabelecimento[i].contato;
            contatosEstabelecimento[i].tipoContato = contatosEstabelecimento[i].nome;
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
            contatosSelecionados,
            latitude,
            longitude
        } = req.body;

        const removerCaracteresEspeciais = (str) => {
            const resultado = str.replace(/[\/\.\-]/g, '');
            return resultado ? resultado : '';
        };

        const cnpjTratado = removerCaracteresEspeciais(cnpj);
        const dataDeHoje = new Date().toISOString().substring(0, 10);

        let extensaoImagem = 'jpg';
        if (estabelecimentoPhotoType) {
            extensaoImagem = extensaoImagem_Service.encontrarExtensaoImagem(estabelecimentoPhotoType);
        }

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
            latitude: latitude,
            longitude: longitude,
            dataCadastro: dataDeHoje,
            dataUltimoAcesso: dataDeHoje
        }
        const dadosEstabelecimentoArray = Object.values(dadosEstabelecimento);

        const idEstabelecimento = await estabelecimento_Service.inserir(dadosEstabelecimentoArray, connection);
        await usuario_Service.inserirIdEstabelecimento([idEstabelecimento, idUsuario], connection);

        for (let i = 0; i < contatosSelecionados.length; i++) {
            try {
                await contato_estabelecimento_Service.inserir([idEstabelecimento, contatosSelecionados[i].id, contatosSelecionados[i].numeroContato, contatosSelecionados[i].isWhatsapp], connection);
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

        try {
            if (estabelecimentoPhoto) {
                const bufferImagemEstabelecimento = await buffer_Service.transformarBufferEmValido(estabelecimentoPhoto);

                fs.writeFile(`./../client/src/components/Estabelecimento/images/${idEstabelecimento}.${extensaoImagem}`, bufferImagemEstabelecimento, (err) => {
                    if (err) {
                    console.log('Erro ao gerar imagem do estabelecimento:', err);
                    }
                });
            }
        } catch (error) {
            console.log('Erro ao salvar imagem do estabelecimento: ', error);
        }

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
                if (recomendacao[i].type && recomendacao[i].photoBuffer) {
                    const extensaoRecomendacao = extensaoImagem_Service.encontrarExtensaoImagem(recomendacao[i].type);
                    const idRecomendacao = await recomendacao_Service.inserir([idEstabelecimento, recomendacao[i].name, recomendacao[i].description, extensaoRecomendacao], connection);

                    const bufferImagemRecomendacao = await buffer_Service.transformarBufferEmValido(recomendacao[i].photoBuffer);

                    fs.writeFile(`./../client/src/images/recomendacao/${idRecomendacao}.${extensaoRecomendacao}`, bufferImagemRecomendacao, (err) => {
                        if (err) {
                            console.error('Erro ao salvar imagem da recomendação:', err);
                        }
                    });
                } else {
                    await recomendacao_Service.inserir([idEstabelecimento, recomendacao[i].name, recomendacao[i].description, 'jpg'], connection);
                }
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
    console.log('PUT estabelecimento')
    let connection;
    try {
        connection = await transaction;
        const {
            nomeEstabelecimento,
            descricaoEstabelecimento,
            cnpj,
            cep,
            endereco,
            numero,
            recomendacao,
            fotoRecomendacao01Mudou,
            fotoRecomendacao02Mudou,
            fotoRecomendacao03Mudou,
            fotoEstabelecimentoMudou,
            estabelecimentoPhoto,
            estabelecimentoPhotoType,
            categoriasSelecionadas,
            categoriaSelecionadasOld,
            tiposDeComidaSelecionados,
            tiposDeComidaSelecionadosOld,
            opcoesSelecionadas,
            opcoesSelecionadasOld,
            estilosSelecionadas,
            estilosSelecionadasOld,
            listaRedesSociais,
            indicesRedesSociaisOld,
            listaContatos,
            listahorarios,
            idEstabelecimento
        } = req.body.novosDadosEstabelecimento;

        const removerCaracteresEspeciais = (str) => {
            return str.replace(/[^0-9]/g, '');
        };

        const compararListas = (original, editado) => {
            const opcoesRemovidas = original.filter(opcao => !editado.includes(opcao));
            const opcoesNovas = editado.filter(opcao => !original.includes(opcao));
        
            return {
                opcoesRemovidas,
                opcoesNovas
            };
        };

        const encontrarElementosRepetidos = (array1, array2) => {
            const unicosArray1 = [...new Set(array1)];
            const unicosArray2 = [...new Set(array2)];
            const repetidos = [];
          
            for (const elemento of unicosArray1) {
              if (unicosArray2.includes(elemento)) {
                repetidos.push(elemento);
              }
            }
          
            return repetidos;
        };

        const cnpjFormatado = removerCaracteresEspeciais(cnpj);

        const novosDadosEstabelecimento = {
            nome: nomeEstabelecimento,
            descricao: descricaoEstabelecimento,
            cnpj: cnpjFormatado,
            cep: cep,
            estado: endereco.uf,
            cidade: endereco.cidade,
            bairro: endereco.bairro,
            logradouro: endereco.rua,
            numero: numero,
            idEstabelecimento: idEstabelecimento
        }
        const novosDadosEstabelecimentoArray = Object.values(novosDadosEstabelecimento);

        // ESTABELECIMENTO
        try {
            await estabelecimento_Service.atualizar(novosDadosEstabelecimentoArray, connection)
        } catch (error) {
            console.log(error);
        }

        if (fotoEstabelecimentoMudou) {
            try {
                // Salva a nova foto do estabelecimento
                let extensaoImagem = '';
                if (estabelecimentoPhotoType) {
                    extensaoImagem = extensaoImagem_Service.encontrarExtensaoImagem(estabelecimentoPhotoType);
                }

                const bufferImagemEstabelecimento = await buffer_Service.transformarBufferEmValido(estabelecimentoPhoto);

                fs.writeFile(`./../client/src/components/Estabelecimento/images/${idEstabelecimento}.${extensaoImagem}`, bufferImagemEstabelecimento, (err) => {
                    if (err) {
                    console.error('Erro ao salvar imagem do estabelecimento:', err);
                    }
                });

                await estabelecimento_Service.atualizarFormatoDeImagem([extensaoImagem, idEstabelecimento], connection)
            } catch (error) {
                console.log('Erro ao atualizar imagem do estabelecimento');
            }
        }

        // RECOMENDAÇÕES

        

        console.log('recomendacao:: ', recomendacao);

        const recomendacoesOld = await recomendacao_Service.pegarPorIdEstabelecimento(idEstabelecimento)

        // console.log('recomendacoesOld:: ', recomendacoesOld);


        const recomendacoesEstabelecimento = recomendacao.map(recomendacao => recomendacao.id ? recomendacao.id : 0);

        const recomendacoesEstabelecimentoOld = recomendacoesOld.map(recomendacao => recomendacao.id ? recomendacao.id : 0);

        console.log('recomendacoesEstabelecimento:: ', recomendacoesEstabelecimento);
        console.log('recomendacoesEstabelecimentoOld:: ', recomendacoesEstabelecimentoOld);

        const resultadoRecomendacoes = compararListas(recomendacoesEstabelecimentoOld, recomendacoesEstabelecimento);

        console.log('resultadoRecomendacoes:: ', resultadoRecomendacoes);

        // Remover promoções
        try {
            for (let i = 0; i < resultadoRecomendacoes.opcoesRemovidas.length ; i++) {
                let formatoRecomendacao = '';
                for (let x = 0; x < recomendacoesOld.length ; x++) {
                    if (resultadoRecomendacoes.opcoesRemovidas[i] === recomendacoesOld[x].id) {
                        formatoRecomendacao = recomendacoesOld[x].formatoFoto;
                    }
                }

                // await recomendacao_Service.excluir(resultadoRecomendacoes.opcoesRemovidas[i], connection);         

                const caminhoFotoRecomendacao = `./../client/src/images/recomendacao/${resultadoRecomendacoes.opcoesRemovidas[i]}.${formatoRecomendacao}`;

                try {
                    // fs.unlink(caminhoFotoRecomendacao, (err) => {
                    //     if (err) {
                    //         console.error(`Erro ao remover o arquivo: ${err}`);
                    //     }
                    // });
                } catch (error) {}
            }
        } catch (error) {
            console.log(error);
        }


        const recomendacoesParaAtualizar = encontrarElementosRepetidos(recomendacoesEstabelecimento, recomendacoesEstabelecimentoOld);

        console.log('recomendacoesParaAtualizar:: ', recomendacoesParaAtualizar);

        // Atualizar recomendações que permaneceram
        try {
            for (let i = 0; i < recomendacoesParaAtualizar.length ; i++) {
                for (let x = 0; x < recomendacao.length ; x++) {
                    if (recomendacoesParaAtualizar[i] === recomendacao[x].id) {
                        const novosDadosRecomendacao = {
                            nome: recomendacao[x].name,
                            descricao: recomendacao[x].description,
                            id: recomendacao[x].id
                        }
                        const novosDadosRecomendacaoArray = Object.values(novosDadosRecomendacao);

                        await recomendacao_Service.atualizar(novosDadosRecomendacaoArray, connection);
                        
                        if (recomendacao[x].photoBuffer) {
                            const extensaoImagem = extensaoImagem_Service.encontrarExtensaoImagem(recomendacao[x].type);

                            const caminhoFotoRecomendacao = `./../client/src/images/recomendacao/${recomendacao[x].id}.${extensaoImagem}`;

                            try {
                                const bufferImagemRecomendacao = await buffer_Service.transformarBufferEmValido(recomendacao[x].photoBuffer);

                                fs.writeFile(caminhoFotoRecomendacao, bufferImagemRecomendacao, (err) => {
                                    if (err) {
                                        console.error('Erro ao atualizar imagem da recomendação:', err);
                                    }
                                });

                                await recomendacao_Service.atualizarFormatoDeFoto([extensaoImagem, recomendacao[x].id], connection);

                            } catch (error) {}
                        }
                    }
                }
            }
        } catch (error) {
            console.log(error);
        }

        /*
        As removidas eu tenho que remover conforme o exemplo acima (removendo tanto os dados quanto a imagem)
        AS que permaneceram tem que ter seus dados atualizados SEMPRE e caso a imagem atualizou ela deve ser atualizada também
        AS inseridas devem ser salvas no banco e devem ter o id salvo utilizado para dar o nome do arquivo (também devo checar se as novas tem foto, senão tiverem colocar foto padrão)
        */

        console.log('fotoRecomendacao01Mudou:: ', fotoRecomendacao01Mudou);
        console.log('fotoRecomendacao02Mudou:: ', fotoRecomendacao02Mudou);
        console.log('fotoRecomendacao03Mudou:: ', fotoRecomendacao03Mudou);

        // CATEGORIAS
        const categoriasEstabelecimento = categoriasSelecionadas.map(categoria => categoria.id);
        const categoriasEstabelecimentoOld = categoriaSelecionadasOld.map(categoria => categoria.id);

        const resultadoCategorias = compararListas(categoriasEstabelecimentoOld, categoriasEstabelecimento);

        try {
            for (let i = 0; i < resultadoCategorias.opcoesNovas.length ; i++) {
                await categoria_estabelecimento_Service.inserir([idEstabelecimento, resultadoCategorias.opcoesNovas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }

        try {
            for (let i = 0; i < resultadoCategorias.opcoesRemovidas.length ; i++) {
                await categoria_estabelecimento_Service.excluir([idEstabelecimento, resultadoCategorias.opcoesRemovidas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }


        // COMIDAS
        const comidasEstabelecimento = tiposDeComidaSelecionados.map(comida => comida.id);
        const comidasEstabelecimentoOld = tiposDeComidaSelecionadosOld.map(comida => comida.id);

        const resultadoComidas = compararListas(comidasEstabelecimentoOld, comidasEstabelecimento);

        try {
            for (let i = 0; i < resultadoComidas.opcoesNovas.length ; i++) {
                await comida_estabelecimento_Service.inserir([idEstabelecimento, resultadoComidas.opcoesNovas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }

        try {
            for (let i = 0; i < resultadoComidas.opcoesRemovidas.length ; i++) {
                await comida_estabelecimento_Service.excluir([idEstabelecimento, resultadoComidas.opcoesRemovidas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }


        // OPCIONAIS
        const opcionaisEstabelecimento = opcoesSelecionadas.map(opcao => opcao.id);
        const opcionaisEstabelecimentoOld = opcoesSelecionadasOld.map(opcao => opcao.id);

        const resultadoOpcionais = compararListas(opcionaisEstabelecimentoOld, opcionaisEstabelecimento);

        try {
            for (let i = 0; i < resultadoOpcionais.opcoesNovas.length ; i++) {
                await opcional_estabelecimento_Service.inserir([idEstabelecimento, resultadoOpcionais.opcoesNovas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }

        try {
            for (let i = 0; i < resultadoOpcionais.opcoesRemovidas.length ; i++) {
                await opcional_estabelecimento_Service.excluir([idEstabelecimento, resultadoOpcionais.opcoesRemovidas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }


        // MUSICAS
        const musicasEstabelecimento = estilosSelecionadas.map(comida => comida.id);
        const musicasEstabelecimentoOld = estilosSelecionadasOld.map(comida => comida.id);

        const resultadoMusicas = compararListas(musicasEstabelecimentoOld, musicasEstabelecimento);

        try {
            for (let i = 0; i < resultadoMusicas.opcoesNovas.length ; i++) {
                await musica_estabelecimento_Service.inserir([idEstabelecimento, resultadoMusicas.opcoesNovas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }

        try {
            for (let i = 0; i < resultadoMusicas.opcoesRemovidas.length ; i++) {
                await musica_estabelecimento_Service.excluir([idEstabelecimento, resultadoMusicas.opcoesRemovidas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }


        // REDES SOCIAIS
        // Quando uma nova rede é adicionada ela manda um idRede e não um id, uma vez que não há id para ser exibido já que nunca passou pelo banco de dados.
        const redesSociaisEstabelecimento = listaRedesSociais.map(redeSocial => redeSocial.id ? redeSocial.id : parseInt(redeSocial.idRede, 10));

        const resultadoRedesSociais = compararListas(indicesRedesSociaisOld, redesSociaisEstabelecimento);

        // Excluindo redes que foram removidas do array
        try {
            for (let i = 0; i < resultadoRedesSociais.opcoesRemovidas.length ; i++) {
                await redeSocial_estabelecimento_Service.excluir([idEstabelecimento, resultadoRedesSociais.opcoesRemovidas[i]], connection);
            }
        } catch (error) {
            console.log(error);
        }

        // Adicionando redes que foram adicionadas ao array
        try {
            for (let i = 0; i < resultadoRedesSociais.opcoesNovas.length ; i++) {
                for (let x = 0; x < listaRedesSociais.length ; x++) {
                    if ( resultadoRedesSociais.opcoesNovas[i] = listaRedesSociais[x]?.idRede ) {
                        await redeSocial_estabelecimento_Service.inserir([idEstabelecimento, listaRedesSociais[x]?.idRede, listaRedesSociais[x]?.perfil], connection);
                    }
                }
            }
        } catch (error) {
            console.log(error);
        }

        const redesSociaisParaAtualizar = encontrarElementosRepetidos(indicesRedesSociaisOld, redesSociaisEstabelecimento);

        // Atualizando redes que já existiam e continuaram existindo dentro do array
        try {
            for (let i = 0; i < redesSociaisParaAtualizar.length ; i++) {
                for (let x = 0; x < listaRedesSociais.length ; x++) {
                    if ( redesSociaisParaAtualizar[i] === listaRedesSociais[x]?.id ) {
                        await redeSocial_estabelecimento_Service.atualizar([listaRedesSociais[x].perfil, idEstabelecimento, listaRedesSociais[x].id], connection);
                    } else if ( redesSociaisParaAtualizar[i] == listaRedesSociais[x]?.idRede ) {
                        await redeSocial_estabelecimento_Service.atualizar([listaRedesSociais[x].perfil, idEstabelecimento, listaRedesSociais[x].idRede], connection);
                    }
                }
            }
        } catch (error) {
            console.log(error);
        }


        // CONTATOS
        for (let i = 0; i < listaContatos.length; i++) {
            listaContatos[i].numeroContato = removerCaracteresEspeciais(listaContatos[i].numeroContato);
        }   

        try {
            await contato_estabelecimento_Service.excluirTudoPorIdEstabelecimento(idEstabelecimento, connection);
        } catch (error) {
            console.log(error);
        }

        try {
            for (let i = 0; i < listaContatos.length; i++) {
                await contato_estabelecimento_Service.inserir([idEstabelecimento, listaContatos[i].idContato, listaContatos[i].numeroContato, listaContatos[i].isWhatsapp], connection);
            }
        } catch (error) {
            console.log(error);
        }

        // HORÁRIOS
        try {
            await horario_Service.excluirTudoPorIdEstabelecimento(idEstabelecimento, connection);
        } catch (error) {
            console.log(error);
        }

        try {
            for (let i = 0; i < listahorarios.length; i++) {
                await horario_Service.inserir([idEstabelecimento, listahorarios[i].dia, listahorarios[i].abre, listahorarios[i].fecha], connection);
            }
        } catch (error) {
            console.log(error);
        }

        await connection.commit();
        res.status(200).send({
            msg: 'Dados do estabelecimento alterados com sucesso!'
        });
    } catch (error) {
        console.log('Erro na rota PUT: ', error);
        if (connection) {
            try {
                await connection.rollback();
                console.error('PUT/estabelecimento: rollback()');
            } catch (rollbackError) {
                console.error('Erro ao fazer rollback da transação:', rollbackError);
            }
        }
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

router.get('/semLocalizacao', async (req, res) => {
    try {
        console.log('/semLocalizacao');

        const estabelecimentos = await distancia_Service.procurarEstabelecimentosSemCoordenadas();

        console.log('/estabelecimentos:: ', estabelecimentos);

        
        res.status(200).send();
    } catch (error) {
        res.status(500).send({
            errorMsg: 'Erro ao buscar estabelecimentos sem localização.',
            msg: error.message,
            error: error
        }); 
    }
});

module.exports = router;