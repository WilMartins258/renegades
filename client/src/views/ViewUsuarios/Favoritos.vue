<template>
    <div class="main-container">
      <MeusFavoritos/>
    </div>
  
  </template>
  
  <script>
  import MeusFavoritos from "../../components/Usuario/MeusFavoritos.vue"
  
      export default{
          name: "Favoritos",
          components:{
            MeusFavoritos,
          }
      };
  
  </script>