<template>
    <div>
      <ComponentMessage v-if="mostrarMensagem" :title="tituloMsg" :message="mensagemPUser" @close="fecharMensagem" />
      <div class="avaliacao">
        <div class="customer-info">
          Minha nota é:<br>
          <span class="nota"> {{ MediaNt.toFixed(1) }} </span>
        </div>
      </div><br>
      <div v-for="(review, index) in visibleAvaliacao" :key="index">
        <fieldset>
          <label class="titulo">
            <div class="stars">
              <span
                v-for="star in 5"
                :key="star"
                :class="{ 'filled-star': star <= review.stars, 'empty-star': star > review.stars }"
              >
                &#9733;
              </span>
            </div><br>
            {{ review.nome }} - Data: {{ review.date }}
          </label>
          <br><br>
          <p class="descricao">{{ review.descricao }}</p>
          <br>
        </fieldset><br>
      </div>
      <div class="Posittion-button">
        <button v-if="visibleAvaliacao.length < avaliacao.length" @click="showMoreFields">Mostrar Mais</button>
     </div>
    </div>
  </template>
  
  <script>
  import api from './../../services/backend.service.js';
  import dataFormat from './../../services/dataToDiaMesAno.service.js';
  import ComponentMessage from './../Message.vue';
  export default {
    components: {
      ComponentMessage
    },
    name: "Classificacao",
    data() {
      return {
        avaliacao: [], // Array de avaliações
        MediaNt: 0, // Média que vem do banco
        visibleAvaliacao: [], // Array para armazenar as avaliações visíveis
        numToShow: 6, // Número inicial de avaliações para mostrar
        mostrarMensagem: false,
        tituloMsg: "",
        mensagemPUser: "",
      };
    },
    methods: {
      showMoreFields() {
        this.numToShow += 6;
        this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow);
      },
      mostrarmensagemPUser() {
        this.tituloMsg = "Aviso!"
        this.mensagemPUser = "Seu estabelecimento não possui avaliações!!"
        this.mostrarMensagem = true;
      },
      fecharMensagem() {
        this.mostrarMensagem = false;
        this.$router.push('/AreaDoEstabelecimento');
      },
    },
    async created() {
      try {
        if(sessionStorage.getItem('idEstabelecimento')) {
          const avaliacoesRequest = await api.get(`/avaliacao/estabelecimento/${sessionStorage.getItem('idEstabelecimento')}`);

          if (avaliacoesRequest.data.notaEstabelecimento && avaliacoesRequest.data.notaEstabelecimento[0] && typeof avaliacoesRequest.data.notaEstabelecimento[0].nota === 'number') {
            const avaliacoes = avaliacoesRequest.data.avaliacao;
            for (let i=0; i < avaliacoes.length ; i++) {
              avaliacoes[i].date = dataFormat(avaliacoes[i].data);
            }
            this.avaliacao = avaliacoes;
            this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow); // exibe as 4 primeiras avaliações
            this.MediaNt = avaliacoesRequest.data.notaEstabelecimento[0].nota;
          }else{
            this.mostrarmensagemPUser()
          }
        }
      } catch (error) {
        console.log('Erro ao buscar avaliações do estabelecimento: ', error);
      }
    }
  };
  </script>
  
  <style scoped>
  fieldset {
      border: 2px solid #ff9800;
      border-radius: 20px;
      padding: 10px;
      margin-bottom: 20px;
      background-color: rgba(255, 255, 255, 0.678);
      box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px;
      max-width: 800px;
      margin: 0 auto;
  }
  
  .titulo {
      font-weight: bold;
      color: #f50000;
      font-size: 20px;
  }
  
  .avaliacao {
      display: flex;
      align-items: center;
      justify-content: center;
  }
  
  .stars {
      display: flex;
  }

  button{
    background-color: #e91e2f; 
    color: #000; 
    font-size: 16px; 
    padding: 10px 15px; 
    border: none; 
    border-radius: 25px; 
    cursor: pointer;
    margin: 0 auto; 
  }
 
  button:hover {
    background:#ff9800;
  }
  
  .Posittion-button {
  display: flex;
  justify-content: center; /* Centraliza horizontalmente */
  align-items: center; /* Centraliza verticalmente */

}
  
  .filled-star,
  .nota {
      color: yellow;
  }
  
  .empty-star {
      color: grey;
  }
  
  .customer-info {
      margin-left: 10px;
      font-weight: bold;
      color: #fff;
      font-size: 35px;
      text-align: center;
  }
  
  .descricao {
      margin-top: 5px;
  }
  </style>
  