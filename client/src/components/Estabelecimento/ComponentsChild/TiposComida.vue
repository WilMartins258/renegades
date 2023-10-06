<template>
  <div class="tipos-de-comida">
    <button
      v-for="tipo in tiposDeComida"
      :key="tipo.id"
      :class="{ botao: true, selecionado: isSelected(tipo) }"
      @click="selecionarTipo(tipo)"
    >
      {{ tipo.nome }}
    </button>
  </div>

  <div id="tiposDeComidaSelecionados">
    <br />
    <p>Tipos de Comida Selecionados: {{ tiposDeComidaSelecionadosString }}</p>
  </div>
</template>

<script>
import api from './../../../services/backend.service.js';

export default {
  name: "TiposDeComida",
  props: {
    value: Array, // O valor passado pelo componente pai
  },
  emits: ['input'],
  data() {
    return {
      tiposDeComidaSelecionados: [],
      tiposDeComida: [],
    };
  },
  computed: {
    tiposDeComidaSelecionadosString() {
      return this.tiposDeComidaSelecionados.map(tipo => tipo.nome).join(", ");
    },
  },
  created() {
    this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      try {
        const tipos = await api.get('/comida');
        this.tiposDeComida = tipos.data;
      } catch (error) {
        console.error('ERRO: ', error);
      }
    },
    selecionarTipo(tipo) {
      if (this.isSelected(tipo)) {
        this.tiposDeComidaSelecionados = this.tiposDeComidaSelecionados.filter(item => item.id !== tipo.id);
      } else {
        this.tiposDeComidaSelecionados.push(tipo);
      }
      this.$emit("input", this.tiposDeComidaSelecionados); // Emitir o evento input aqui
    },
    isSelected(tipo) {
      return this.tiposDeComidaSelecionados.some(item => item.id === tipo.id);
    },
  },
};
</script>

<style scoped>
.tipos-de-comida {
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

/* Responsividade */

@media screen and (max-width: 1160px) {
  .tipos-de-comida {
    width: 100%;
  }
}

@media screen and (max-width: 950px) {
  .tipos-de-comida {
    width: 80%;
  }
}

@media screen and (max-width: 768px) {
  .tipos-de-comida {
    width: 90%;
  }
}

@media screen and (max-width: 414px) {
  .tipos-de-comida {
    width: 100%;
  }
}

@media screen and (max-width: 360px) {
  .tipos-de-comida {
    width: 100%;
  }
}
</style>
