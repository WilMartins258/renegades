<template>
    <div class="container">
      <h1 class="title">Area do ADM</h1><br><br><br>
      <div class="card-container">
        <div class="card-row">
          <router-link to="alterausuario" class="card">
            <img
              src="../../../public/img/MeusDados.png"
              alt="Meus Dados"
              class="card-image"
            />
            <div class="description">Meus Dados</div>
          </router-link>
  
          <router-link to="/gerenciacategoria" class="card">
            <img
              src="../../../public/img/GerenciarCategorias.jpg"
              alt="Meus Anuncios"
              class="card-image"
            />
            <div class="description">Gerenciar Categoria</div>
          </router-link>
  
          <router-link to="/gerenciamusicas" class="card">
            <img
              src="../../../public/img/GerenciarMusicas.jpg"
              alt="Favoritos"
              class="card-image"
            />
            <div class="description">Gerenciar Estilos de Música</div>
          </router-link>
            
        </div>
  
        <div class="card-row">
        <router-link to="/CadUsuario" class="card">
            <img
              src="../../../public/img/AddNewUser.png"
              alt="Favoritos"
              class="card-image"
            />
            <div class="description">Cadastar um novo Usuário</div>
          </router-link>            
          <router-link to="/" class="card">
            <img
              src="../../../public/img/listaDeUsuarios.png"
              alt="lista De Usuarios"
              class="card-image"
            />
            <div class="description">Lista de Usuário</div>
          </router-link>
          <router-link to="/" class="card">
            <img
              src="../../../public/img/listaDeEstabelecimento.png"
              alt="lista De Estabelecimento"
              class="card-image"
            />
            <div class="description">Lista de Estabelecimentos</div>
          </router-link>
        </div>
      </div>
    </div>
  </template>
  
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
    color: #fff;
    margin-right: 10px;
    box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px ;
    margin-right: 25px;
  }
  
  .card:hover {
    box-shadow: 0 0 5px #aaa;
    transform: scale(1.1);
    transition-duration: 0.9s;
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
  
  /* Responsive */
  @media screen and (max-width: 1160px) {
    .card-row {
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
  
    .card-row {
      flex-wrap: wrap;
      justify-content: center;
      margin-bottom: 20px;
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
  