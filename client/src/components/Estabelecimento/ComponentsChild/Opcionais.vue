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
      <p>Opções selecionadas: {{ opcoesSelecionadasString }}</p>
    </div>
  </template>
  
  <script>
  export default {
    name: "Opcionais",
    data() {
      return {
        //opcoes: [] // usar com a API
        opcoesSelecionadas: [],
        opcoes: [ // remover ou comentar ao testar a API
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
        // Converte o array de opções selecionadas em uma string separada por vírgula
        return this.opcoesSelecionadas.map(opcao => opcao.nome).join(", ");
      }
    },
    methods: {
      selecionarOpcao(opcao) {
        if (this.opcaoSelecionada(opcao)) {
          // Se a opção já estiver selecionada, remova-a da lista
          this.opcoesSelecionadas = this.opcoesSelecionadas.filter(item => item.id !== opcao.id);
        } else {
          // Caso contrário, adicione-a à lista
          this.opcoesSelecionadas.push(opcao);
        }
      },
      opcaoSelecionada(opcao) {
        return this.opcoesSelecionadas.some(item => item.id === opcao.id);
      },
      getOpcoes() {
        // Fazer chamada a API para obter as informações das opções.
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
  