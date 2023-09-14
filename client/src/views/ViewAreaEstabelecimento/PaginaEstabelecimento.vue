<template>
    <div class="main-container">
      <DetalhaPagEstabelecimento/>
    </div>
  
  </template>
  
  <script>
  import DetalhaPagEstabelecimento from "../../components/Estabelecimento/DetalhaPagEstabelecimento.vue"
  
      export default{
          name: "PaginaEstabelecimento",
          components:{
            DetalhaPagEstabelecimento,
          }
      };
  
  </script>