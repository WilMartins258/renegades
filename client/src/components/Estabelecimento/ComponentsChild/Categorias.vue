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
  import api from './../../../services/backend.service.js';
  export default {
    name: "Categorias",
    props: {
    value: Array, // O valor passado pelo componente pai
    },
    emits: ['input'],
    data() {
      return {
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
            if (this.categoriaSelecionadas.length < 3) {
          this.categoriaSelecionadas.push(opcao);
        } else {
          alert('Só é permitido a inclusão de 3 categorias.');
        };
          }
          this.$emit("input", this.categoriaSelecionadas); // Emita o evento input aqui

          const restauranteSelecionado = this.categoriaSelecionadas.some(item => item.nome.toLowerCase() === 'restaurante');

            // Emita um evento adicional para indicar se "Restaurante" está selecionado
            this.$emit("restauranteSelecionado", restauranteSelecionado);
        },
        opcaoSelecionada(opcao) {
          return this.categoriaSelecionadas.some(item => item.id === opcao.id);
        },
      },
    };
  </script>
  
  <style scoped>
  .quadro-categorias {
    border: 2px solid white;
    padding: 20px;
    width: 450px;
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
    display: inline-block;
  }
  
  .button.selecionado {
    background-color: orange;
  }
  
  .button:hover {
    background-color: yellow;
  }

  /*Responsive*/

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
  