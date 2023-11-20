<template>
  <div>
    <div class="search-container">
      <input
        type="text"
        v-model="filtroNomeEstabelecimento"
        placeholder="Entre com o nome do estabelecimento"
      />
      <button @click="filtrarPorNome"> <i class="uil uil-search search-icon"></i></button>
    </div>
    <!-- Conteiner externo para botões e quadros de submenu -->
    <div class="filters-container">
      <!-- Categoria Filter -->
      <div class="filter-container">
        <button @click="toggleFilter('categoria')">Categoria</button>
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

<!-- Opcionais Filter -->
<div class="filter-container">
  <button @click="toggleFilter('opcionais')">Opcionais</button>
  <div
    v-if="activeFilter === 'opcionais'"
    class="filter-submenu quadro-Opcionais"
  >
    <button
      :class="{ botao: true, selecionado: isOpcionalSelecionado('Todos') }"
      @click="selecionarOpcional('Todos')"
    >
      Remover Filtros
    </button>
    <button
      v-for="opcional in opcionais"
      :key="opcional"
      :class="{ botao: true, selecionado: isOpcionalSelecionado(opcional) }"
      @click="selecionarOpcional(opcional)"
    >
      {{ opcional }}
    </button>
  </div>
</div>

     <!-- Comida Filter -->
<div class="filter-container">
  <button @click="toggleFilter('comida')">Comida</button>
  <div
    v-if="activeFilter === 'comida'"
    class="filter-submenu quadro-Opcionais"
  >
    <button
      :class="{ botao: true, selecionado: isComidaSelecionada('Todos') }"
      @click="selecionarComida('Todos')"
    >
      Remover Filtros
    </button>
    <button
      v-for="comida in comidas"
      :key="comida"
      :class="{ botao: true, selecionado: isComidaSelecionada(comida) }"
      @click="selecionarComida(comida)"
    >
      {{ comida }}
    </button>
  </div>
</div>

    <!-- Distância Filter -->
  <div class="filter-container">
  <button @click="toggleFilter('distancia')">Distância</button>
  <div
    v-if="activeFilter === 'distancia'"
    class="filter-submenu quadro-Opcionais">
    <div class="search-container">
  <input
    type="text"
    v-model="endereco"
    input
    placeholder="Digite o CEP"
    maxlength="8"
  />
  <button @click="buscarCep"> <i class="uil uil-search search-icon"></i></button><br>

</div>
    <div class="endereco-validado-container">
      <p v-if="enderecoValidado.length>0">Sua localização é: {{enderecoValidado}}</p>
    </div>

    <input type="range" v-model="filtroDistancia" min="0" max="10" step="1"/>
    <p>Distância: {{ filtroDistancia }} {{ filtroDistancia ? 'km' : '' }}</p>
    <br />
    <button @click="limparFiltroDistancia">Remover Filtro</button>
<div class="distance-input-container">
    <input
    type="text"
    v-model="filtroDistanciaText"
    @input="validarDistancia"
    placeholder="Digite a distância"
  />
  <p>Limite max. 10 km</p>  
    </div><br>
  <div>
  <button @click="aplicarFiltroDistanciaText">Filtrar</button>
</div>
  </div>
</div>



  </div>
  <div class="Centraliza">
      <div class="cards">
        <a
        v-for="estabelecimento in filteredEstabelecimentos"
          :key="estabelecimento.id"
          :href="getEstabelecimentoLink(estabelecimento)"
          class="card-container"
        >
          <div class="card">
            <img
              :src="estabelecimento.foto"
              alt="Foto do estabelecimento"
              class="card-image"
            />
            <h3>{{ estabelecimento.nome }}</h3>
            <p class="description">{{ estabelecimento.categoria?.join(', ') }}</p>
            <span v-if="showDistance" class="distance">{{ (estabelecimento.distancia)?.toFixed(1) }} km</span>
          </div>
          
        </a>
      </div>
      <!-- Botão "Exibir Mais" -->
      <br><br> <div><button @click="exibirMaisCards" v-if="cardsExibidos < estabelecimentos.length">Exibir Mais</button></div>
    </div>
</div>
</template>

<script>
import api from "./../../../services/backend.service.js";
import distance_Service from "./../../../services/distance.service.js";
import axios from "axios";

export default {
  name: "Filtro",
  data() {
    return {
      estabelecimentos: [],
    filtroCategoria: null,
    filtroOpcionais: [], // Inicialize como uma array vazia
    filtroComida: null, 
    activeFilter: null,
    categorias: [],
    opcionais: [],
    comidas: [],
    filtroDistancia: 0,
    filtroDistanciaText: "",
    filtroNomeEstabelecimento: "",
    categoriasSelecionadas: [], // controla o array de categorias selecionados
    cardsPorPagina: 10, // Quantidade de cards por página
    cardsExibidos: 10, // controla a quantidade de cards já exibidos
    enderecoValidado:"",
    showDistance: false
    };
  },
  computed: {
    filteredEstabelecimentos() {
  let filtered = this.estabelecimentos;

    if (this.categoriasSelecionadas.length > 0) {
    filtered = filtered.filter((estabelecimento) =>
      this.categoriasSelecionadas.some((categoria) =>
        estabelecimento.categoria.includes(categoria)
      )
    );
  }

  if (this.filtroOpcionais.length > 0) {
    filtered = filtered.filter((estabelecimento) =>
      this.filtroOpcionais.every((opcional) =>
        estabelecimento.opcionais.includes(opcional)
      )
    );
  }

  if (this.filtroComida) {
    filtered = filtered.filter((estabelecimento) =>
      estabelecimento.comidas.includes(this.filtroComida)
    );
  }

  // Filtrar por distância apenas se filtroDistancia for maior que zero
  if (this.filtroDistancia > 0) {
    filtered = filtered.filter((estabelecimento) =>
      estabelecimento.distancia <= this.filtroDistancia
    );
  }

  // Filtrar por nome
  if (this.filtroNomeEstabelecimento.trim() !== "") {
    const nomeFiltrado = this.filtroNomeEstabelecimento.toLowerCase().trim();
    filtered = filtered.filter((estabelecimento) =>
      estabelecimento.nome.toLowerCase().includes(nomeFiltrado)
    );
  }
  // Limita a quantidade de cards exibidos com base em cardsExibidos
  filtered = filtered.slice(0, this.cardsExibidos);

  return filtered;
},

  },
  async created() {
    try {
      await this.buscarLocalizacaoViaNavegador();

      const dadosFiltros = await api.get('/estabelecimento/filtro');

      const {
        estabelecimentos,
        categorias,
        opcionais,
        comidas
      } = dadosFiltros.data;

      try {
        for (let i=0; i < estabelecimentos.length; i++) {
          let fotoEstabelecimento = false;
          try {
            require(`./../../Estabelecimento/images/${estabelecimentos[i].id}.${estabelecimentos[i].formatoFoto}`);
            fotoEstabelecimento = true;
          } catch (error) {}

          if (fotoEstabelecimento) {
            estabelecimentos[i].foto = require(`./../../Estabelecimento/images/${estabelecimentos[i].id}.${estabelecimentos[i].formatoFoto}`);
          } else {
            estabelecimentos[i].foto = require(`./../../Estabelecimento/images/sem-imagem.${estabelecimentos[i].formatoFoto}`);
          }
        };
      } catch (error) {
        console.log('Erro ao tratar estabelecimentos para filtro da home: ', error);
      }
      
      this.estabelecimentos = estabelecimentos;

      try {
        const opcionaisArray = opcionais.map(objeto => objeto.nome);
        this.opcionais = opcionaisArray;
      } catch (error) {
        console.log('Erro ao tratar opcionais: ', error);
      }

      try {
        const categoriasArray = categorias.map(objeto => objeto.nome);
        this.categorias = categoriasArray;
      } catch (error) {
        console.log('Erro ao tratar categorias: ', error);
      }

      try {
        const comidasArray = comidas.map(objeto => objeto.nome);
        this.comidas = comidasArray;
      } catch (error) {
        console.log('Erro ao tratar comidas: ', error);
      }

      try {
        const coordenadas = {
          latitude: sessionStorage.getItem('latitude'),
          longitude: sessionStorage.getItem('longitude')
        }

        /* Essas são as coordenadas da Fatec
        -23.4820675, -47.4254607
        */

        if (sessionStorage.getItem('latitude') && sessionStorage.getItem('longitude')) {
          const distancias = await api.get('/distancia', { params: coordenadas });

          for (let i=0; i < distancias?.data?.distancias?.length; i++) {
            this.estabelecimentos[i].distancia = distancias.data.distancias[i].distancia;
          }
          this.showDistance = true;
        }
      } catch (error) {
        console.log('Erro ao buscar distâncias: ', error);
      }
    } catch (error) {
      console.log('Erro ao buscar informações dos estabelecimentos para os filtros: ', error);
    }
  },
  methods: {
    getEstabelecimentoLink(estabelecimento) {
      return `/paginaestabelecimento/${estabelecimento.id}`;
    },

    filterByCategory(category) {
  const index = this.categoriasSelecionadas.indexOf(category);
  

      if (category === 'Todos') {
        if (category === 'Todos') {
          // Se a categoria for "Todos", limpe a seleção atual
          this.categoriasSelecionadas = [];
        } else if (index === -1) {
          // Adicione a categoria à matriz se ainda não estiver presente
          this.categoriasSelecionadas.push(category);
        } else {
          // Remova a categoria se já estiver presente
          this.categoriasSelecionadas.splice(index, 1);
        }
      }
    },

    filterByOpcionais(opcional) {
      const index = this.filtroOpcionais.indexOf(opcional);
      if (opcional === 'Todos') {
        this.filtroOpcionais = [];
      } else if (index === -1) {
        this.filtroOpcionais.push(opcional);
      } else {
        this.filtroOpcionais.splice(index, 1);
      }
    },

    filterByComida(comida) {
      this.filtroComida = comida;
    },

    toggleFilter(filter) {
      if (this.activeFilter === filter) {
        this.activeFilter = null;
      } else {
        this.activeFilter = filter;
      }
    },

    selecionarCategoria(categoria) {
      const index = this.categoriasSelecionadas.indexOf(categoria);
      if (categoria === 'Todos') {// limpe a matriz de categorias selecionadas
        this.categoriasSelecionadas = [];
      } else if (index === -1) {// Adicione a categoria à matriz
        if (this.categoriasSelecionadas) {
          this.categoriasSelecionadas.push(categoria);
        }
      } else {// Remova a categoria se já estiver presente
        this.categoriasSelecionadas.splice(index, 1);
      }
    },


    selecionarOpcional(opcional) {
      if (opcional === 'Todos') {
        this.filtroOpcionais = [];
      } else {
        const index = this.filtroOpcionais.indexOf(opcional);
        if (index === -1) {
          this.filtroOpcionais.push(opcional);
        } else {
          this.filtroOpcionais.splice(index, 1);
        }
      }
    },

    selecionarComida(comida) {
      if (comida === 'Todos') {
        this.filtroComida = null; // Reseta filtro
      } else {
        this.filtroComida = comida;
      }
    },

    isCategoriaSelecionada(categoria) {
      return this.categoriasSelecionadas.includes(categoria);
    },

    isOpcionalSelecionado(opcional) {
      return this.filtroOpcionais.includes(opcional);
    },

    isComidaSelecionada(comida) {
      return this.filtroComida === comida;
    },
    limparFiltroDistancia() {
      if (this.filtroDistancia === 0) {
        // Se filtroDistancia for zero, defina-o como null para desativar o filtro
        this.filtroDistancia = null;
      } else {
        // Caso contrário, redefina-o para zero
        this.filtroDistancia = 0;
        this.filtroDistanciaText = "";
      }
    },
    filtrarPorNome() {
    const nomeFiltrado = this.filtroNomeEstabelecimento.toLowerCase().trim();

    if (nomeFiltrado === "") {
      // Se o campo de pesquisa estiver vazio, mostrar todos os estabelecimentos
      this.filtroCategoria = null;
      this.filtroOpcionais = [];
      this.filtroComida = null;
      this.filtroDistancia = 0;
    } else {
      // Filtrar por nome do estabelecimento
      this.filteredEstabelecimentos = this.estabelecimentos.filter((estabelecimento) =>
        estabelecimento.nome.toLowerCase().includes(nomeFiltrado)
      );
    }
  },

  aplicarFiltroDistanciaText() {
    const distancia = parseFloat(this.filtroDistanciaText);
    if (!isNaN(distancia) && distancia >= 0 && distancia <= 10) {
      this.filtroDistancia = distancia; // Atualiza o valor da distância se for válido
    } else {
      // Se o valor não estiver dentro do intervalo desejado, limpe o campo de entrada
      this.filtroDistanciaText = "";
    }
  },
  exibirMaisCards() {
      this.cardsExibidos += 10;       // Aumentar a quantidade de cards exibidos em 10
    },
    async buscarLocalizacaoViaNavegador() {
      try {
        if ("geolocation" in navigator) {
          const getLocation = async () => {
            try {
              const permissionStatus = await navigator.permissions.query({ name: 'geolocation' });
              if (permissionStatus.state === 'granted' || permissionStatus.state === 'prompt') {
                const position = await new Promise((resolve, reject) => {
                  navigator.geolocation.getCurrentPosition(resolve, reject, {
                    enableHighAccuracy: true,
                    timeout: 5000
                  });
                });

                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;
                const accuracy = position.coords.accuracy;

                sessionStorage.setItem('latitude', latitude);
                sessionStorage.setItem('longitude', longitude);                
                return true;
              } else {
                console.log("O usuário negou a permissão de geolocalização.");
                return false;
              }
            } catch (error) {
              switch (error.code) {
                case error.PERMISSION_DENIED:
                  console.log("Usuário rejeitou a solicitação de geolocalização.");
                  return false;
                case error.POSITION_UNAVAILABLE:
                  console.log("Informações de localização indisponíveis.");
                  return false;
                case error.TIMEOUT:
                  console.log("A solicitação de geolocalização expirou.");
                  return false;
                case error.UNKNOWN_ERROR:
                  console.log("Ocorreu um erro desconhecido ao obter a localização.");
                  return false;
                default:
                  console.error("Erro ao obter localização:", error);
                  return false;
              }
            }
          }
          return getLocation();
        } else {
          console.log("Geolocalização não é suportada pelo seu navegador.");
          return false;
        }
      } catch (error) {
        console.log('Erro ao solicitar localização através do navegador: ', error);
        return false;
      }
    },
    async buscarCep() {
      if (this.endereco) {
        const distancias = await api.get('/distancia/cep', { params: {cep: this.endereco} });
        for (let i=0; i < distancias?.data?.distancias?.length; i++) {
          this.estabelecimentos[i].distancia = distancias.data.distancias[i].distancia;
        }
        this.showDistance = true;
      }
    // Valide o formato do CEP
    const cepRegex = /^[0-9]{8}$/;

    if (cepRegex.test(this.endereco)) {
      // Faça uma requisição para o ViaCEP
      const url = `https://viacep.com.br/ws/${this.endereco}/json/`;

      axios
        .get(url)
        .then((response) => {
          // Atualize os dados ou utilize as informações conforme necessário
          const data = response.data;
          // console.log(data);
          
          sessionStorage.setItem('cep', this.endereco);
          sessionStorage.setItem('endereço', data.logradouro);
          this.enderecoValidado = `${data.logradouro}`;

        })
        .catch((error) => {
          console.error("Erro ao buscar informações de CEP:", error);

          // Exiba uma mensagem de erro para o usuário
          alert("Erro ao buscar informações de CEP. Por favor, tente novamente.");
        });
    } else {
      console.warn("Formato de CEP inválido");
    }
  },

  },
};
</script>
  
  <style>
  
  .filters-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px; 
    margin-bottom: 20px; 
  }
  
  .filters-container button,
  button {
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

  .filters-container button:hover,
  button:hover{
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
  
  
  .card-container {
      display: inline-flex;
      justify-content: center;
      align-items: center;
      font-weight: bold;
      margin-right: 25px;
    }
  
    .card-container:nth-child(3n) {
    margin-right: 0; /* Adicione essa linha para o terceiro card em cada linha */
  }
    
  
  .cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px; /* Adicione um espaçamento entre os cards */
    margin-top: 50px; /* Adicione margem na parte superior para separar dos botões de filtro */
  }
    
    .card {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 300px;
      border: 1px solid #ff9800;
      border-radius: 26px;
      padding: 10px;
      text-decoration: none;
      color: #fff;
      box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px ;
      margin-right: 25px;
      position: relative; /* Adicione essa linha para posicionar o elemento filho */
}

.distance {
  position: absolute;
  top: 10px; /* Ajuste conforme necessário para a posição desejada */
  right: 10px; /* Ajuste conforme necessário para a posição desejada */
  font-size: 14px;
  font-weight: bold;
  color: #fff;
  background: rgba(0, 0, 0, 0.7);
  padding: 5px;
  border-radius: 10px;
}
    
    .card:hover {
      box-shadow: 0 0 5px #aaa;
      transform: scale(1.1);
      transition-duration: .9s;
      /*background-color: #6e55b9;*/
      background: linear-gradient(to right, #e91e2f, #ff9800); /*degradê. utlizado cores na posição inversa*/
    }
    
    .card-image {
      width: 90%;
      height: 150px; 
      border-radius: 16px;
    }
    
    .card .description {
      margin-top: 15px;
    }

    a{
      text-decoration: none;
    }

    .Centraliza {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
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


.endereco-validado-container {
  width: 100%;
  font-weight: bold;
  font-size: 20px;
}


    /*Responsivo*/
    @media screen and (max-width: 768px) {

    .filters-container {
      justify-content: center;
      margin-bottom: 10px;
    }
  
    .filters-container button {
      width: auto;
      margin: 5px;
      padding: 5px 8px;
    }

    .card-image {
      width: 80%;
      height: 100px; 
      border-radius: 16px;
    }
  
    .cards {
      justify-content: center;
      gap: 10px;
      margin-top: 10px;
    }
  
    .card-container {
      margin-right: 10px;
    }

    .card{
      width: 200px;
    }
    
    h3, p{
      font-size: 15px;
    }
  }
  
  @media screen and (min-width: 600px) {
    .card-container {
      margin-right: 25px;
    }
  
    .cards {
      gap: 20px;
      margin-top: 20px;
    }

    .card{
      width: 300px;
    }
    
    h3, p{
      font-size: px;
    }

    .card-image {
      width: 90%;
      height: 120px; 
    }
  
    @media screen and (max-width: 414px) {

    .card{
      width: 400px;
    }

    .card-container {
      margin-right: 20px;
    }
  
    .cards {
      gap: 15px;
      margin-top: 15px;
    }
  }
  
  }
  
  
  
  </style>