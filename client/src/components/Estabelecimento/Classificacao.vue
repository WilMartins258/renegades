<template>
    <div>
      <div class="avaliacao">
        <div class="customer-info">
          Minha nota é:<br>
          <span class="nota"> {{ MediaNt }} </span>
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
            {{ review.username }} - Data: {{ review.date }}
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
  export default {
    name: "Classificacao",
    data() {
      return {
        avaliacao: [], // Array de avaliações
        MediaNt: 0, // Média que vem do banco
        visibleAvaliacao: [], // Array para armazenar as avaliações visíveis
        numToShow: 6, // Número inicial de avaliações para mostrar
      };
    },
    methods: {
      showMoreFields() {
        // exibe mais 4 campos
        this.numToShow += 6;
        this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow);
      },
    },
    mounted() {
      this.avaliacao = [ // valores que serão substituídos pelos do BD
        {
          stars: 4,
          username: "João da Silva",
          date: "20/09/2023",
          descricao: "Excelente experiência no estabelecimento. Ótimo atendimento e comida deliciosa."
        },
        {
          stars: 3,
          username: "Roberto Alberto",
          date: "18/09/2023",
          descricao: "Excelente estabelecimento. Ótimo atendimento"
        },

        {
          stars: 5,
          username: "Silvio",
          date: "15/08/2023",
          descricao: "O melhor lugar que já fui!!!"
        },

        {
          stars: 1,
          username: "Nayara",
          date: "14/07/2023",
          descricao: "Simplesmente péssimo!"
        },

        {
          stars: 2,
          username: "Amanda",
          date: "14/07/2023",
          descricao: "péssimo!"
        },
        
      ];
  
      this.MediaNt = 5; // Irá passar aqui o valor da média
      this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow); // exibe as 4 primeiras avaliações
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
  