<template>
  <div class="main-container">
    <div id="form-wrap" class="form">
      <div class="posicaoform-wrap">
          <h2>Meu Cadastro</h2><br>
      </div> <!-- Fechar "posicaoform-wrap" -->
    </div> <!-- Fechar "form-wrap" -->
  </div> <!-- Fechar "posicaoform-wrap" -->
</template>

<script>
export default {
  name: "AddUsuario",
};
</script>

<style scoped>
#form-wrap {
  background-image: url("../../../public/img/FormUsuario.jpg");
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  width: 100%;
  height: 100vh;
  background-size: 28%;
}
</style>