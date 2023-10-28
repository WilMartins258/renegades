<template>
  <h1 class="gradient">Better Choice!</h1>
  <h3>Mais Recomendados!!</h3>
  <CombinedCarousel /><br><br>
  <Filtro />
</template>
  
<script>
import CombinedCarousel from "../Home/ComponentsChild/Carousel.vue";
import Filtro from "../Home/ComponentsChild/Filtro.vue";
import api from "./../../services/backend.service.js";

export default {
  name: "TelaHome",
  components: {
    CombinedCarousel,
    Filtro,
  },
  async created() {
    try {
      if (sessionStorage.getItem('idUsuario')) {
        console.log("está logado");
        const localizacaoUsuarioRequest = await api.get(`/usuario/localizacao/${sessionStorage.getItem('idUsuario')}`);
        console.log("localizacaoUsuarioRequest:: ", localizacaoUsuarioRequest);
      } else {
        try {
          if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(
              async (position) => {
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                // const salvarLocalizacaoUsuario = await api.post('/usuario/localizacao');

                console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
              },
              (error) => {
                switch (error.code) {
                  case error.PERMISSION_DENIED:
                    console.log("Usuário rejeitou a solicitação de geolocalização.");
                    break;
                  case error.POSITION_UNAVAILABLE:
                    console.log("Informações de localização indisponíveis.");
                    break;
                  case error.TIMEOUT:
                    console.log("A solicitação de geolocalização expirou.");
                    break;
                  case error.UNKNOWN_ERROR:
                    console.log("Ocorreu um erro desconhecido ao obter a localização.");
                    break;
                }
              }
            );
          } else {
            console.log("Geolocalização não é suportada pelo seu navegador.");
          }
        } catch (error) {
          console.log('Erro ao solicitar localização através do navegador: ', error);
        }
      }
    } catch (error) {
      console.log('Erro ao verificar localização do usuário: : ', error);
    }
  }
};

</script>

<style scoped>
@import url('https://fonts.cdnfonts.com/css/nickainley');

.gradient {
  background-image: linear-gradient(to bottom, #df8600, #db3240, #ff0015);
  color: black;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}


h1 {
  color: #fff;
  font-family: 'Nickainley', sans-serif;
  font-size: 3em;
}

h3 {
  color: #fff;
}
</style>