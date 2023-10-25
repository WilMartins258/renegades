<template>
    <div class="popup">
      <div class="popup-content">
        <div class="header">
          <h3>{{ title }}</h3>
          <i class="uil uil-times close-icon" @click="closePopup"></i>
        </div>
        <p>{{ description }}</p>
      </div>
    </div>
  </template>
  
  
  <script>
  export default {
    props: {
      title: String,
      description: String,
      show: Boolean,
    },
    methods: {
      closePopup() {
        this.$emit('close');
      },
    },
  };
  </script>
  
  <style scoped>
.popup {
  position: fixed;
  top: -0px;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
  align-items: flex-start;
}

.popup-content {
  background: white;
  padding: 20px;
  border-radius: 25px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  color: #000;
  font-size: 20px; /* Defina o tamanho desejado */
}

.popup button {
  background: #e91e2f;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

h3{
    font-weight: bold;
    color: #000;
}

/* Estilos para o cabeçalho */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.close-icon {
  cursor: pointer;
  color: #e91e2f;
  font-size: 25px;
}
</style>
