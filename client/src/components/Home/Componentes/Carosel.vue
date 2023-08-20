<template>
<carousel autoplay="true" >
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="carousel-item-container">
      <img src="https://img.freepik.com/fotos-gratis/hamburguer-grelhado-e-batatas-fritas-ia-geradora-de-alimentos_188544-8516.jpg?w=996&t=st=1692551546~exp=1692552146~hmac=0469b37c7c22e52df0c6b957224475f559df4a157f30d5990b25b3f0f799fa2d" alt="Image 1">
      <h3>Image 1</h3>
      </div>
    </div>


      <div class="carousel-item active">
      <div class="carousel-item-container">
      <img src="https://scontent.fcpq1-1.fna.fbcdn.net/v/t39.30808-6/334932779_5861728240589801_3487452620897447473_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=-9jpVelPv00AX8iG-Jy&_nc_ht=scontent.fcpq1-1.fna&oh=00_AfBEu_nqi_tLC9_WCQ8rPPIKmJcAwZH0wON4SLhRKn5jtg&oe=64E70791" alt="Image 2">
      <h3>Image 2</h3>
      </div>
    </div>


      <div class="carousel-item active">
      <div class="carousel-item-container">
      <img src="https://img.freepik.com/fotos-gratis/vista-frontal-delicioso-hamburguer-de-carne-com-tomate-vermelho-em-fundo-escuro_179666-19345.jpg?w=900&t=st=1692551686~exp=1692552286~hmac=e21607291413d58aaeaf0acae56d1393b6f4fc908aed80b137f51b099e4886f7" alt="Image 3">
      <h3>Image 3</h3>
      </div>
    </div>


      <div class="carousel-item active">
      <div class="carousel-item-container">
      <img src="https://img.freepik.com/fotos-gratis/delicioso-sanduiche-caseiro-e-batatas-fritas-com-ketchup-nuggets-de-frango-no-quadro-negro-sobre-superficie-cinza_179666-42499.jpg?t=st=1692551546~exp=1692552146~hmac=bc1d666acda7d43606848e8b01f40352048fc7937427861d5d4b4004df4b1687" alt="Image 3">
      <h3>Image 4</h3>
      </div>
    </div>


    
      <div class="carousel-item active">
        <div class="carousel-item-container">
      <img src="https://img.freepik.com/fotos-premium/cola-e-hamburgueres-gerados-por-ia_406939-10481.jpg?w=900"  alt="Image 3">
      <h3>Image 5</h3>
      </div>
    </div>


      <div class="carousel-item active">
        <div class="carousel-item-container">
      <img src="https://img.freepik.com/fotos-premium/sanduiche-de-presunto-e-queijo-grelhado-com-queijo-e-presunto-na-grelha_434193-1423.jpg?w=900" alt="Image 3">
      <h3>Image 6</h3>
      </div>
    </div>
    
   </div>
  </carousel>
  </template>

<script>
export default {
  data() {
    return {

    };
  },

};
</script>

<style scoped>
.carousel {
  width: 100%;
  height: 100%;
  position: relative;
}

.carousel-inner {
  display: flex;
  justify-content: space-around;
  transition: 0.5s;
}

.carousel-item {
  width: 20%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.carousel-item img {
  max-width: 70%;
  max-height: 100%;
}

.carousel-item.active {
  z-index: 1;
}

.carousel-control-prev,
.carousel-control-next {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background-color: rgba(0, 0, 0, 0.5);
}

.carousel-control-prev {
  left: 0;
}

.carousel-control-next {
  right: 0;
}

.carousel-control-icon {
  display: block;
  width: 100%;
  height: 100%;
}

.carousel-item-container {
  text-align: center; 
}
</style>