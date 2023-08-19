<template>
  <div class="carousel">
    <transition name="slide-fade" mode="out-in">
      <div :key="currentIndex" class="carousel-item">
        <img :src="currentItem" alt="Carousel Item" />
      </div>
    </transition>
    <button @click="prevItem">Anterior</button>
    <button @click="nextItem">Próximo</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        'http://www.canillanches.com.br/fotos/chesse-salada.jpg',
        'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt615f228ef4156c3e/6336fdf6ed53a81b9a54de13/McBRASIL-Alemanha_OK_V3.jpg?auto=webp&format=pjpg&width=1080&quality=60',
        'http://www.canillanches.com.br/fotos/chesse-salada.jpg',
      ],
      currentIndex: 0,
    };
  },
  computed: {
    currentItem() {
      return this.items[this.currentIndex];
    },
  },
  methods: {
    prevItem() {
      this.currentIndex = (this.currentIndex - 1 + this.items.length) % this.items.length;
    },
    nextItem() {
      this.currentIndex = (this.currentIndex + 1) % this.items.length;
    },
  },
};
</script>

<style scoped>
.carousel {
  position: relative;
  max-width: 600px;
  margin: 0 auto;
}

.carousel-item {
  position: absolute;
  width: 100%;
  height: auto;
}

.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: opacity 0.5s;
}

.slide-fade-enter, .slide-fade-leave-to {
  opacity: 0;
}
</style>
