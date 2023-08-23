<template>
  <div class="title">
    <h1>The Better Choice!</h1>
    <Filtro />
  </div>
</template>

<script>

import Filtro from "../Home/Componentes/Filtro.vue";
import CombinedCarousel from "./Componentes/Carousel.vue";
export default {
     name: "TelaHome",
     components:{
      Filtro,
      CombinedCarousel,
    },
}
</script>

<style scoped>

.title {
  text-align: center;
  margin: 20px 0;
}

h1{
  color: #fff;
}


</style>