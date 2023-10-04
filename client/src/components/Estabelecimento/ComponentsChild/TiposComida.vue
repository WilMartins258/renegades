<template>
  <div class="quadro-Opcionais">
    <button
      v-for="comida in comidas"
      :key="comida.id"
      :class="{ botao: true, selecionado: comidaSelecionada(comida) }"
      @click="selecionarcomida(comida)"
    >
      {{ comida.nome }}
    </button>
  </div>

  <div id="comidasSelecionadas">
    <br /><p>Tipos de comidas selecionadas: {{ comidasSelecionadasString }}</p>
  </div>
</template>

<script>
  import api from '../../../services/backend.service.js';
export default {
  name: "TiposComida",
  props: {
    value: Array, // Adicione uma propriedade value para usar v-model
  },
  emits: ['input'],
  data() {
    return {
      comidasSelecionadas: [],
      comidas: []
    };
  },
  computed: {
    comidasSelecionadasString() {
      return this.comidasSelecionadas.map(comida => comida.nome).join(", ");
    }
  },
  created() {
    this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      try {
        const opcionais = await api.get('/opcional');

        this.comidas = opcionais.data;
      } catch (error) {
        console.error('ERROR:: ', error);
      }
    },
    selecionarcomida(comida) {
      if (this.comidaSelecionada(comida)) {
        this.comidasSelecionadas = this.comidasSelecionadas.filter(item => item.id !== comida.id);
      } else {
        this.comidasSelecionadas.push(comida);
      }
      this.$emit("input", this.comidasSelecionadas); // Emita o evento input aqui
    },
    comidaSelecionada(comida) {
      return this.comidasSelecionadas.some(item => item.id === comida.id);
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

@media screen and (max-width: 950px) {

}

@media screen and (max-width: 768px) {

}

@media screen and (max-width: 414px) {

}

@media screen and (max-width: 360px) {

}

  </style>
  