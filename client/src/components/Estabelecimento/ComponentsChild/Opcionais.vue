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
export default {
  name: "Opcionais",
  props: {
    value: Array, // Adicione uma propriedade value para usar v-model
  },
  data() {
    return {
      opcoesSelecionadas: [],
      opcoes: [
        {
          id: 1,
          nome: "Oferece Rodízio"
        },
        {
          id: 2,
          nome: "Wi-Fi"
        },
        {
          id: 3,
          nome: "Estacionamento"
        },
        {
          id: 4,
          nome: "Área Kids"
        },
        {
          id: 5,
          nome: "Rodízio"
        }
      ]
    };
  },
  computed: {
    opcoesSelecionadasString() {
      return this.opcoesSelecionadas.map(opcao => opcao.nome).join(", ");
    }
  },
  methods: {
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
    width: 300px;
    text-align: center;
    margin: 0 auto;
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
  }
  
  .botao.selecionado {
    background-color: orange;
  }
  
  .botao:hover {
    background-color: yellow;
  }
  </style>
  