<template>
  <div class="main-container">
    <TelaHome/>
  </div>

</template>

<script>
import TelaHome from "../components/Home/TelaHome.vue"

    export default{
        name: "HomeView",
        components:{
          TelaHome,
        }
    };

</script>