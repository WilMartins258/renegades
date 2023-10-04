<template>
  <h1 class="gradient">Better Choice!</h1>
  <h3>Mais Recomendados!!</h3>
  <CombinedCarousel /><br><br>
  <Filtro />
</template>
  
<script>
import CombinedCarousel from "../Home/ComponentsChild/Carousel.vue";
import Filtro from "../Home/ComponentsChild/Filtro.vue";
import api from "./../../services/backend.service.js";

export default {
  name: "TelaHome",
  components: {
    CombinedCarousel,
    Filtro,
  },
  created() {
	  this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      console.log('metodoInicial da HOME');
    }
  }
};

</script>

<style scoped>
@import url('https://fonts.cdnfonts.com/css/nickainley');

.gradient {
  background-image: linear-gradient(to bottom, #df8600, #db3240, #ff0015);
  color: black;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}


h1 {
  color: #fff;
  font-family: 'Nickainley', sans-serif;
  font-size: 3em;
}

h3 {
  color: #fff;
}
</style>