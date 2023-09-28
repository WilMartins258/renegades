<template>
    <div>
      <h1>Meus Favoritos</h1>
      <div class="container">
        <div class="table-container">
          <table>
            <thead>
              <tr>
                <th><span class="star">★</span></th>
                <th>Estabelecimento</th>
                <th>Visitar a página</th>
                <th>Cancelar inscrição</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(estabelecimento, index) in estabelecimentos" :key="index">
                <td>
                  <span class="star">★</span>
                  <!--<span @click="removerFavorito(estabelecimento)" class="star">★</span> verificar se vai cancelar o favorito ao clicar na estrela-->
                </td>
                <td>{{ estabelecimento.nome }}</td>
                <td>
                  <a :href="estabelecimento.link">Acessar</a>
                </td>
                <td>
                  <button @click="removerFavorito(estabelecimento)"><i class="uil uil-times"></i></button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import api from './../../services/backend.service.js'; 

  export default {
    name:"MeusFavoritos",
    data() {
      return {
        estabelecimentos: [],
      };
    },
    created() {
	    this.metodoInicial();
    },
    methods: {
      async metodoInicial() {
        console.log('id do usuário:', sessionStorage.getItem('idUsuario'))

        const favoritos = await api.get(`/favorito/${sessionStorage.getItem('idUsuario')}`);
        console.log('favoritos: ', favoritos.data)

        this.estabelecimentos = [favoritos.data];

      },
      removerFavorito(estabelecimento) {
        // lógica para cancelar o favorito.
      },
    },
    // mounted() {
    //   this.estabelecimentos = [
    //     { id: 1, nome: "Estabelecimento 1", link: "/usuario", favorito: true },
    //     { id: 2, nome: "Estabelecimento 2", link: "/usuario", favorito: true },
    //   ];
    // },
  };
  </script>
  
<style scoped>
.container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.8); 
  white-space: nowrap;
}

.table-container {
  max-height: 300px; /* Ajuste a altura conforme necessário */
  overflow: auto;
}

h1 {
  text-align: center;
  color: #fff;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #ccc;
  padding: 8px;
  text-align: center;
  color: #000;
}

th {
  background-color: #f2f2f2;
}

button {
  background: #e91e2f;
  cursor: pointer;
  transition: 0.5s;
  border: none;
  padding: 8px 20px;
  border-radius: 25px;
  color: #fff;
}

button:hover {
  background: #ff9800;
}

.star {
  font-size: 25px; 
  color: #f0d31d; 
}

a{
    color: #000;
    font-weight: bold;
}
</style>