<template>
    <div class="main-container">
      <Classificacao/>
    </div>
  
  </template>
  
  <script>
  import Classificacao from "../../components/Estabelecimento/Classificacao.vue"
  
      export default{
          name: "AvaliacaoEstabelecimento",
          components:{
            Classificacao,
          }
      };
  
  </script>