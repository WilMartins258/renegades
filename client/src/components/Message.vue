<template>
  <div class="message-overlay">
    <div class="message-box">
      <div class="alertHeader">
        <h2>{{ title }}</h2>
      </div>
      <div class="alertBody">
        <p>{{ message }}</p>
      </div>
      <div class="alertFooter">
        <button @click="closeMessage">OK</button>
      </div>
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
.message-overlay {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
}

.message-box {
  width: 300px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  text-align: center;
  border-radius: 25px;
}

.alertHeader {
  background: linear-gradient(to right, #ff9800, #e91e2f); /*degradê. */
  color: #ffffff;
  padding: 10px;
  border-top-left-radius: 25px;
  border-top-right-radius: 25px;
}

h2 {
  font-size: 24px;
  margin: 0;
}

.alertBody {
  padding: 20px;
}

p {
  font-size: 18px;
  margin: 0;
  color: #333;
}

.alertFooter {
  padding: 10px;
}

button {
  background-color: #e91e2f;
  color: #ffffff;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
  border-radius: 25px;
  font-size: 16px;
  margin-top: 10px;
}

button:hover {
  background-color: #ff9800;
}
</style>