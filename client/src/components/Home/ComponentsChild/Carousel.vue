<template>
  <Carousel v-bind="settings" :breakpoints="breakpoints" :autoplay="2000" :wrap-around="true">
    <Slide v-for="slide in slides" :key="slide.id">
      <router-link :to="getSlideLink(slide.id)" class="carousel__item-link">
        <div class="carousel__item">
          <div class="fundo">
            <img :src="slide.imageSrc" :alt="slide.title" class="imageSrc">
            <h2>{{ slide.title }}</h2>
          </div>
        </div>
      </router-link>
    </Slide>
    <template #addons>
      <Navigation />
    </template>
  </Carousel>
</template>
  
  <script>
  import { defineComponent } from 'vue'
  import { Carousel, Navigation, Slide } from 'vue3-carousel'
  import api from "./../../../services/backend.service.js";
  
  import 'vue3-carousel/dist/carousel.css'
  
  export default defineComponent({
    name: 'CombinedCarousel',
    components: {
      Carousel,
      Slide,
      Navigation,
    },
    data() {
      return {
        settings: {
          itemsToShow: 1,
          snapAlign: 'center',
        },
        breakpoints: {
          700: {
            itemsToShow: 3.5,
            snapAlign: 'center',
          },
          1024: {
            itemsToShow: 5,
            snapAlign: 'start',
          },
          1033: {
            itemsToShow: 3,
            snapAlign: 'start',
          },
  
        },
        slides: []
      }
    },
    async created() {
      try {
        // Retorna os 10 estabelecimentos com as maiores notas do banco de dados
        const estabelecimentosCarousel = await api.get('/estabelecimento/carousel');

        for (let i = 0; i < estabelecimentosCarousel.data.length; i++) {
          
          let fotoEstabelecimento = false;
          try {
            require(`./../../Estabelecimento/images/${estabelecimentosCarousel.data[i].id}.${estabelecimentosCarousel.data[i].formatoFoto}`);
            fotoEstabelecimento = true;
          } catch (error) {}

          if (fotoEstabelecimento) {
            estabelecimentosCarousel.data[i].imageSrc = require(`./../../Estabelecimento/images/${estabelecimentosCarousel.data[i].id}.${estabelecimentosCarousel.data[i].formatoFoto}`);
          } else {
            estabelecimentosCarousel.data[i].imageSrc = require(`./../../Estabelecimento/images/sem-imagem.${estabelecimentosCarousel.data[i].formatoFoto}`);
          }
        };

        this.slides = estabelecimentosCarousel.data;
      } catch (error) {
        console.log('Erro ao buscar estabelecimentos do Carousel:: ', error);
      }
    },
    methods: {
      getSlideLink(slideId) {
        // Retorna o link com base no ID do slide
        return { name: 'PaginaEstabelecimento', params: { id: slideId } };
      },
    }
  })
  </script>
  
  <style scoped>
  h1{
    color: #fff;
  }
  .carousel__item {
    text-align: center; 
    color: #fff;
  }
  
  .fundo {
    background: linear-gradient(to right, rgba(233, 30, 47, 0.5), rgba(255, 152, 0, 0.5));
    border-radius: 25px;
  }
  
  .imageSrc {
    width: 400px; /* Ajustar a largura máxima da imagem */
    height: 300px; /* Ajusta a altura máxima da imagem */
    margin-bottom: 10px; /* Espaço abaixo da imagem */
    border-radius: 25px;
  }

  a {
  text-decoration: none;
}

/*Responsive*/

@media (max-width: 1160px) {
    .imageSrc {
      width: 300px; 
      height: 200px;
    }
  }

  @media (max-width: 950px) {
    .imageSrc {
      width: 230px; 
      height: 130px;
    }

    h2{
      font-size: 16px;
    }
  }

  @media (max-width: 768px) {
    .imageSrc {
      width: 180px; 
      height: 90px;
    }

    h2{
      font-size: 12px;
    }
  }

  @media (max-width: 600px) {
    .imageSrc {
      width: 300px; 
      height: 200px;
    }

    h2{
      font-size: 18px;
    }
  }

  @media (max-width: 414px) {
    .imageSrc {
      width: 300px; 
      height: 200px;
    }
  }
  </style>
  