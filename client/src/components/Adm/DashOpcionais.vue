<template>
  <div class="container">
    <h1>Opcionais</h1>
    <div>
      <form @submit.prevent="salvarOpcional">
        <label for="novaOpcional">Novo Opcional:</label><br>
        <input
          v-model="novaOpcional"
          type="text"
          id="novaOpcional"
          placeholder="Digite aqui"
          :class="{ 'error': campoVazio }"
          maxlength="50"
        />
        <br><br>
        <label>Ativo:</label>
        <input
          type="radio"
          id="ativoSim"
          value="Sim"
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
        <p v-if="campoVazio" class="error-message">Informe um Opcional Válido.</p>
        <br>
        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
    </div>
    <div  class="table-container">
    <table>
      <thead>
        <tr>
          <th>Opcional do Estabelecimento</th>
          <th>Ativo</th>
          <th>Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(Opcional, index) in listaOpcionals" :key="index">
          <td>{{ Opcional.categoria  }}</td>
          <td>{{ Opcional.ativo }}</td>
          <td>
            <template v-if="editingIndex !== index">
              <button class="respButton" @click="editarOpcional(index)">
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
  </div>
</template>

<script>
import api from './../../services/backend.service.js';

export default {
  name: "DashOpcionais",
  data() {
    return {
      novaOpcional: "",
      listaOpcionals: [],
      campoVazio: false, // Variável de estado para verificar se o campo está vazio
      isEditing: false, // Adicionamos um estado para controle de edição
      editingIndex: -1, // Índice da Opcional em edição
      ativo: "sim",
    };
  },
  async created() {
    try {
      const buscarOpcionais = await api.get('/opcional');

      const opcionais = buscarOpcionais.data.map(objeto => {
        return {
          id: objeto.id,
          categoria: objeto.nome,
          ativo: objeto.ativo
        };
      });

      this.listaOpcionals = opcionais;
    } catch (error) {
      console.log('Erro ao buscar os opcionais: ', error);
    }
  },
  methods: {
    salvarOpcional() {
      if (this.novaOpcional.trim() !== "") {
        if (this.isEditing) {
          this.listaOpcionals[this.editingIndex] = {opcional: this.novaOpcional,
            ativo: this.ativo, // Adicionando o valor "ativo" ao opcional existente
          };
          this.isEditing = false;
        } else {
          this.listaOpcionals.push({
            categoria: this.novaOpcional,
            ativo: this.ativo, // Adicionando o valor "ativo" ao novo opcional
          });
        }
        this.novaOpcional = "";
        this.campoVazio = false;
      } else {
        this.campoVazio = true;
      }
    },

    limparCampos() {
      this.novaOpcional = "";
    },
    editarOpcional(index) {
      this.editingIndex = index;
      this.novaOpcional = this.listaOpcionals[index].categoria; // Acesse a propriedade 'categoria'
      this.ativo = this.listaOpcionals[index].ativo; // Acesse a propriedade 'ativo'
      this.isEditing = true;
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false;
      this.limparCampos();
    },
    salvarEdicao(index) {
      if (this.novaOpcional.trim() !== "") {
        this.listaOpcionals[index].categoria = this.novaOpcional;
        this.listaOpcionals[index].ativo = this.ativo;
        this.editingIndex = -1;
        this.isEditing = false;
        this.limparCampos();
      } else {
        this.campoVazio = true;
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

  button {
    padding: 8px 20px;
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
  .respButton{
  padding: 8px 25px;
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



