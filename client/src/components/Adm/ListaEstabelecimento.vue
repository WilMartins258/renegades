<template>
  <div>
    <h1>Lista de Estabelecimentos</h1>
    <div class="container">
      <fieldset>
        <legend>Informe aqui o nome do estabelecimento:</legend>
        <input type="text" v-model="searchQuery" placeholder="Pesquisar estabelecimento">
      </fieldset>
      <div class="radio-buttons">
       <br>
        <fieldset>
          <legend>Filtro</legend>
          <label>
            <input type="radio" v-model="filtro" value="pendente" checked> Pendente
          </label>
          <label>
            <input type="radio" v-model="filtro" value="validado"> Validado
          </label>
          <label>
            <input type="radio" v-model="filtro" value="naoValidado"> Não Validado
          </label>
        </fieldset>
      </div>
      <div class="table-container">
        <br><table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Nome</th>
              <th>Status</th>
              <th>Perfil</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(estabelecimento, index) in estabelecimentosFiltrados" :key="index">
              <td>{{ estabelecimento.id }}</td>
              <td>{{ estabelecimento.nome }}</td>
              <td>{{ estabelecimento.status }}</td>
              <td>
                <a :href="estabelecimento.link">Acessar</a>
              </td>
              <td class="ativDesativ-buttons">
                <button v-if="estabelecimento.status === 'Pendente'" @click="ativarEstabelecimento(index)"><i class="uil uil-check"></i></button>
                <button v-if="estabelecimento.status === 'Pendente'" @click="inativarEstabelecimento(index)"><i class="uil uil-times"></i></button>
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
  name: "ListaEstabelecimentos",
  data() {
    return {
      estabelecimentos: [],
      searchQuery: "",
      filtro: "pendente",
    };
  },
  methods: {
    pesquisar() {
      // Lógica para filtro
    },
    ativarEstabelecimento(index) {
      // Lógica para ativar o estabelecimento (usar this.estabelecimentos[index])
    },
    inativarEstabelecimento(index) {
      // Lógica para inativar o estabelecimento (usar this.estabelecimentos[index])
    },
  },
  mounted() {
    this.estabelecimentos = [
      { id: 1, nome: "Estabelecimento X", link: "/atulestabelecimento", status: "Pendente" },
      { id: 2, nome: "Estabelecimento Y", link: "/atulestabelecimento", status: "Validado" },
      { id: 3, nome: "Estabelecimento Z", link: "/atulestabelecimento", status: "Não Validado" },
      { id: 4, nome: "Estabelecimento G", link: "/atulestabelecimento", status: "Pendente" },
      { id: 5, nome: "Estabelecimento H", link: "/atulestabelecimento", status: "Validado" },
      { id: 6, nome: "Estabelecimento P", link: "/atulestabelecimento", status: "Não Validado" },
    ];
  },
  computed: {
    estabelecimentosFiltrados() {
      const query = this.searchQuery.toLowerCase();
      return this.estabelecimentos.filter((estabelecimento) => {
        const nome = estabelecimento.nome.toLowerCase();
        const status = estabelecimento.status.toLowerCase();

        if (this.filtro === "pendente" && estabelecimento.status !== "Pendente") {
          return false;
        }
        if (this.filtro === "validado" && estabelecimento.status !== "Validado") {
          return false;
        }
        if (this.filtro === "naoValidado" && estabelecimento.status !== "Não Validado") {
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
    
  a{
      color: #000;
      font-weight: bold;
  }
  .ativDesativ-buttons button {
    margin-right: 10px;
  }
  
  </style>