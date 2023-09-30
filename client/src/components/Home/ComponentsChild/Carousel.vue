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
        slides: [
          {
            id: 1,
            title: 'Slide 1',
            imageSrc: 'https://blog.letskuk.com.br/wp-content/uploads/2022/10/lanches-gourmet.jpg',
          },
          {
            id: 2,
            title: 'Slide 2',
            imageSrc: 'https://img.freepik.com/fotos-gratis/vista-frontal-deliciosas-batatas-fritas-com-cheeseburgers-em-fundo-escuro-lanche-prato-fast-food-torrada-hamburguer-jantar_140725-158687.jpg?w=740&t=st=1692622686~exp=1692623286~hmac=10621949a66dec1c810347ee36096f0b72d67389a49664278c2c51bb11d313e1',
          },
          {
            id: 3,
            title: 'Slide 3',
            imageSrc: 'https://blog.letskuk.com.br/wp-content/uploads/2022/10/lanches-gourmet.jpg',
          },
          {
            id: 4,
            title: 'Slide 4',
            imageSrc: 'https://img.freepik.com/fotos-gratis/vista-frontal-deliciosas-batatas-fritas-com-cheeseburgers-em-fundo-escuro-lanche-prato-fast-food-torrada-hamburguer-jantar_140725-158687.jpg?w=740&t=st=1692622686~exp=1692623286~hmac=10621949a66dec1c810347ee36096f0b72d67389a49664278c2c51bb11d313e1',
          },
        ],
      }
    },
    created() {
	    this.metodoInicial();
    },
    methods: {
      async metodoInicial() {
        try {
        // console.log('metodoInicial da Carousel');

        // const carousel = await api.get('/test');
        // console.log('carousel:: ', carousel);
        // console.log('carousel.data[0]:: ', carousel.data[0]);
        // console.log('carousel.data.length:: ', carousel.data.length);

        // const reconstructedBuffer = Uint8Array.from(carousel.data[0].blobTest).buffer;


        // for (let i = 0; i < carousel.data.length; i++) {
        //     try {
        //       console.log('carousel.data[i].blobTest:: ', carousel.data[i].blobTest);

        //       carousel.data[i].blobTest.data = carousel.data[i].blobTest.data.toString();
                
        //     } catch (error) {
        //         throw new Error(`Erro ao decodificar imagens: ${error.message}`);
        //     }
        // };

        // console.log('carousel.data pós:: ', carousel.data);
        } catch (error) {
          console.error('ERROR:: ', error);
        }
      },
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
  }
  
  .imageSrc {
    max-width: 100%; /* Ajustar a largura máxima da imagem */
    height: 300px; /* Ajustar a altura automaticamente proporcionalmente à largura */
    margin-bottom: 10px; /* Espaço abaixo da imagem */
  }

  a {
  text-decoration: none;
}
  </style>
  