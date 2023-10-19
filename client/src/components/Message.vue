<template>
    <div class="message-overlay">
      <div class="message-box">
        <h2>{{ title }}</h2>
        <p>{{ message }}</p>
        <button @click="closeMessage">OK</button>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      title: String,
      message: String,
    },
    methods: {
      closeMessage() {
        this.$emit('close');
      },
    },
  };
  </script>


<style scoped>
.welcome-message {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 999;
}

.message-box {
  background-color: white;
  padding: 20px;
  text-align: center;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

button {
  background-color: #e91e2f;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  border-radius: 5px;
  margin-top: 10px;
}


.message-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 999;
}

.message-box {
  background-color: white;
  padding: 20px;
  text-align: center;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

p {
  font-size: 18px;
  margin-bottom: 20px;
}

button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  border-radius: 5px;
  font-size: 16px;
  margin-top: 10px;
}

</style>