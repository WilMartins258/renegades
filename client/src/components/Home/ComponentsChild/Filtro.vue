<template>
    <div>
      <div class="filters-container">
        <button @click="filterByCategory(null)">Todos</button>
        <button @click="filterByCategory('bar')">Bar</button>
        <button @click="filterByCategory('lanchonete')">Lanchonete</button>
        <button @click="filterByCategory('pizzaria')">Pizzaria</button>
        <button @click="filterByCategory('hamburgueria')">Hamburgueria</button>
      </div>
      <div class="Centraliza">
        <div class="cards">
          <a v-for="estabelecimento in filteredEstabelecimentos" :key="estabelecimento.id" :href="getEstabelecimentoLink(estabelecimento)" class="card-container">
            <div class="card">
              <img :src="estabelecimento.foto" alt="Foto do estabelecimento" class="card-image" />
              <h3>{{ estabelecimento.nome }}</h3>
              <p class="description">{{ estabelecimento.categoria }}</p> 
            </div>
          </a> 
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import api from "./../../../services/backend.service.js";
  export default {
    name: "Filtro",
    data() {
      return {
        estabelecimentos: [
        {
            id: 1,
            nome: "Jeff's Burger",
            categoria: "Hamburgueria",
            foto: "https://www.plakart.com.br/img/galerias/40/0004_19b5c1b5b20643f9fc9045e14cd8ef67.jpeg"
        },
        {
            id: 2,
            nome: "Bar do João",
            categoria: "bar",
            foto: "https://www.lojaskd.com.br/blog/wp-content/webp-express/webp-images/doc-root/blog/wp-content/uploads/2023/06/Nomes-para-bar-1024x576.png.webp"
          },
          {
            id: 3,
            nome: "Lanchonete da Maria",
            categoria: "lanchonete",
            foto: "https://www.emporiotambo.com.br/pub/media/resized/1300x800/ves/blog/xcomo-decorar-uma-lanchonete-com-pouco-dinheiro.jpg.pagespeed.ic.o-02P9_HPT.webp"
          },
          {
            id: 4,
            nome: "Pizzaria do Carlos",
            categoria: "pizzaria",
            foto: "https://diariodorio.com/wp-content/uploads/2020/07/daleopizzaria_20200710_144435_0.jpg"
          },
          {
            id: 5,
            nome: "Burger King",
            categoria: "hamburgueria",
            foto: "https://agendasorocaba.com.br/wp-content/uploads/2019/07/Burger-King-03.jpg"
          },
          {
            id: 6,
            nome: "Teste 1",
            categoria: "pizzaria",
            foto: "https://diariodorio.com/wp-content/uploads/2020/07/daleopizzaria_20200710_144435_0.jpg"
          },
        ],
        filtroCategoria: null,
      };
    },
    computed: {
      filteredEstabelecimentos() {
        if (this.filtroCategoria) {
          return this.estabelecimentos.filter(
            estabelecimento => estabelecimento.categoria === this.filtroCategoria
          );
        } else {
          return this.estabelecimentos;
        }
      },
    },
    created() {
	    this.metodoInicial();
    },
    methods: {
      async metodoInicial() {
      // Esses são apenas testes que fiz com imagens no front
      //   console.log('metodoInicial da FILTRO');

      //   const estabelecimentos = await api.get('test');
      //   console.log('estabelecimentos:: ', estabelecimentos);

      //   this.estabelecimentos[0].nome = estabelecimentos.data[0].nomeImg;
      //   this.estabelecimentos[0].foto = estabelecimentos.data[0].blobTest;
      },

      getEstabelecimentoLink(estabelecimento) {
        // Aqui você pode retornar o link com o ID
        return `/paginaestabelecimento/${estabelecimento.id}`;
      },

      filterByCategory(category) {
        this.filtroCategoria = category;
      },
    },
  };
  </script>
  
  <style>
  
  .filters-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px; 
    margin-bottom: 20px; 
  }
  
  .filters-container button {
    margin: 10 20px;
    border-radius: 20px;
    width:10%;
    display:block;
    border:none;
    padding:5px 10px;
    background:#e91e2f;
    cursor: pointer;
    transition: 0.5s;
    color: #fff;
  }
  
  .filters-container button:hover{
      background:#ff9800;     
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
  
    /*Responsivo*/
    @media screen and (max-width: 768px) {
    /* Adjustments for smaller screens */
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
    /* Styles for larger screens */
    .filters-container button {
      width: 10%;
      margin: 10px 20px;
      padding: 5px 10px;
    }
  
    .card-container {
      margin-right: 25px;
    }
  
    .cards {
      gap: 20px;
      margin-top: 20px;
    }
  
    @media screen and (max-width: 820px) {
    /* Styles for screens up to 820px */
    .filters-container button {
      width: 15%;
      margin: 10px;
      padding: 5px 10px;
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