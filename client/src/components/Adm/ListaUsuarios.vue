<template>
    <div>
      <h1>Lista de Usuários</h1>
      <div class="container">
       
        <fieldset>
            <legend>Informe aqui o nome do usuário:</legend>
            <input type="text" v-model="searchQuery" placeholder="Pesquisar usuário">
        </fieldset>
        <br>
          <div class="radio-buttons">
            <fieldset>
                <legend>Filtro</legend>
                <label>
                <input type="radio" v-model="filtro" value="ativos" checked> Ativos
            </label>
            <label>
                <input type="radio" v-model="filtro" value="inativos"> Inativos
            </label>
            <label>
                <input type="radio" v-model="filtro" value="todos"> Todos
            </label> 
            </fieldset>
          </div>
     
        <div class="table-container">
            <br><table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Ativo</th>
                <th>Acessar Perfil</th>
              </tr>
            </thead>
            <tbody>
                <tr v-for="(usuario, index) in usuariosFiltrados" :key="index">
                <td>{{ usuario.id }}</td>
                <td>{{ usuario.nome }}</td>
                <td>
                  {{ usuario.ativo ? 'Sim' : 'Não' }}
                </td>
                <td>
                  <a :href="usuario.link">Acessar</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "ListaUsuarios",
    data() {
      return {
        usuarios: [],
        searchQuery: "", // Variável para armazenar a consulta de pesquisa
        filtro: "ativos",
      };
    },
    methods: {
        pesquisar() {
            // Lógica para filtro
        },
    },
    mounted() {
      this.usuarios = [
        { id: 1, nome: "Roberto", link: "/alterausuario", ativo: true },
        { id: 2, nome: "Alberto", link: "/alterausuario", ativo: false },
        { id: 3, nome: "Amanda", link: "/alterausuario", ativo: true },
        { id: 4, nome: "Nayara", link: "/alterausuario", ativo: false },
        { id: 5, nome: "Alberto b.", link: "/alterausuario", ativo: true },
        { id: 6, nome: "Alberto c.", link: "/alterausuario", ativo: false },
      ];
    },
    computed: {
        usuariosFiltrados() {
            const query = this.searchQuery.toLowerCase();
            return this.usuarios.filter((usuario) => {
            const nome = usuario.nome.toLowerCase();
            const ativo = usuario.ativo ? "Sim" : "Não";
            
            if (this.filtro === "ativos" && !usuario.ativo) {
                return false;
            }
            if (this.filtro === "inativos" && usuario.ativo) {
                return false;
            }
            if (this.filtro === "todos" && !nome.includes(query)) {
                return false;
            }
            
            return nome.includes(query);
            });
        },
    },
  };
  </script>
  

  <style scoped>
  /* Estilos para radio-buttons */
 
  .radio-buttons label {
    margin-right: 10px;
  }

  .radio-buttons input[type="radio"] {
    margin-right: 5px;
  }

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

  fieldset {
      border: 2px solid #ff9800;
      border-radius: 20px;
      padding: 10px;
      margin-bottom: 20px;
      background-color: rgba(255, 255, 255, 0.048);
      max-width: 100px;
      margin: 0 auto;
  }

  legend{
    font-weight: bold;
    
  }

  input {
  border: none;
  padding: 8px 60px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
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