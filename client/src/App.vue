<template><div>
  <Navbar :logo="logo_src"/>
  <router-view />
  <Footer />
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
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
    font-family: 'Lora', serif;
    padding: 0;
    margin: 0;
    box-sizing: border-box;

  }

  body{
    background: url(https://images3.alphacoders.com/836/836644.jpg) no-repeat center;
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
