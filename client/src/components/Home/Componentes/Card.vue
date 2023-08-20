<template>
    <div class="establishment-card">
      <div v-for="(establishment, index) in filteredEstablishments" :key="index" class="card">
        <img :src="establishment.image" :alt="establishment.name" class="card-image" />
        <h3 class="card-title">{{ establishment.name }}</h3>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      establishments: Array,
      selectedFilter: String,
    },
    computed: {
      filteredEstablishments() {
        if (!this.selectedFilter) {
          return this.establishments;
        } else {
          return this.establishments.filter(establishment => establishment.type === this.selectedFilter);
        }
      },
    },
  };
  </script>
  
  <style scoped>
  .establishment-card {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .card {
    border: 1px solid #ddd;
    padding: 10px;
    margin: 10px;
    text-align: center;
  }
  
  .card-image {
    max-width: 100%;
    height: auto;
  }
  </style>