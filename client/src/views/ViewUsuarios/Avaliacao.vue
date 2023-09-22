<template>
    <div class="main-container">
      <MinhasAvaliacoes/>
    </div>
  
  </template>
  
  <script>
  import MinhasAvaliacoes from "../../components/Usuario/MinhasAvaliacoes.vue"
  
      export default{
          name: "Avaliacao",
          components:{
            MinhasAvaliacoes,
          }
      };
  
  </script>