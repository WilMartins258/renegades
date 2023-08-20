<template>
  <div class="home">
    <Title />
    <Filters />
    <Carousel />
    <div class="establishment-list">
      <EstablishmentCard v-for="establishment in filteredEstablishments" :key="establishment.id" :establishment="establishment" />
    </div>
  </div>
</template>

<script>
import Title from "../Home/Componentes/Titulo.vue";
import Filters from "../Home/Componentes/Filtro";
import Carousel from "../Home/Componentes/Carosel.vue";
import EstablishmentCard from "../Home/Componentes/Card";
export default {
    components: {
    Title,
    Filters,
    Carousel,
    EstablishmentCard,
  },
     name: "TelaHome",

     data() {
    return {
      establishments: [], // Your establishment data
      selectedFilter: null,
    };
  },
  computed: {
    filteredEstablishments() {
      if (!this.selectedFilter) {
        return this.establishments;
      } else {
        return this.establishments.filter(
          (establishment) => establishment.type === this.selectedFilter
        );
      }
    },
  },
};
</script>

<style>

.home {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}
.establishment-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

</style>