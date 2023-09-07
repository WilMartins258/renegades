<template>
  <div class="container">
    <h1>Contatos</h1>
    <div>
      <form @submit.prevent="salvarContato">
        <label for="tipoContato">Tipo de Contato:</label>
        <select v-model="tipoContato" id="tipoContato" @change="aplicarMascara">
          <option value="Telefone">Telefone</option>
          <option value="Celular">Celular</option>
        </select>
        <label for="numero">Número:</label>
        <input v-model="numero" type="text" id="numero" name="numero" placeholder="Digite aqui"
          :class="{ 'error': campoVazio }" @input="limparCampoVazio" />
        <label for="isWhatsapp"><img src="../../../../public/img/whatsappLogo.png" alt="É WhatsApp?" class="whatsapp-image" /> É WhatsApp:</label>
        <input v-model="isWhatsapp" type="checkbox" id="isWhatsapp" name="isWhatsapp" />
        <p v-if="campoVazio" class="error-message">Informe um número válido.</p>
        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
    </div>
    <table>
      <thead>
        <tr>
          <th>Tipo de Contato</th>
          <th>Número</th>
          <th>WhatsApp</th>
          <th>Editar/Excluir</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(contato, index) in listaContatos" :key="index">
          <td>{{ contato.tipoContato }}</td>
          <td>{{ contato.numero }}</td>
          <td>{{ contato.isWhatsapp ? 'Sim' : 'Não' }}</td>
          <td>
            <template v-if="editingIndex !== index">
              <button class="respButton" @click="editarContato(index)">
                <i class="uil uil-edit"></i>
              </button>
              <button class="respButton" @click="excluirContato(index)">
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
  name: "DashContato",
  data() {
    return {
      tipoContato: "Telefone",
      numero: "",
      campoVazio: false,
      isEditing: false,
      listaContatos: [],
      editingIndex: -1,
    };
  },
  methods: {
    salvarContato() {
      // Verifique se o campo numero está vazio
      if (!this.numero) {
        this.campoVazio = true;
        return;
      }

      let tipoContatoId;

      if (this.tipoContato === "Telefone") {
        tipoContatoId = 1; // Defina 1 para Telefone
      } else if (this.tipoContato === "Celular") {
        tipoContatoId = 2; // Defina 2 para Celular
      }

      const novoContato = {
        tipoContato: this.tipoContato,
        numero: this.numero,
        isWhatsapp: this.isWhatsapp,
      };
      
      // Adicione o tipoContatoId ao novoContato
      novoContato.id = tipoContatoId;

      if (this.isEditing) {
        // Atualizar um contato existente
        this.listaContatos[this.editingIndex] = novoContato;
        this.isEditing = false; // Defina como false após a edição
      } else {
        // Adicionar um novo contato
        this.listaContatos.push(novoContato);
      }
      
      this.limparCampos();
    },
    limparCampos() {
      this.tipoContato = "Telefone";
      this.numero = "";
      this.isWhatsapp = false;
    },
    editarContato(index) {
      this.editingIndex = index;
      this.isEditing = true; // Defina como true ao editar um contato
      this.tipoContato = this.listaContatos[index].tipoContato;
      this.numero = this.listaContatos[index].numero;
      this.isWhatsapp = this.listaContatos[index].isWhatsapp;
    },
    excluirContato(index) {
      this.listaContatos.splice(index, 1);
    },
    salvarEdicao(index) {
        this.listaContatos[index] = {
          tipoContato: this.tipoContato,
          numero: this.numero,
          isWhatsapp: this.isWhatsapp,
        };
        this.editingIndex = -1;
        this.isEditing = false;
        this.limparCampos();
      },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false; // Defina como false ao cancelar a edição
      this.limparCampos();
    },
    limparCampoVazio() {
      this.campoVazio = false;
    },
    aplicarMascara() {
      let numero = this.numero.replace(/\D/g, ''); // Remove todos os caracteres não numéricos

      if (this.tipoContato === 'Telefone') {
        // Aplicar a máscara de telefone
        numero = numero.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
      } else if (this.tipoContato === 'Celular') {
        // Aplicar a máscara de celular
        numero = numero.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
      }

      this.numero = numero;
    },

    limparCampoNumero() {
      this.numero = "";
      console.log(this.tipoContato);
    }
  },
};
</script>

<style scoped>


select,
input[type="time"] {
  border: none;
  padding: 8px 10px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
  width: 100%;
}

select,
input[type="text"],
input[type="checkbox"] {
  width: 100%; /* Defina a largura para 100% */
}


/* Ajuste a margem para o select e os campos de entrada */
select,
input[type="time"],
label {
  margin: 0.4rem 0;
}


.container {
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.418); 
}

h1 {
  text-align: center;
}

form {
  display: flex;
  flex-wrap: wrap; 
  margin-bottom: 10px;
  max-width: 600px; /* Ajuste a largura máxima conforme necessário */
  margin: 0 auto; /* Centralize o formulário no container */
  align-items: center; /* Alinhe verticalmente os elementos no centro */
}
label {
  margin-right: 0; /* Remova a margem direita */
}


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
  font-size: 14px;
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
  padding: 8px 30px;
  border-radius: 25px;
  color: #ccc;
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

.whatsapp-image {
    width: 30px; 
    height: auto; 
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

.respButton {
    padding: 6px 12px;
  }
/* Responsive*/


/* Responsive*/

@media (max-width: 1160px) {
  .container {
    max-width: 200px;
  }
  table {
    font-size: 25px;
  }
  th,
  td {
    padding: 6px;
  }
}

@media (max-width: 950px) {
  .container {
    max-width: 768px;
  }

  .respButton {
    padding: 6px 15px;
  }
}

@media (max-width: 768px) {
  .container {
    max-width: 600px;
  }

  table {
    font-size: 14px; /* Ajuste o tamanho da fonte para dispositivos menores */
  }

  th,
  td {
    padding: 6px; /* Ajuste o espaçamento das células para dispositivos menores */
  }
}

@media (max-width: 600px) {
  form {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .respButton {
    padding: 4px 10px;
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
    font-size: 7px;
  }

  th,
  td {
    padding: px;
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

  button {
    padding: 8px 20px;
  }

  input {
    padding: 8px 10px;
  }

  .respButton {
    padding: 8px 15px;
  }

  table {
    font-size: 6.5px;
  }

  th,
  td {
    padding: 3.5px;
  }

  button {
    padding: 3px 14px;
  }
}

@media (max-width: 320px) {
  .container {
    max-width: 280px;
  }
}

@media (max-width: 280px) {
  .container {
    max-width: 240px;
  }
}
</style>