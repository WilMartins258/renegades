<template><div>
  <Navbar :logo="logo_src"/>
  <router-view />
  <Footer />
</div>
</template>

<script>
  import Navbar from './components/Navbar.vue';
  import Footer from './components/Footer.vue';

  export default{
    components:{
      Navbar,
      Footer
    },
    
    data(){
      return{
        logo_src: "/img/logo.png",
      }
    }
  }
</script>

<style>
  *{
    font-family: Helvetica;
    padding: 0;
    margin: 0;
    box-sizing: border-box;

  }

  body{
    background: url(https://img.elo7.com.br/product/zoom/2BAFCB7/papel-de-parede-infantil-meninos-papel-de-parede-personalizado-para-quarto.jpg) no-repeat center;
  background-size: cover;
  }

  .main-container{
    margin: 50px;
    min-height: 670px;
  }
  
  h1{
    text-align: center;
    font-size: 42px;
    margin-bottom: 30px;
    color: #222;
  }
</style>
