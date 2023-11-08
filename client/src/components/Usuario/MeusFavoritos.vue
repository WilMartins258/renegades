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
                <th>Remover favorito</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(estabelecimento, index) in estabelecimentos" :key="index">
                <td>
                  <span class="star">★</span>
                </td>
                <td>{{ estabelecimento.nome }}</td>
                <td>
                  <a :href="estabelecimento.link">Acessar</a>
                </td>
                <td class="text-center">
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
        try {
          const favoritos = await api.get(`/favorito/${sessionStorage.getItem('idUsuario')}`);

          for (let i = 0; i < favoritos.data.length ; i++) {
            favoritos.data[i].link = `http://localhost:8080/PaginaEstabelecimento/${favoritos.data[i].idEstabelecimento}`;
          } 
          
          this.estabelecimentos = favoritos.data;
        } catch (error) {
          console.error('Erro ao buscar favoritos do usuário:: ', error);
        }
      },
      async removerFavorito(favorito) {
        const confirmacao = window.confirm('Tem certeza de que deseja remover este favorito?');

        if (confirmacao) {
          try {
            await api.delete(`/favorito/${favorito.id}`);

            // Encontra o índice do favorito no array
            const index = this.estabelecimentos.findIndex((e) => e.id === favorito.id);
            if (index !== -1) {
              // Remova o favorito ddo array
              this.estabelecimentos.splice(index, 1);
            }
            
          } catch (error) {
            console.log('Erro ao excluir favorito:: ', error);
          }
        }
      },
    },
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

.text-center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
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