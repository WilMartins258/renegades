<template>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <div class="container">
        <div class="search-container">
            <input
                type="text"
                v-model="filtroNomeEstabelecimento"
                placeholder="Entre com o nome do estabelecimento"
            />
            <button @click="filtrarPorNome"><i class="uil uil-search search-icon"></i></button>
        </div>

        <div class="filters-container">
      <!-- Categoria Filter -->
      <div class="filter-container">
        <button class="categoria-button" @click="toggleFilter('categoria')">Categoria</button>
        <div
          v-if="activeFilter === 'categoria'"
          class="filter-submenu quadro-Opcionais"
        >
           <button
            :class="{ botao: true, selecionado: isCategoriaSelecionada('Todos') }"
            @click="selecionarCategoria('Todos')"
          >
            Remover Filtros
          </button>
          <button
            v-for="categoria in categorias"
            :key="categoria"
            :class="{ botao: true, selecionado: isCategoriaSelecionada(categoria) }"
            @click="selecionarCategoria(categoria)"
          >
            {{ categoria }}
          </button>
        </div>
      </div>

      <div class="ticket" v-for="cupom in cuponsFiltrados" :key="cupom.codigo">
        <div class="ticket-left">
            <div class="cut-line-left"></div>
            <p class="text-code">Código:</p><br>
            <p class="code">{{cupom.codigo}}</p>
            <div class="cut-line-left"></div>
        </div>
        <div class= "ticket-right">
            <div class="cut-line"></div>
            <p class="name">{{cupom.nome}}</p><br>
            <p class="category">{{ cupom.categoria.join(', ') }}</p>
            <p class="description">{{ cupom.descricao }}</p><br>
            <p class="icon"> <i class="	fas fa-calendar-alt"></i>Promoção Ativa: de {{ cupom.dataInicio }} a {{ cupom.dataFim }}</p><br>
            <p><i class="fas fa-map-marker-alt"></i> {{ cupom.endereco }}</p>
            <router-link :to="'/paginaestabelecimento/' + cupom.idEstabelecimento">
              <button class="page">Acessar a Página</button>
            </router-link>
            <div class="cut-line"></div>
        </div>
    </div>
    </div>
    </div>
</template>

<script>
import api from './../../services/backend.service.js';
import dataFormat from './../../services/dataToDiaMesAno.service';

    export default {
        name: "CuponsAtivos",
        data(){
            return{
                codigo: "",
                nome: "",
                categoria: [],
                descricao: "",
                dataInicio: "",
                dataFim: "",
                endereco: "",
                cupons: [],
                filtroCategoria: [],
                categoriasSelecionadas: [], // controla o array de categorias selecionados
                activeFilter: null,
                filtroNomeEstabelecimento: "",
            }
        },
        async created() {
            try {
                const promocoesRequest = await api.get('/promocao/usuario');

                if (promocoesRequest.data.promocoesAtivas) {
                    const promocoes = promocoesRequest.data.promocoesAtivas;
                    for (let i=0; i < promocoes.length ; i++) {
                        promocoes[i].dataInicio = dataFormat(promocoes[i].dataInicio);
                        promocoes[i].dataFim = dataFormat(promocoes[i].dataFim);
                    };
                    console.log('promocoes:: ', promocoes)
                    this.cupons = promocoes;
                }

                if (promocoesRequest.data.categorias) {
                    const categoriasArray = promocoesRequest.data.categorias.map(objeto => objeto.nome);
                    this.categoria = categoriasArray;
                }
            } catch (error) {
                console.log('Erro ao buscar promoções: ', error);
            }
        },
        methods: {
            selecionarCategoria(categoria) {
                if (categoria === 'Todos') {
                    this.filtroCategoria = [];
                } else {
                    if (this.filtroCategoria.length < 3 || this.filtroCategoria.includes(categoria)) {
                        const index = this.filtroCategoria.indexOf(categoria);
                        if (index === -1) {
                            this.filtroCategoria.push(categoria);
                        } else {
                            this.filtroCategoria.splice(index, 1);
                        }
                    }
                }
            },

            isCategoriaSelecionada(categoria) {
                return this.filtroCategoria.includes(categoria) && this.filtroCategoria.length <= 3;
            },


            toggleFilter(filterName) {
                if (this.activeFilter === filterName) {
                    this.activeFilter = null; // Desativa o filtro se ele já estiver ativo
                } else {
                    this.activeFilter = filterName; // Ativa o filtro correspondente
                }
            },
            filtrarPorNome() {
              const nomeFiltrado = this.filtroNomeEstabelecimento.toLowerCase().trim();

              this.cupons = this.cupons.filter((cupom) => {
                  const nomeValido = cupom.nome.toLowerCase().includes(nomeFiltrado);
                  
                  if (this.filtroCategoria.includes('Todos')) {
                      return nomeValido; // Se 'Todos' estiver selecionado, não aplicamos filtro de categoria.
                  }
                  
                  // Verificamos se todas as categorias do cupom estão incluídas nas categorias selecionadas.
                  const categoriasValidas = cupom.categoria.every(cat => this.filtroCategoria.includes(cat));

                  return nomeValido && categoriasValidas;
              });
          },

        },
        computed: {
          cuponsFiltrados() {
              const nomeFiltrado = this.filtroNomeEstabelecimento.toLowerCase().trim();
              return this.cupons.filter((cupom) => {
                  // Check if cupom and cupom.nome are defined before using toLowerCase()
                  return (
                      (!cupom || !cupom.nome || cupom.nome.toLowerCase().includes(nomeFiltrado)) &&
                      (this.filtroCategoria.length === 0 || this.filtroCategoria.some(cat => cupom.categoria.includes(cat)))
                  );
              });
          },
      },
};
</script>
<style scoped>

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.filters-container {
    display: flex;
    flex-direction: column; /* Alterado para column */
    align-items: center; /* Centraliza horizontalmente */
    gap: 15px; 
    margin-bottom: 20px; 
  }
  
  .categoria-button {
  width: 100px; /* Ajuste a largura máxima conforme necessário */
}
  .filters-container button {
    margin: 10 20px;
    border-radius: 20px;
    display:block;
    border:none;
    padding:5px 20px;
    background:#e91e2f;
    cursor: pointer;
    transition: 0.5s;
    color: #fff;
  }

  .filters-container button:hover{
      background:#ff9800;     
  }
  
  .filter-container input[type="text"]  {
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 25px;
  width: 150px; /* Defina a largura desejada */
  margin-right: 20px;
  background: rgba(211, 201, 201, 0.89);
}

.distance-input-container p{
  font-size: 12px;
}

  .quadro-Opcionais {
    border: 2px solid white;
    padding: 20px;
    width: 550px;
    text-align: center;
    margin: 0 auto;
    background-color: rgba(255, 255, 255, 0.418); 
  }

  .filter-submenu {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 10px;
  margin-top: 10px;
}

.filter-submenu button:hover {
  background: #ff9800;
}

.botao.selecionado {
  background-color: orange;
}

  .filter-submenu p {
    font-weight: bold;
  }
  
  
  .search-container {
  display: flex;
  justify-content: center; /* Centraliza horizontalmente */
  align-items: center; /* Centraliza verticalmente */
  margin-bottom: 20px;
}

.search-container input[type="text"] {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 25px;
  width: 350px; /* Defina a largura desejada */
  margin-right: 10px;
  background: rgba(211, 201, 201, 0.89);
}

.search-container button {
  padding: 10px 20px;
  background-color: #e91e2f;
  color: #fff;
  border: none;
  border-radius: 25px;
  cursor: pointer;
  transition: background-color 0.5s;
}

.search-container button:hover {
  background-color: #ff9800;
}
.ticket {
            width: 700px;
            background: #fff;
            border-radius: 25px;
            padding: 20px;
            display: flex;
            position: relative;
            -webkit-mask-image: radial-gradient(circle at 10px, transparent 10px, red 10.5px), radial-gradient(circle at 31px 31px, red 31px, transparent 31.5px);
            -webkit-mask-position: -10px, -31px -31px;
            -webkit-mask-size: 100% 40px, 100%;
            -webkit-mask-composite: source-out, destination-over;
            mask-composite: subtract, add;
            margin-bottom: 20px; 
        }

        .ticket-left {
            border-right: 1px dashed #ccc;
            padding-right: 10px;
            position: relative;
        }

        .ticket-right {
            padding-left: 10px;
            position: relative;
        }

        .text-code {
            font-size: 20px;
            margin-top: 20px;
            
        }

        .code{
            font-weight: bold;
            text-transform: uppercase;
        }

        .name {
            font-size: 1.5em;
        }

        .category {
            color: #777;
        }

        .description {
            margin-top: 10px;
        }

        .icon {
            font-size: 1.2em;
            margin-right: 5px;
        }

        .page {
            margin-top: 10px;
            color: #fff;
            padding: 6px 14px;
            float: right;
            margin-top: 10px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            background: #e91e2f;
            border-radius: 25px;
        }

        .page:hover {
            background: #ff9800;
        }

        .cut-line {
            width: 30px;
            height: 20px;
            background: rgb(190, 185, 185);
            border-radius: 25px 25px 0 0;
            position: absolute;
            bottom: -20px;
            left: -15px;
        }

        .cut-line-left {
            width: 30px;
            height: 20px;
            background: rgb(190, 185, 185);
            border-radius: 0 0 25px 25px;
            position: absolute;
            top: -20px;
            right: -15px;
        }


</style>