<template>
    <div class="quadro-estilosMusicais">
      <button
        v-for="opcao in estilos"
        :key="opcao.id"
        :class="{ botao: true, selecionado: opcaoSelecionada(opcao) }"
        @click="selecionarOpcao(opcao)"
      >
        {{ opcao.nome }}
      </button>
    </div>
  
    <div id="estilosSelecionadas">
      <br><p>Estilos selecionados: {{ estilosSelecionadasString }}</p>
    </div>
  </template>
  
  <script>
  export default {
    name: "EstilosMusicas",
    props: {
    value: Array, // Adicione uma propriedade value para usar v-model
    },
    data() {
      return {
        //estilos: [] // usar com a API
        estilosSelecionadas: [],
        estilos: [ // remover ou comentar ao testar a API
          {
            id: 1,
            nome: "Rock"
          },
          {
            id: 2,
            nome: "Sertanejo"
          },
          {
            id: 3,
            nome: "Hip-hop"
          },
          {
            id: 4,
            nome: "Funk"
          },
          {
            id: 5,
            nome: "Clássica"
          }
        ]
      };
    },
    computed: {
      estilosSelecionadasString() {
        // Converte o array de opções selecionadas em uma string separada por vírgula
        return this.estilosSelecionadas.map(opcao => opcao.nome).join(", ");
      }
    },
    methods: {
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
  