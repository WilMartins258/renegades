<template>
  <div class="quadro-estilosMusicais">
    <button v-for="opcao in estilos" :key="opcao.id" :class="{ botao: true, selecionado: opcaoSelecionada(opcao) }"
      @click="selecionarOpcao(opcao)">
      {{ opcao.nome }}
    </button>
  </div>

  <div id="estilosSelecionadas">
    <br>
    <p>Estilos selecionados: {{ estilosSelecionadasString }}</p>
  </div>
</template>
  
<script>
import api from './../../../services/backend.service.js';
export default {

  name: "EstilosMusicas",
  props: {
    value: Array, // Adicione uma propriedade value para usar v-model
  },
  emits: ['input'],
  data() {
    return {
      estilosSelecionadas: [],
      estilos: []
    };
  },
  computed: {
    estilosSelecionadasString() {
      // Converte o array de opções selecionadas em uma string separada por vírgula
      return this.estilosSelecionadas.map(opcao => opcao.nome).join(", ");
    }
  },
  created() {
    this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      try {
        const estilosMusica = await api.get('/estiloMusica');

        this.estilos = estilosMusica.data;
      } catch (error) {
        console.error('ERROR:: ', error);
      }
    },
    selecionarOpcao(opcao) {
      if (this.opcaoSelecionada(opcao)) {
        // Se a opção já estiver selecionada, remova-a da lista
        this.estilosSelecionadas = this.estilosSelecionadas.filter(item => item.id !== opcao.id);
      } else {
        // Caso contrário, adicione-a à lista
        this.estilosSelecionadas.push(opcao);
      }
      this.$emit("input", this.estilosSelecionadas); // Emita o evento input aqui
    },
    opcaoSelecionada(opcao) {
      return this.estilosSelecionadas.some(item => item.id === opcao.id);
    },
    getestilos() {
      // Fazer chamada a API para obter as informações das opções.
    }
  }
};
</script>
  
<style scoped>
.quadro-estilosMusicais {
  border: 2px solid white;
  padding: 20px;
  width: 450px;
  text-align: center;
  margin: 0 auto;
  background-color: rgba(255, 255, 255, 0.418);
}

p {
  /*ajustar de acordo com o fundo*/
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
  .quadro-estilosMusicais {
    width: 100%;
  }
}

@media screen and (max-width: 950px) {

}

@media screen and (max-width: 768px) {

}

@media screen and (max-width: 414px) {

}

@media screen and (max-width: 360px) {

}
</style>
  