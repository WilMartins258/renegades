<template>
  <div class="filters">
    <button v-for="filter in filters" :key="filter" @click="selectFilter(filter)">
      {{ filter }}
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedFilter: null,
      filters: ["Bar", "Pizzaria", "Hamburgueria", "Lanchonete"],
    };
  },
  methods: {
    selectFilter(filter) {
      this.selectedFilter = filter;
      // Emit an event or call a function to update the establishment list
    },
  },
};
</script>

<style scoped>
.filters {
  display: flex;
  justify-content: center;
  margin: 20px 0;
}

button {
  margin: 0 10px;
  padding: 5px 10px;
  background-color: #f0f0f0;
  border: 1px solid #ddd;
  border-radius: 5px;
  cursor: pointer;
}
</style>