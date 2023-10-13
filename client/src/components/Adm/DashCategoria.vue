<template>
  <div class="container">
    <h1>Categorias</h1>
    <div>
      <form @submit.prevent="salvarCategoria">
        <label for="novaCategoria">Nova Categoria:</label> <br>
        <input
          v-model="novaCategoria"
          type="text"
          id="novaCategoria"
          placeholder="Digite aqui"
          :class="{ 'error': campoVazio }"
          maxlength="50"
        />
        <br><br>

        <label>Ativo:</label>
        <input
          type="radio"
          id="ativoSim"
          value="sim"
          v-model="ativo"
        />
        <label for="ativoSim">Sim</label>
        <input
          type="radio"
          id="ativoNao"
          value="Não"
          v-model="ativo"
        />
        <label for="ativoNao">Não</label>
        <br>
        <p v-if="campoVazio" class="error-message">Informe uma Categoria Válida.</p>
        <br>

        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
    </div>
    <table>
      <thead>
        <tr>
          <th>Categoria do Estabelecimento</th>
          <th>Ativo</th>
          <th>Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(categoria, index) in listaCategorias" :key="index">
          <td>{{ categoria.nome }}</td>
          <td>{{ categoria.ativo }}</td>
          <td>
            <template v-if="editingIndex !== index">
              <button class="respButton" @click="editarCategoria(index)">
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
</template>

<script>
import api from './../../services/backend.service.js';

export default {
  name: "DashCategoria",
  data() {
    return {
      novaCategoria: "",
      listaCategorias: [],
      campoVazio: false, // Variável de estado para verificar se o campo está vazio
      isEditing: false, // Adicionamos um estado para controle de edição
      editingIndex: -1, // Índice da categoria em edição
      ativo: "sim",
    };
  },
  async created() {
    try {
      const categorias = await api.get('/categoria');

      this.listaCategorias = categorias.data;

    } catch (error) {
      console.log('Erro ao buscar categorias: ', error);
    }
  },
  methods: {
    salvarCategoria() {
      if (this.novaCategoria.trim() !== "") {
        if (this.isEditing) {
          this.listaCategorias[this.editingIndex] = {categoria: this.novaCategoria,
            ativo: this.ativo, // Adicionando o valor "ativo" à categoria existente
          };
          this.isEditing = false;
        } else {
          this.listaCategorias.push({
            categoria: this.novaCategoria,
            ativo: this.ativo, // Adicionando o valor "ativo" à nova categoria
          });
        }
        this.novaCategoria = "";
        this.campoVazio = false;
      } else {
        this.campoVazio = true;
      }
    },
    limparCampos() {
      this.novaCategoria = "";
    },
    editarCategoria(index) {
      this.editingIndex = index;
      this.novaCategoria = this.listaCategorias[index].categoria; // Preencher o campo de categoria
      this.ativo = this.listaCategorias[index].ativo; // Preencher o campo "Ativo"
      this.isEditing = true;
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false;
      this.limparCampos();
    },
    salvarEdicao(index) {
      this.listaCategorias[index].categoria = this.novaCategoria;
      this.listaCategorias[index].ativo = this.ativo;

      this.editingIndex = -1;
      this.isEditing = false;
      this.limparCampos();
    },
  },
};

</script>

<style scoped>

.container {
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.8); 
  white-space: nowrap;
}
.table-container {
  max-height: 300px; 
  overflow: auto;
}

h1 {
  text-align: center;
}

form {
  margin-bottom: 10px;
  justify-content: flex-start;
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
  padding: 8px 50px;
  border-radius: 25px;
}

button:hover {
  background: #ff9800;
}

.disabled-button {
  background: gray;
  cursor: not-allowed;
}

button:disabled:hover {
  background: gray;
}

input {
  border: none;
  padding: 8px 60px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
}

.error input {
  border-color: red; /* Estilizar o campo de entrada quando estiver vazio */
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
}

@media (max-width: 950px) {
  .container {
    max-width: 768px;
  }
}

@media (max-width: 768px) {
  .container {
    max-width: 600px;
  }
}

@media (max-width: 600px) {
.respButton{
  padding: 8px 25px;
}
  .container {
    max-width: 350px;
  }
    
  button {
    margin-top: 8px;
  }
}

@media (max-width: 414px) {
  table {
    font-size: 10px; 
  }
  th,
  td {
    padding: 6px; 
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


