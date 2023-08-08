<template>
    <div class="main-container">
      <AreaDoEstabelecimento/>
    </div>
  
  </template>
  
  <script>
  import AreaDoEstabelecimento from "../../components/Estabelecimento/AreaDoEstabelecimento.vue"
  
      export default{
          name: "Estabelecimento",
          components:{
            AreaDoEstabelecimento,
          }
      };
  
  </script>