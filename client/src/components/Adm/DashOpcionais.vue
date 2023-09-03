<template>
  <div class="container">
    <h1>Opcionais</h1>
    <div>
      <form @submit.prevent="salvarOpcional">
        <label for="novaOpcional">Novo Opcional:</label>
        <input
          v-model="novaOpcional"
          type="text"
          id="novaOpcional"
          placeholder="Digite aqui"
          :class="{ 'error': campoVazio }"
        />
        <br><br>
        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
        </button>
        <p v-if="campoVazio" class="error-message">Informe um Opcional Válido.</p>
      </form>
    </div>
    <table>
      <thead>
        <tr>
          <th>Opcional de Estabelecimento</th>
          <th>Editar/Excluir</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(Opcional, index) in listaOpcionals" :key="index">
          <td>{{ Opcional }}</td>
          <td>
            <template v-if="editingIndex !== index">
              <button class="respButton" @click="editarOpcional(index)">
                <i class="uil uil-edit"></i>
              </button>
              <button class="respButton" @click="excluirOpcional(index)">
                <i class="uil uil-file-times-alt"></i>
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
export default {
  name: "DashOpcionais",
  data() {
    return {
      novaOpcional: "",
      listaOpcionals: [],
      campoVazio: false, // Variável de estado para verificar se o campo está vazio
      isEditing: false, // Adicionamos um estado para controle de edição
      editingIndex: -1, // Índice da Opcional em edição
    };
  },
  methods: {
    salvarOpcional() {
      if (this.novaOpcional.trim() !== "") {
        if (this.isEditing) {
          // Editar Opcional existente
          this.listaOpcionals[this.editingIndex] = this.novaOpcional;
          this.isEditing = false;
        } else {
          // Adicionar nova Opcional
          this.listaOpcionals.push(this.novaOpcional);
        }
        this.novaOpcional = "";
        this.campoVazio = false; // Reiniciar o estado de campo vazio
      } else {
        this.campoVazio = true; // Definir o estado de campo vazio como verdadeiro
      }
    },
    limparCampos() {
      this.novaOpcional = "";
    },
    editarOpcional(index) {
      this.editingIndex = index;
      this.novaOpcional = this.listaOpcionals[index];
      this.isEditing = true; // Ativar o modo de edição
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false;
      this.limparCampos();
    },
    salvarEdicao(index) {
      this.listaOpcionals[index] = this.novaOpcional;
      this.editingIndex = -1;
      this.isEditing = false; // Definir isEditing de volta para false
      this.limparCampos();
    },

    excluirOpcional(index) {
      if (confirm("Tem certeza que deseja excluir esta Opcional?")) {
        this.listaOpcionals.splice(index, 1);
      }
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
  
  form {
    justify-content: flex-start;
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



