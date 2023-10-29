<template>
    <div>
      <!-- Componente de Categorias -->
      <div class="quadro-categorias">
        <div>   </div>
        <button
          v-for="opcao in categorias"
          :key="opcao.id"
          :class="{ botao: true, selecionado: categoriaSelecionada(opcao) }"
          @click="selecionarCategoria(opcao)"
        >
          {{ opcao.nome }}
        </button>
      </div>
      <div id="categoriasSelecionadas">
        <br /><p>Categorias selecionadas: {{ categoriasSelecionadasString }}</p>
      </div>
  
      <!-- Componente de Opcionais -->
      <div class="quadro-Opcionais">
        <button
          v-for="opcao in opcionais"
          :key="opcao.id"
          :class="{ botao: true, selecionado: opcionalSelecionado(opcao) }"
          @click="selecionarOpcional(opcao)"
        >
          {{ opcao.nome }}
        </button>
      </div>
      <div id="opcionaisSelecionados">
        <br /><p>Opcionais selecionados: {{ opcionaisSelecionadosString }}</p>
      </div>
  
      <!-- Componente de Tipos de Comida -->
      <div class="tipos-de-comida">
        <button
          v-for="tipo in tiposDeComida"
          :key="tipo.id"
          :class="{ botao: true, selecionado: tipoComidaSelecionado(tipo) }"
          @click="selecionarTipoComida(tipo)"
        >
          {{ tipo.nome }}
        </button>
      </div>
      <div id="tiposDeComidaSelecionados">
        <br /><p>Tipos de Comida Selecionados: {{ tiposDeComidaSelecionadosString }}</p>
      </div>
  
      <!-- Componente de Estilos Musicais -->
      <div class="quadro-estilosMusicais">
        <button
          v-for="opcao in estilosMusicais"
          :key="opcao.id"
          :class="{ botao: true, selecionado: estiloMusicalSelecionado(opcao) }"
          @click="selecionarEstiloMusical(opcao)"
        >
          {{ opcao.nome }}
        </button>
      </div>
      <div id="estilosMusicalSelecionados">
        <br /><p>Estilos musicais selecionados: {{ estilosMusicaisSelecionadosString }}</p>
      </div>
    </div>
  </template>
  
  <script>
  import api from './../../../services/backend.service.js';
  
  export default {

    data() {
      return {
        categoriasSelecionadas: [],
        opcionaisSelecionados: [],
        tiposDeComidaSelecionados: [],
        estilosMusicaisSelecionados: [],
        categorias: [],
        opcionais: [],
        tiposDeComida: [],
        estilosMusicais: [],
      };
    },
    computed: {
      categoriasSelecionadasString() {
        return this.categoriasSelecionadas.map(opcao => opcao.nome).join(", ");
      },
      opcionaisSelecionadosString() {
        return this.opcionaisSelecionados.map(opcao => opcao.nome).join(", ");
      },
      tiposDeComidaSelecionadosString() {
        return this.tiposDeComidaSelecionados.map(tipo => tipo.nome).join(", ");
      },
      estilosMusicaisSelecionadosString() {
        return this.estilosMusicaisSelecionados.map(opcao => opcao.nome).join(", ");
      },
    },
    created() {
      this.metodoInicial();
    },
    methods: {
      async metodoInicial() {
        try {
          const categorias = await api.get('/categoria');
          const opcionais = await api.get('/opcional');
          const tipos = await api.get('/comida');
          const estilosMusicais = await api.get('/estiloMusica');
  
          this.categorias = categorias.data;
          this.opcionais = opcionais.data;
          this.tiposDeComida = tipos.data;
          this.estilosMusicais = estilosMusicais.data;
        } catch (error) {
          console.error('ERROR:: ', error);
        }
      },
      selecionarCategoria(categoria) {
        if (this.categoriaSelecionada(categoria)) {
          this.categoriasSelecionadas = this.categoriasSelecionadas.filter(item => item.id !== categoria.id);
        } else {
          if (this.categoriasSelecionadas.length < 3) {
            this.categoriasSelecionadas.push(categoria);
          } else {
            alert('Só é permitida a inclusão de 3 categorias.');
          }
        }
      },
      selecionarOpcional(opcional) {
        if (this.opcionalSelecionado(opcional)) {
          this.opcionaisSelecionados = this.opcionaisSelecionados.filter(item => item.id !== opcional.id);
        } else {
          this.opcionaisSelecionados.push(opcional);
        }
      },
      selecionarTipoComida(tipo) {
        if (this.tipoComidaSelecionado(tipo)) {
          this.tiposDeComidaSelecionados = this.tiposDeComidaSelecionados.filter(item => item.id !== tipo.id);
        } else {
          this.tiposDeComidaSelecionados.push(tipo);
        }
      },
      selecionarEstiloMusical(estilo) {
        if (this.estiloMusicalSelecionado(estilo)) {
          this.estilosMusicaisSelecionados = this.estilosMusicaisSelecionados.filter(item => item.id !== estilo.id);
        } else {
          this.estilosMusicaisSelecionados.push(estilo);
        }
      },
      categoriaSelecionada(categoria) {
        return this.categoriasSelecionadas.some(item => item.id === categoria.id);
      },
      opcionalSelecionado(opcional) {
        return this.opcionaisSelecionados.some(item => item.id === opcional.id);
      },
      tipoComidaSelecionado(tipo) {
        return this.tiposDeComidaSelecionados.some(item => item.id === tipo.id);
      },
      estiloMusicalSelecionado(estilo) {
        return this.estilosMusicaisSelecionados.some(item => item.id === estilo.id);
      },
    },
    mounted() {
        // Simule os valores retornados da API e atribua-os aos arrays
        this.categorias = [
        { id: 1, nome: "Lanchonete" },
        { id: 4, nome: "Restaurante" },
        { id: 2, nome: "Pizzaria" },
        ];

        this.opcionais = [
        { id: 1, nome: "Faz entrega" },
        { id: 2, nome: "Entrega Grátis" },
        ];

        this.tiposDeComida = [
             { id: 1, nome: "Brasileira" },
        ];

        this.estilosMusicais = [
        { id: 1, nome: "Pagode" },
        ];

        // Valores retornados do banco
        this.categoriasSelecionadas = this.categorias;
        this.opcionaisSelecionados = this.opcionais;
        this.tiposDeComidaSelecionados = this.tiposDeComida; 
        this.estilosMusicaisSelecionados = this.estilosMusicais;
        

    },
  };
  </script>
  
  <style scoped>
  .quadro-categorias,
  .quadro-Opcionais,
  .tipos-de-comida,
  .quadro-estilosMusicais {
    border: 2px solid white;
    padding: 20px;
    width: 450px;
    text-align: center;
    margin: 0 auto;
    background-color: rgba(255, 255, 255, 0.418); 
  }
  
  p {
    color: white;
  }
  
  .botao {
    background-color: red;
    padding: 10px 20px;
    margin: 5px;
    cursor: pointer;
    border-radius: 25px; 
    color: #fff;
  }
  
  .botao.selecionado {
    background-color: orange;
  }
  
  .botao:hover {
    background-color: yellow;
  }
  
  /* Estilos Responsivos */
  @media screen and (max-width: 1160px) {
    .quadro-categorias {
      width: 100%;
    }
  }
  
  @media screen and (max-width: 950px) {
    .quadro-categorias {
      width: 80%;
    }
  }
  
  @media screen and (max-width: 768px) {
    .quadro-categorias {
      width: 90%;
    }
  }
  
  @media screen and (max-width: 414px) {
    .quadro-categorias {
      width: 100%;
    }
  }
  
  @media screen and (max-width: 360px) {
    .quadro-categorias {
      width: 100%;
    }
  }
  </style>
  