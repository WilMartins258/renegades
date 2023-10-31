<template>
    <div class="container">
      <h1 class="title">Área do Estabelecimento</h1><br><br><br>
      <div class="card-container">
        <div class="card-row">
        <router-link to="/alterausuario" class="card">
          <img
            src="../../../public/img/MeusDados.png"
            alt="Meus Dados"
            class="card-image"
          />
          <div class="description">Meus Dados</div>
        </router-link>
  
        <router-link to="/atulestabelecimento" class="card">
          <img
            src="../../../public/img/MeuEstabelecimento.png"
            alt="Atualizar dados"
            class="card-image"
          />
          <div class="description">Meu Estabelecimento</div>
        </router-link>
        <router-link to="/promocao" class="card">
          <img
            src="../../../public/img/Promocao.png"
            alt="Minhas promoções"
            class="card-image"
          />
          <div class="description">Minhas Promoções</div>
        </router-link>
      </div>
      <div class="card-row">
        <router-link to="/avaliacaoestabelecimento" class="card">
          <img
            src="../../../public/img/Avaliacao.png"
            alt="Como estou avaliado"
            class="card-image"
          />
          <div class="description">Minhas Avaliações</div>
        </router-link>

                <router-link to="/favoritos" class="card">
          <img
            src="../../../public/img/Favoritos.jpg"
            alt="Meus Favoritos"
            class="card-image"
          />
          <div class="description">Favoritos</div>
        </router-link>
      </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "AreaDoEstabelecimento",
  };
  </script>
  
  <style scoped>
  .container {
    text-align: center;
  }
  
  .title {
    margin-top: 20px;
    color: #fff;
  }
  
  .card-container {
    display: flex;
  flex-direction: column;
  align-items: center;
  font-weight: bold;
  }

  .card-row {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}
  
  .card {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 300px;
    border: 1px solid #ff9800;
    border-radius: 26px;
    padding: 10px;
    text-decoration: none;
    color: #000;
    margin-right: 10px;
    box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px ;
    margin-right: 25px;
    background-color: #ff9900e0;
    font-size: 25px;
  }
  
  .card:hover {
    box-shadow: 0 0 5px #aaa;
    transform: scale(1.1);
    transition-duration: .9s;
    /*background-color: #6e55b9;*/
    background: linear-gradient(to right, #e91e2f, #ff9800); /*degradê. utlizado cores na posição inversa*/

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
  