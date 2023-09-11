<template>
        <h1>Better Choice!</h1>
      <h3>Mais Recomendados!!</h3>
      <CombinedCarousel/><br><br>
      <Filtro/>
  
  
  </template>
  
  <script>
  import CombinedCarousel from "../Home/ComponentsChild/Carousel.vue"
  import Filtro from "../Home/ComponentsChild/Filtro.vue"
      export default{
          name: "TelaHome",
          components:{
            CombinedCarousel,
            Filtro,
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