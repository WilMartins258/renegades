<template>
    <div class="container">
      <h1 class="title">Área do Anunciante</h1><br><br><br>
      <div class="card-container">
        <router-link to="/CadAnuncio" class="card">
          <img
            src="https://plenarinho.leg.br/wp-content/uploads/2020/11/destaque-publicidade-infantil.jpeg"
            alt="Novo Anúncio"
            class="card-image"
          />
          <div class="description">Criar um anúncio</div>
        </router-link>
  
        <router-link to="/link2" class="card">
          <img
            src="https://ms-publico.s3-sa-east-1.amazonaws.com/cms/post/2017/03/lupa_org_20170315094946.png"
            alt="Consultar"
            class="card-image"
          />
          <div class="description">Consultar meus anuncios</div>
        </router-link>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "AreaAnuncio",
  };
  </script>
  
  <style scoped>
  .container {
    text-align: center;
  }
  
  .title {
    margin-top: 20px;
  }
  
  .card-container {
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
  }
  
  .card {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 300px;
    border: 1px solid #6e55b9;;
    border-radius: 26px;
    padding: 10px;
    text-decoration: none;
    color: #333;
    margin-right: 10px;
    box-shadow: 4px 4px 4px #858585, 4px 4px 4px #858585;
    margin-right: 25px;
  }
  
  .card:hover {
    box-shadow: 0 0 5px #aaa;
    transform: scale(1.1);
    transition-duration: .9s;
    background-color: #6e55b9;;
  }
  
  .card-image {
    width: 100%;
    height: 150px; 
    border-radius: 16px;
  }
  
  .card .description {
    margin-top: 15px;
  }

  /*Responsive*/

@media screen and (max-width: 1160px) {
  .card-container {
    flex-wrap: wrap;
    justify-content: center;
    margin-right: -25px;
  }
  
  .card {
    margin-right: 0;
    margin-bottom: 20px;
    margin-right: 15px;
  }
}

@media screen and (max-width: 950px) {
  .card {
    width: 45%;
  }
}

@media screen and (max-width: 768px) {
  .card {
    width: 100%;
  }
}

@media screen and (max-width: 600px) {
  .card-container {
    flex-direction: column;
    align-items: center;
  }
  
  .card {
    width: 60%;
    margin-bottom: 20px;
  }

  .card-image {
    width: 90%;
    height: 100px; 
    border-radius: 16px;
  }
}

@media screen and (max-width: 350px) {
  .card {
    width: 90%;
  }

  
}

  </style>
  