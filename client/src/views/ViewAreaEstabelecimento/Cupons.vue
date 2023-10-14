<template>
    <div class="main-container">
        <CuponsAtivos/>
    </div>


  
  </template>
  
  <script>
  import CuponsAtivos from "../../components/Estabelecimento/CuponsAtivos.vue"
  
      export default{
          name: "Cupons",
          components:{
            CuponsAtivos,
          }

          
      };
  
  </script>