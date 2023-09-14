<template>
    <div class="quadro-categorias">
      
      <button
        v-for="opcao in categoria"
        :key="opcao.id"
        :class="{ button: true, selecionado: opcaoSelecionada(opcao) }"
        @click="selecionarOpcao(opcao)"
      >
        {{ opcao.nome }}
      </button>
    </div>
  
    <div id="categoriaSelecionadas">
      <br><p>Categorias selecionadas: {{ categoriaSelecionadasString }}</p>
    </div>
  </template>
  
  <script>
  import api from './../../../services/backend-service.js';
  export default {
    name: "Categorias",
    props: {
    value: Array, // O valor passado pelo componente pai
    },
    emits: ['input'],
    data() {
      return {
        // categoriaSelecionadas: this.value, // Inicialize com o valor passado
        categoriaSelecionadas: [],
        categoria: []
      };
    },
    computed: {
      categoriaSelecionadasString() {
      return this.categoriaSelecionadas.map(opcao => opcao.nome).join(", ");
      },
    },
    created() {
	    this.metodoInicial();
    },
    methods: {
      async metodoInicial() {
        try {
          const categorias = await api.get('/categoria');

          this.categoria = categorias.data;
        } catch (error) {
          console.error('ERROR:: ', error);
        }
      },
      selecionarOpcao(opcao) {
          if (this.opcaoSelecionada(opcao)) {
            this.categoriaSelecionadas = this.categoriaSelecionadas.filter(item => item.id !== opcao.id);
          } else {
            this.categoriaSelecionadas.push(opcao);
          }
          this.$emit("input", this.categoriaSelecionadas); // Emita o evento input aqui
        },
        opcaoSelecionada(opcao) {
          return this.categoriaSelecionadas.some(item => item.id === opcao.id);
        },
        getcategoria() {
          // Fazer chamada a API para obter as informações das opções.
        },
      },
    };
  </script>
  
  <style scoped>
  .quadro-categorias {
    border: 2px solid white;
    padding: 20px;
    width: 300px;
    text-align: center;
    margin: 0 auto;
    background-color: rgba(255, 255, 255, 0.418); 
  }

  p{ /*ajustar de acordo com o fundo*/
    color: white;
  }
  
  .button {
    background-color: red;
    padding: 10px 20px;
    margin: 5px;
    cursor: pointer;
    border-radius: 25px; 
    color: #fff;
  }
  
  .button.selecionado {
    background-color: orange;
  }
  
  .button:hover {
    background-color: yellow;
  }

  /*Responsivo*/

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
    width: 60%;
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
  