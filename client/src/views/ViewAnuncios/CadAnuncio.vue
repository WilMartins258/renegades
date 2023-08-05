<template>
    <div class="main-container">
      <AddAnuncio/>
    </div>
  
  </template>
  
  <script>
  import AddAnuncio from "../../components/Anuncios/AddAnuncio.vue"
  
      export default{
          name: "CadAnuncio",
          components:{
              AddAnuncio,
          }
      };
  
  </script>