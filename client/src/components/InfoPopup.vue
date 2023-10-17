<template>
    <div class="info-icon">
      <i class="uil uil-question info-icon-i" @click="togglePopup"></i>
      <div class="info-popup" :class="{ 'show-popup': showPopup }">
        <i class="uil uil-times close-icon" @click="closePopup"></i>
        <slot></slot>
      </div>
    </div>
  </template>
  
  <script>
  import 'font-awesome/css/font-awesome.css'
  export default {
    data() {
      return {
        showPopup: false
      };
    },
    methods: {
      togglePopup() {
        this.showPopup = !this.showPopup;
      },
      closePopup() {
        this.showPopup = false;
      }
    }
  };
  </script>
  
  <style scoped>
  /* Estilo para o ícone */
  .info-icon {
    position: relative;
    display: inline-flex;
    align-items: center;
    cursor: pointer;
  }
  .info-icon-i {
    font-size: 25px; /* Defina o tamanho desejado */
    color: #ff0000; /* Defina a cor desejada */
  }
  
  /* Estilo para a caixa flutuante */
  .info-popup {
    position: absolute;
    background-color: #f1f1f1;
    color: #333;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 25px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    display: none;
    z-index: 1;
    width: 200px;
    top: 40px;
    left: 0;
  }
  
  .show-popup {
    display: block;
    font-weight: bold;
  }
  
  /* Estilo para o ícone de fechamento */
  .close-icon {
    position: absolute;
    top: 5px;
    right: 5px;
    cursor: pointer;
    font-size: 20px; /* Defina o tamanho desejado */
    color: #ff0000; /* Defina a cor desejada */
  }
  </style>
  