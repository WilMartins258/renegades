<template>
  <div class="main-container">
    <login-user />
  </div>
</template>

<script>
import LoginUser from "../components/LoginUser.vue";
import LoginSignUp from "../components/LoginSignUp.vue";

export default {
  name: "Login",
  components: {
    LoginUser,
  },
};
</script>

<style src="../Style/StyleLogin.css">
body {
  margin: 0;
  color: #ffffff;
  background: #ffffff;
  font: 600 16px/18px "Open Sans", sans-serif;
}

*,
:after,
:before {
  box-sizing: border-box;
}

.clearfix:after,
.clearfix:before {
  content: "";
  display: table;
}

.clearfix:after {
  clear: both;
  display: block;
}

a {
  color: inherit;
  text-decoration: none;
}</style>