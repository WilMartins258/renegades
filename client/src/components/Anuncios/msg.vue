<template>
    <div class="message-box" v-if="show">
      <div class="message-box-content">
        <p>{{ message }}</p>
        <div class="buttons">
          <button @click="handleConfirm">Confirmar</button>
          <button @click="handleCancel">Cancelar</button>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      message: {
        type: String,
        required: true,
      },
      onConfirm: {
        type: Function,
        required: true,
      },
      onCancel: {
        type: Function,
        required: true,
      },
      show: {
        type: Boolean,
        required: true,
      },
    },
    methods: {
      handleConfirm() {
        this.onConfirm();
      },
      handleCancel() {
        this.onCancel();
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add styles for the message box here */
  </style>
  