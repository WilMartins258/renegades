<template>
  <div class="quadro-Opcionais">
    <button
      v-for="opcao in opcoes"
      :key="opcao.id"
      :class="{ botao: true, selecionado: opcaoSelecionada(opcao) }"
      @click="selecionarOpcao(opcao)"
    >
      {{ opcao.nome }}
    </button>
  </div>

  <div id="opcoesSelecionadas">
    <br /><p>Opções selecionadas: {{ opcoesSelecionadasString }}</p>
  </div>
</template>

<script>
  import api from './../../../services/backend.service.js';
export default {
  name: "Opcionais",
  props: {
    value: Array, // Adicione uma propriedade value para usar v-model
  },
  emits: ['input'],
  data() {
    return {
      opcoesSelecionadas: [],
      opcoes: []
    };
  },
  computed: {
    opcoesSelecionadasString() {
      return this.opcoesSelecionadas.map(opcao => opcao.nome).join(", ");
    }
  },
  created() {
    this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      try {
        const opcionais = await api.get('/opcional');

        this.opcoes = opcionais.data;
      } catch (error) {
        console.error('ERROR:: ', error);
      }
    },
    selecionarOpcao(opcao) {
      if (this.opcaoSelecionada(opcao)) {
        this.opcoesSelecionadas = this.opcoesSelecionadas.filter(item => item.id !== opcao.id);
      } else {
        this.opcoesSelecionadas.push(opcao);
      }
      this.$emit("input", this.opcoesSelecionadas); // Emita o evento input aqui
    },
    opcaoSelecionada(opcao) {
      return this.opcoesSelecionadas.some(item => item.id === opcao.id);
    }
  }
};
</script>
  
  <style scoped>
  .quadro-Opcionais {
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
  
  .botao {
    background-color: red;
    color: white;
    padding: 10px 20px;
    margin: 5px;
    cursor: pointer;
    border-radius: 25px; 
  }
  
  .botao.selecionado {
    background-color: orange;
  }
  
  .botao:hover {
    background-color: yellow;
  }

  /*Responsivo */
  @media screen and (max-width: 1160px) {
  .quadro-Opcionais {
    width: 100%;
  }
}



  </style>
  