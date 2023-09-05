<template>
    <div class="quadro-categorias">
      
      <button
        v-for="opcao in categoria"
        :key="opcao.id"
        :class="{ botao: true, selecionado: opcaoSelecionada(opcao) }"
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
  export default {
    name: "Categorias",
    props: {
    value: Array, // O valor passado pelo componente pai
    },
    data() {
      return {
        //categoria: [] // usar com a API
        categoriaSelecionadas: this.value, // Inicialize com o valor passado
        categoriaSelecionadas: [],
        categoria: [ // remover ou comentar ao testar a API
          {
            id: 1,
            nome: "Pizzaria"
          },
          {
            id: 2,
            nome: "Hamburgueria"
          },
          {
            id: 3,
            nome: "Lanchonete"
          },
          {
            id: 4,
            nome: "Restaurante"
          },
          {
            id: 5,
            nome: "Bar"
          }
        ]
      };
    },
    computed: {
      categoriaSelecionadasString() {
      return this.categoriaSelecionadas.map(opcao => opcao.nome).join(", ");
      },
    },
    methods: {
          selecionarOpcao(opcao) {
          if (this.opcaoSelecionada(opcao)) {
            this.categoriaSelecionadas = this.categoriaSelecionadas.filter(item => item.id !== opcao.id);
          } else {
            this.categoriaSelecionadas.push(opcao);
          }
          // Em vez de atualizar apenas localmente, emitimos o evento para notificar o componente pai
          this.$emit("input", this.categoriaSelecionadas);
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
  