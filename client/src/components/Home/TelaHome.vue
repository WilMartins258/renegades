<template>
        <h1>The Better Choice!</h1>
      <h3>Mais Recomendados!!</h3>
      <CombinedCarousel/><br><br>
      <Filtro/>
      <br><br><h1>.</h1><br><br>
      <DashHorAtendimento/>
      <DashRdSociais/>
      <br><br>
      <DashContato/>
      <br><br>
      <Opcionais/>
  
  </template>
  
  <script>
  import CombinedCarousel from "../Home/ComponentsChild/Carousel.vue"
  import Filtro from "../Home/ComponentsChild/Filtro.vue"
  import DashHorAtendimento from "../Estabelecimento/ComponentsChild/DashHorAtendimento.vue"
  import DashRdSociais from "../Estabelecimento/ComponentsChild/DashRdSociais.vue"
  import DashContato from "../Estabelecimento/ComponentsChild/DashContato.vue"
  import Opcionais from "../Estabelecimento/ComponentsChild/Opcionais.vue"
      export default{
          name: "TelaHome",
          components:{
            CombinedCarousel,
            Filtro,
            DashHorAtendimento,
            DashRdSociais,
            DashContato,
            Opcionais
          }
      };
  
  </script>

<style scoped>
h1 {
  color: #fff;
}

h3{
    color: #fff;
}
</style>