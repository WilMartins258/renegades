<template>
  <div class="container">
    <h1>Estilos Musicais</h1>
    <ComponentMessage v-if="mostrarMensagem" :title="tituloMsg" :message="mensagemPUser" @close="fecharMensagem" />
    <div>
      <form @submit.prevent="salvarMusica">
        <label for="novaMusica">Nova música:</label><br>
        <input
          v-model="novaMusica"
          type="text"
          id="novaMusica"
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
          checked
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
        <p v-if="campoVazio" class="error-message">Informe um estilo de música válido.</p>
        <br>
        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
    </div>
    <div class="table-container">
      <table>
        <thead>
          <tr>
            <th>Estilos Musicais</th>
            <th>Ativo</th>
            <th>Editar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(musica, index) in listaMusicas" :key="index">
            <td>{{ musica.musica }}</td>
            <td>{{ musica.ativo }}</td>
            <td>
              <template v-if="!isEditing || index !== editingIndex">
                <button class="respButton" @click="editarMusica(index)">
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
import ComponentMessage from '../Message';
export default {
  name: "DashEstiloMusica",
  components: {
		ComponentMessage,
  },
  data() {
    return {
      novaMusica: "",
      listaMusicas: [],
      campoVazio: false,
      isEditing: false,
      editingIndex: -1,
      ativo: "sim",
      mostrarMensagem: false,
      tituloMsg: '',
      mensagemPUser: '',
    };
  },
  async created() {
    try {
      const buscarMusicas = await api.get('/estiloMusica');

      const musicas = buscarMusicas.data.map(objeto => {
        return {
          id: objeto.id,
          musica: objeto.nome, // Aqui é onde a chave 'nome' é alterada para 'musica'
          ativo: objeto.ativo
        };
      });

      this.listaMusicas = musicas;
    } catch (error) {
      this.mostrarmensagemError(error.response.data.message);
    }
  },
  methods: {
    async salvarMusica() {
      if (this.novaMusica.trim() !== "") {
        if (this.isEditing) {
          this.listaMusicas[this.editingIndex] = {
            musica: this.novaMusica,
            ativo: this.ativo,
          };
          this.isEditing = false;
        } else {
          try {
            const novoEstiloDeMusica = {
              nome: this.novaMusica,
              ativo: this.ativo
            };
            const inserirEstiloMusica = await api.post('/estiloMusica', novoEstiloDeMusica);

            this.listaMusicas.push({
              id: inserirEstiloMusica.data.id,
              musica: this.novaMusica,
              ativo: this.ativo,
            });
          } catch (error) {
            this.mostrarmensagemError(error.response.data.message);
          }
        }
        this.novaMusica = "";
        this.campoVazio = false;
      } else {
        this.campoVazio = true;
      }
    },

    limparCampos() {
      this.novaMusica = "";
    },
    editarMusica(index) {
      this.editingIndex = index;
      this.novaMusica = this.listaMusicas[index].musica;
      this.ativo = this.listaMusicas[index].ativo;
      this.isEditing = true;
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false;
      this.limparCampos();
    },
    async salvarEdicao(index) {
      if (this.novaMusica.trim() !== "") {
        this.listaMusicas[index].musica = this.novaMusica;
        this.listaMusicas[index].ativo = this.ativo;

        const novosDadosEstiloMusica = {
          nome: this.listaMusicas[index].musica,
          ativo: this.listaMusicas[index].ativo,
          id: this.listaMusicas[index].id
        };
        try {
          await api.put('/estiloMusica', novosDadosEstiloMusica);
        } catch (error) {
          this.mostrarmensagemError(error.response.data.message);
        }

        this.editingIndex = -1;
        this.isEditing = false;
        this.limparCampos();
      } else {
        this.campoVazio = true;
      }
    },
    mostrarmensagemError(msg) {
        this.tituloMsg = "Erro"
        this.mensagemPUser = msg
        this.mostrarMensagem = true;
      },
    
    fecharMensagem() {
      this.mostrarMensagem = false;
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
  .respButton{
    padding: 8px 25px;
  }

  h1{
    font-size: 38px;
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
