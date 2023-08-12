<template>
    <div class="main-container">
      <AddEstabelecimento/>
    </div>
  
  </template>
  
  <script>
  import AddEstabelecimento from "../../components/Estabelecimento/AddEstabelecimento.vue";
  
      export default{
          name: "CadEstabelecimento",
          components:{
            AddEstabelecimento,
          }
      };
  
  </script>

<style src="../../Style/StyleForm.css">

</style>