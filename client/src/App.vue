<template><div>
  <Navbar :logo="logo_src" :logged="logged"/>
  <router-view @logged="setLogged($event)"/>
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
    //fazer uma logica para setar true para logged quando houver um id de usuario session estorange
    data(){
      return{
        logo_src: "/img/logo.gif",
        logged: false
      }
    },
    watch: {
      $route() {
        if (!this.$route.query.logged) return
        this.logged = this.$route.query.logged === 'true'
        this.$router.replace({ name: this.$route.name, query: {} })
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
    background: url(../public/img/Fundo.jpg) no-repeat center;
    background-size: cover;
    background-attachment: fixed; /* Adicione esta linha */
    /*background-image: radial-gradient(circle at center, #f3ef096b, #61120475);*/
        /*background: url(https://images3.alphacoders.com/836/836644.jpg) no-repeat center;
    background-size: cover;*/
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
