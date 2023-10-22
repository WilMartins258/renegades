<template>
  <div class="container">
    <h1>Cadastrar Promoção</h1>
    <div>
      <form @submit.prevent="salvarPromocao">
    <div class="form-group">
      <label for="codigo">Código:</label><br>
      <input v-model="novaPromocao.codigo" type="text" id="codigo" placeholder="Digite o código" maxlength="20"/>
    </div>

    <div class="form-group">
      <label for="nome">Nome:</label><br>
      <input v-model="novaPromocao.nome" type="text" id="nome" placeholder="Digite o nome" maxlength="100"/>
    </div>

    <div class="form-group">
      <label for="descricao">Descrição:</label><br>
      <input v-model="novaPromocao.descricao" type="text" id="descricao" placeholder="Digite a descrição" maxlength="140"/>
    </div>

    <div class="form-group">
        <label for="dataInicio">Data de Início:</label><br>
        <input v-model="novaPromocao.dataInicio" type="date" id="dataInicio" />
      </div>
    <div class="form-group">
        <label for="dataFim">Data de Fim:</label><br>
        <input v-model="novaPromocao.dataFim" type="date" id="dataFim" />
      </div>
        <br><br>
        <div class="form-group">
        <br><button type="submit">{{ isEditing ? 'Salvando...' : 'Salvar' }}</button>
        <p v-if="campoVazio" class="error-message">Obrigatórios preencher todos os campos.</p>
      </div>
      </form>
    </div>
    <div class="table-container">
    <table>
      <!-- Tabela para listar promoções -->
      <thead>
        <tr>
          <th>Inativar</th>
          <th>Código</th>
          <th>Nome</th>
          <th>Descrição</th>
          <th>Data de Início</th>
          <th>Data de Fim</th>
          <th>Ações</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(promocao, index) in listaPromocoes" :key="index">
          <td>
            <input v-model="promocao.Inativar" type="checkbox" />
          </td>
          <td>{{ promocao.codigo }}</td>
          <td>{{ promocao.nome }}</td>
          <td>{{ promocao.descricao }}</td>
          <td>{{ promocao.dataInicio }}</td>
          <td>{{ promocao.dataFim }}</td>
          <td>
            <template v-if="editingIndex !== index">
              <button class="respButton" @click="editarPromocao(index)">
                <i class="uil uil-edit"></i>
              </button>
            </template>
            <template v-else>
              <button class="respButton" @click="salvarEdicao(index)">
                <i class="uil uil-check"></i>
              </button>
              <button class="respButton" @click="cancelarEdicao">
                <i class="uil uil-times"></i>
              </button>
            </template>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
    <br>
    <button @click="InativarPromocao" v-show="listaPromocoes.length > 0">Inativar</button>
  </div>
  
    <!-- Listar promoções Inativas -->
    <div class="table-inativas">
      <label>Inativos</label>
      <div class="table-container-inativas">
      <br>
      <table>
        <!-- Tabela para listar promoções Inativas -->
        <thead>
          <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Data de Início</th>
            <th>Data de Fim</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(promocao, index) in listaPromocoesInativas" :key="index"> <!-- Preencher com as promoções inativas -->
            <td>{{ promocao.codigo }}</td>
            <td>{{ promocao.nome }}</td>
            <td>{{ promocao.descricao }}</td>
            <td>{{ promocao.dataInicio }}</td>
            <td>{{ promocao.dataFim }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>

    <!-- Listar promoções Concluídas -->
    <div class="table-concluidas">
      <label>Concluídos</label>
      <div class="table-container-concluidas">
      <br>
      <table>
        <!-- Listar promoções Concluídas -->
        <thead>
          <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Data de Início</th>
            <th>Data de Fim</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(promocao, index) in listaPromocoesVencidas" :key="index"><!-- Preencher com as promoções concluídas -->
            <td>{{ promocao.codigo }}</td>
            <td>{{ promocao.nome }}</td>
            <td>{{ promocao.descricao }}</td>
            <td>{{ promocao.dataInicio }}</td>
            <td>{{ promocao.dataFim }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>

</template>

<script>
import api from './../../../services/backend.service.js';
import dataFormat from './../../../services/dataToDiaMesAno.service';

export default {
  name: "CadastroPromocoes",
  data() {
    return {
      novaPromocao: {
        codigo: "",
        nome: "",
        descricao: "",
        dataInicio: "",
        dataFim: "",
        Inativar: false,
      },
      listaPromocoes: [],
      listaPromocoesInativas: [],
      listaPromocoesVencidas: [], 
      listaPromocoes: [],
      campoVazio: false,
      isEditing: false,
      editingIndex: -1,
    };
  },
  async created() {
    try {
      const promocoesRequest = await api.get(`/promocao/estabelecimento/${sessionStorage.getItem('idEstabelecimento')}`);

      const {
        promocoesAtivas,
        promocoesInativas,
        promocoesVencidas
      } = promocoesRequest.data;

      for (let i=0; i < promocoesAtivas.length; i++) {
        promocoesAtivas[i].dataInicio = dataFormat(promocoesAtivas[i].dataInicio);
        promocoesAtivas[i].dataFim = dataFormat(promocoesAtivas[i].dataFim);
      }

      for (let i=0; i < promocoesInativas.length; i++) {
        promocoesInativas[i].dataInicio = dataFormat(promocoesInativas[i].dataInicio);
        promocoesInativas[i].dataFim = dataFormat(promocoesInativas[i].dataFim);
      }

      for (let i=0; i < promocoesVencidas.length; i++) {
        promocoesVencidas[i].dataInicio = dataFormat(promocoesVencidas[i].dataInicio);
        promocoesVencidas[i].dataFim = dataFormat(promocoesVencidas[i].dataFim);
      }

      this.listaPromocoes = promocoesAtivas;
      this.listaPromocoesInativas = promocoesInativas
      this.listaPromocoesVencidas = promocoesVencidas;
    } catch (error) {
      console.log('Erro ao buscar promoções do estabelecimentos: ', error);
    }
  },
  methods: {
    salvarPromocao() {

       // Formate as datas antes de adicioná-las à lista de promoções
      this.novaPromocao.dataInicio = new Date(this.novaPromocao.dataInicio).toLocaleDateString('pt-BR');
      this.novaPromocao.dataFim = new Date(this.novaPromocao.dataFim).toLocaleDateString('pt-BR');
      if (
        this.novaPromocao.codigo.trim() !== "" &&
        this.novaPromocao.nome.trim() !== "" &&
        this.novaPromocao.descricao.trim() !== "" &&
        this.novaPromocao.dataInicio !== "" &&
        this.novaPromocao.dataFim !== ""
      ) {
        if (this.isEditing) {
          this.listaPromocoes[this.editingIndex] = this.novaPromocao;
          this.isEditing = false;
        } else {
          this.listaPromocoes.push({ ...this.novaPromocao });
        }
        this.novaPromocao = {
          codigo: "",
          nome: "",
          descricao: "",
          dataInicio: "",
          dataFim: "",
          Inativar: false,
        };
        this.campoVazio = false;
      } else {
        this.campoVazio = true;
      }
    },
    editarPromocao(index) {
      this.editingIndex = index;
      this.novaPromocao = { ...this.listaPromocoes[index] };
      this.isEditing = true;
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false;
      this.novaPromocao = {
        codigo: "",
        nome: "",
        descricao: "",
        dataInicio: "",
        dataFim: "",
        Inativar: false,
      };
    },
    salvarEdicao(index) {
      this.listaPromocoes[index] = this.novaPromocao;
      this.editingIndex = -1;
      this.isEditing = false;
      this.novaPromocao = {
        codigo: "",
        nome: "",
        descricao: "",
        dataInicio: "",
        dataFim: "",
        Inativar: false,
      };
    },
    InativarPromocao() {
       // Filtra as promoções que devem ser inativadas
       const promocoesInativar = this.listaPromocoes.filter(
        (promocao) => promocao.Inativar
      );

      if (promocoesInativar.length === 0) {
        alert("Selecione uma promoção para inativá-la.");
      } else {
        const confirmacao = confirm(
          "Deseja mesmo inativar a(s) promoção(ões) selecionada(s)?"
        );
        if (confirmacao) {
          // Move as promoções selecionadas para a lista de inativados
          this.listaPromocoes = this.listaPromocoes.filter(
            (promocao) => !promocao.Inativar
          );
          this.listaPromocoesInativas = this.listaPromocoesInativas.concat(
            promocoesInativar
          );
          // Limpa a seleção de Inativar nas promoções
          promocoesInativar.forEach((promocao) => (promocao.Inativar = false));
        }
      }
    },  
  }
};
</script>


  <style scoped>
.form-group {
  margin-bottom: 10px; /* Ajuste a margem conforme necessário */
}
  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8); 
    white-space: nowrap;
    border-radius: 25px;
  }

  .table-container {
  max-height: 200px; /* Adjust the height as needed */
  overflow: auto;
}

.table-container-inativas {
  max-height: 300px; 
  overflow: auto;
}

.table-container-concluidas {
  max-height: 300px; 
  overflow: auto;
}


.table-inativas, 
  .table-concluidas {
  max-width: 800px;
  margin: 20px auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.8);
  white-space: nowrap;
  border-radius: 25px;
}
  
  h1 {
    text-align: center;
  }
  
  form {
    display: flex;
    flex-wrap: wrap; 
    margin-bottom: 10px;
  }
  
  label,
  input,
  button {
    margin-right: 10px;
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
  }
  
  th {
    background-color: #f2f2f2;
  }
  
  button {
    background: #e91e2f;
    cursor: pointer;
    transition: 0.5s;
    border: none;
    padding: 8px 30px;
    border-radius: 25px;
  }
  
  button:hover {
    background: #ff9800;
  }
    
  button:disabled:hover {
    background: gray;
  }
  
  input {
    border: none;
    padding: 8px 50px;
    border-radius: 25px;
    background: rgba(211, 201, 201, 0.774);
  }
  
  .error-message {
    color: red;
    margin-top: 5px;
    font-size: 14px;
  }
  
  /* Responsive*/
  
  @media (max-width: 1160px) {
    .container {
      max-width: 950px;
    }
    .table-inativas, 
    .table-concluidas {
      max-width: 950px;
    }
  }
  
  @media (max-width: 950px) {
    .container {
      max-width: 768px;
    }
    .table-inativas, 
    .table-concluidas {
      max-width: 768px;
    }
  }
  
  @media (max-width: 768px) {
    .container {
      max-width: 600px;
    }
    .table-inativas, 
    .table-concluidas {
      max-width: 600px;
    }
  }
  
  @media (max-width: 600px) {
    .container {
      max-width: 500px;
    }
    .table-inativas, 
    .table-concluidas {
      max-width: 500px;
    }
    .respButton{
    padding: 8px 25px;
  }
 
    form {
      justify-content: flex-start;
    }
    
    button {
      margin-top: 8px;
    }
  }
  
  @media (max-width: 414px) {
    table {
      font-size: 9px; 
    }
    th,
    td {
      padding: 6px; 
    }

    h1{
      font-size: 28px;
    }
  }
  
  @media (max-width: 360px) {
    h1 {
      font-size: 16px; 
    }
    button {
      padding: 8px 25px;
    }
    input {
      padding: 8px 35px;
  }
    
  }
  
  @media (max-width: 350px) {
    h1 {
      font-size: 18px;
    }
    table {
      font-size: 12px;
    }
    button {
      padding: 8px 20px;
    }
    input {
      padding: 8px 10px;
  }
  
  .respButton{
    padding: 8px 15px;
  }
  
  }
  </style>