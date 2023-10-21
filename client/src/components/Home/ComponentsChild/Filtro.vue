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
    <!-- Contêiner externo para botões e quadros de submenu -->
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
    class="filter-submenu quadro-Opcionais"
  >
    <input
      type="range"
      v-model="filtroDistancia"
      min="0"
      max="10"
      step="1"
    />
    
    <p>Distância: {{ filtroDistancia }} km</p>
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
        <p class="description">{{ estabelecimento.categoria.join(', ') }}</p>
      </div>
    </a>
  </div>
</div>
</div>
</div>
</template>

<script>
import api from "./../../../services/backend.service.js";
import distance_Service from "./../../../services/distance.service.js";

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

  return filtered;
},

  },
  async created() {
    try {
      const dadosFiltros = await api.get('/estabelecimento/filtro');
      // const geolocalizacao = await distance_Service.obterCoordenadasDoCEP();

      // console.log('geolocalizacao:: ', geolocalizacao)

      const {
        estabelecimentos,
        categorias,
        opcionais,
        comidas
      } = dadosFiltros.data;

      // Aqui vamos receber a latitude e longitude de cada cep de estabelecimento através de uma API (Google por exemplo)
      // try {
      //   for (let i=0; i < estabelecimentos.length; i++) {
          
      //   };
      // } catch (error) {
      //   console.log('Erro ao inserir latitude e longitude dos estabelecimentos: ', error);
      // }

      try {
        for (let i=0; i < estabelecimentos.length; i++) {
          estabelecimentos[i].foto = require(`./../../Estabelecimento/images/${estabelecimentos[i].id}.${estabelecimentos[i].formatoFoto}`);
        };
      } catch (error) {
        console.log('Erro ao tratar estabelecimentos para filtro da home: ', error);
      }
      console.log('estabelecimentos:: ', estabelecimentos);
      
      const estabelecimentosTeste = [
        {
          id: 1,
          nome: "Jeff's Burger",
          categoria: ["Lanchonete", "Pizzaria", "Restaurante"].join(', '),
          foto: "https://www.plakart.com.br/img/galerias/40/0004_19b5c1b5b20643f9fc9045e14cd8ef67.jpeg",
          opcionais: ["Faz entrega", "Entrega Grátis", "Possui Área Kids"],
          comidas: [null]
        },
        {
          id: 2,
          nome: "Bar do João",
          categoria: ["Bar"].join(', '),
          foto: "https://www.lojaskd.com.br/blog/wp-content/webp-express/webp-images/doc-root/blog/wp-content/uploads/2023/06/Nomes-para-bar-1024x576.png.webp",
          opcionais: ["Tem Wi-fi livre", "Possui Estacionamento", "Oferece Rodízio"],
          comidas: [null]
        },
        {
          id: 3,
          nome: "Lanchonete da Maria",
          categoria: ["Lanchonete", "Pizzaria"].join(', '),
          foto: "https://www.emporiotambo.com.br/pub/media/resized/1300x800/ves/blog/xcomo-decorar-uma-lanchonete-com-pouco-dinheiro.jpg.pagespeed.ic.o-02P9_HPT.webp",
          opcionais: ["Possui Estacionamento", "Possui Área Kids", "Toca Música"],
          comidas: [null]
        },
        {
          id: 4,
          nome: "Pizzaria do Carlos",
          categoria: ["Pizzaria"].join(', '),
          foto: "https://diariodorio.com/wp-content/uploads/2020/07/daleopizzaria_20200710_144435_0.jpg",
          opcionais: ["Tem Wi-fi livre", "Possui Área Kids", "Toca Música", "Música ao Vivo"],
          comidas: [null]
        },
        {
          id: 5,
          nome: "Burger King",
          categoria: ["Hamburgueria"].join(', '),
          foto: "https://agendasorocaba.com.br/wp-content/uploads/2019/07/Burger-King-03.jpg",
          opcionais: ["Tem Wi-fi livre", "Couvert Grátis", "Possui Área Kids"],
          comidas: [null]
        },
        {
          id: 6,
          nome: "Izumi",
          categoria: ["Restaurante"].join(', '),
          foto: "https://izumima.com/wp-content/uploads/2023/01/IMG_8822-2048x1536.jpg",
          opcionais: ["Tem Wi-fi livre", "Possui Área de Fumantes",],
          comidas: ["Japonesa"]
        },
        {
          id: 7,
          nome: "Absoluto",
          categoria: ["Restaurante"].join(', '),
          foto: "https://i.pinimg.com/564x/49/0b/64/490b640ca8bb4726489296c98509fdb6.jpg",
          opcionais: ["Tem Wi-fi livre", "Permite Animais", "Possui Área Kids", "Possui Estacionamento"],
          comidas: ["Italiana"]
        },
        {
          id: 8,
          nome: "Bumbu",
          categoria: ["Restaurante"].join(', '),
          foto: "https://4.bp.blogspot.com/-JiIZTUI6GzY/WN1phr5KOYI/AAAAAAAAANc/wALXGWFUwCo-ZK6pGrsPJ0UlyCpbTMqLQCLcB/s1600/fachada-bambu.jpg",
          opcionais: ["Tem Wi-fi livre", "Possui Área Kids", "Tem taxa de 10%"],
          comidas: ["Brasileira", "Japonesa"]
        }
      ]

      // this.estabelecimentos = estabelecimentosTeste;
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
    } catch (error) {
      console.log('Erro ao buscar informações dos filtros: ', error);
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
    margin-top: 20px; /* Adicione margem na parte superior para separar dos botões de filtro */
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
  
    .cards {
      justify-content: center;
      gap: 10px;
      margin-top: 10px;
    }
  
    .card-container {
      margin-right: 10px;
    }
  }
  
  @media screen and (min-width: 769px) {
    .card-container {
      margin-right: 25px;
    }
  
    .cards {
      gap: 20px;
      margin-top: 20px;
    }
  
    @media screen and (max-width: 820px) {

  
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