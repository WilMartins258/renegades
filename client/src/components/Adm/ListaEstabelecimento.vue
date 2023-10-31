<template>
  <div>
    <h1>Lista de Estabelecimentos</h1>
    <ComponentMessage v-if="mostrarMensagem" :title="tituloMsg" :message="mensagemPUser" @close="fecharMensagem" />
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
                <button v-if="estabelecimento.status === 'Pendente'" @click="ativarEstabelecimento(estabelecimento)"><i class="uil uil-check"></i></button>
                <button v-if="estabelecimento.status === 'Pendente'" @click="inativarEstabelecimento(estabelecimento)"><i class="uil uil-times"></i></button>
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
  name: "ListaEstabelecimentos",
  data() {
    return {
      estabelecimentos: [],
      searchQuery: "",
      filtro: "pendente",
      mostrarMensagem: false,
      tituloMsg: '',
      mensagemPUser: '',
    };
  },
  methods: {
    mostrarmensagemError(msg) {
        this.tituloMsg = "Erro"
        this.mensagemPUser = msg
        this.mostrarMensagem = true;
      },
    
      fecharMensagem() {
        this.mostrarMensagem = false;
      },
    async ativarEstabelecimento(index) {
      if (window.confirm("Confirme a validação deste estabelecimento?")) {
        // Confirmação do usuário
        try {
          const atualizarEstabelecimento = {
            novoStatus: 'Validado',
            id: index.id
          }
          await api.put('/estabelecimento/status', atualizarEstabelecimento);
          this.estabelecimentos[(index.id - 1)].status = "Validado";

        } catch (error) {
          this.mostrarmensagemError(error.response.data.msg);
        }
      }
    },
    async inativarEstabelecimento(index) {
      if (window.confirm("Confirme a invalidação deste estabelecimento?")) {
        try {
          const atualizarEstabelecimento = {
            novoStatus: 'Não Validado',
            id: index.id
          }
          await api.put('/estabelecimento/status', atualizarEstabelecimento);
          this.estabelecimentos[(index.id - 1)].status = "Não Validado";

        } catch (error) {
          this.mostrarmensagemError(error.response.data.msg);
        }
      // Confirmação do usuário
      }
    },
  },
  async created() {
    try {
      const estabelecimentosRequest = await api.get('/estabelecimento/validacao');

      for (let i=0; i < estabelecimentosRequest.data.length ; i++) {
        estabelecimentosRequest.data[i].link = `http://localhost:8080/PaginaEstabelecimento/${estabelecimentosRequest.data[i].id}`;
      };

      this.estabelecimentos = estabelecimentosRequest.data;     
    } catch (error) {
      this.mostrarmensagemError(error.response.data.msg);
    }
  },
  computed: {
    estabelecimentosFiltrados() {
      const query = this.searchQuery.toLowerCase();
      return this.estabelecimentos.filter((estabelecimento) => {
        const nome = estabelecimento.nome.toLowerCase();
        const status = estabelecimento.status.toLowerCase();

        if (this.filtro === "pendente") {
          if (estabelecimento.status !== "Pendente") {
            return false; // Ocultar estabelecimentos que não são "Pendente"
          }
        }
        if (this.filtro === "validado" && estabelecimento.status !== "Validado") {
          return false;
        }
        if (this.filtro === "naoValidado" && estabelecimento.status !== "Não Validado") {
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

  /*Responsive*/
@media (max-width: 1160px) {
  .container {
    max-width: 95%;
    padding: 10px;
  }
}

@media (max-width: 950px) {
  .container {
    max-width: 90%;
  }

  input {
    padding: 8px 20px;
  }
}

@media (max-width: 768px) {
  .container {
    max-width: 85%;
  }
}

@media (max-width: 600px) {
  .container {
    max-width: 100%;
  }

  input {
    padding: 8px 10px;
  }

  .radio-buttons {
      flex-direction: column; 
  }

  .radio-buttons label {
      margin-right: 0;
      margin-bottom: 10px; 
  }
  .radio-buttons input[type="radio"] {
    margin-right: 5px;
  }
}

@media (max-width: 414px) {
  .container {
    max-width: 100%;
  }

  h1{
    font-size: 27px;
  }

  legend{
    font-size: 15px;
  }

  input {
    padding: 8px 5px;
  }

  th,
  td {
    padding: 8px 5px;
  }

  button {
    padding: 8px 10px;
  }
  .radio-buttons {
    flex-direction: column;
  }

  .radio-buttons label {
    display: block;
    margin: 5px 0;
  }

  .radio-buttons input[type="radio"] {
    margin-right: 5px;
  }
}

/* Estilos para tela com largura de até 350px */
@media (max-width: 350px) {
  .container {
    max-width: 70%;
  }

  input {
    padding: 8px 5px;
  }

  th,
  td {
    padding: 8px 5px;
  }

  button {
    padding: 8px 10px;
  }
}
  
  </style>