<template>
  <div class="container">
    <!--<h1>Contatos</h1>-->  
    <div>
      <form @submit.prevent="salvarContato">
       <label for="tipoContato">Tipo de Contato:
            <InfoPopup class="custom-popup">	
              <span class="popup">Olá! Para adicionar seu contato, siga estas etapas simples:</span>
                <br><span class="popup">1 - Escolha se deseja adicionar um número de telefone ou celular.</span>
                <br><span class="popup">2 - Digite o número no campo apropriado.</span>
                  <br><span class="popup">3 - Marque a caixa de seleção 'WhatsApp' se desejar que este número seja associado ao WhatsApp.</span>
                  <br><span class="popup">4 - Clique no botão 'Salvar' para concluir a ação.</span>
            </InfoPopup>
       </label>
        <select v-model="tipoContato" id="tipoContato" @change="aplicarMascara">
          <option value="Telefone">Telefone</option>
          <option value="Celular">Celular</option>
        </select>
        <label for="numero">Número:</label>
        <input v-model="numero" type="text" id="numero" name="numero" placeholder="Digite aqui"
          :class="{ 'error': campoVazio }" @input="aplicarMascara" />
        <label for="isWhatsapp"><img src="../../../../public/img/whatsappLogo.png" alt="É WhatsApp?" class="whatsapp-image" /> É WhatsApp:</label>
        <input v-model="isWhatsapp" type="checkbox" id="isWhatsapp" name="isWhatsapp" />
        <p v-if="campoVazio" class="error-message">Informe um número válido.</p>
        <div>
        <br>
        <button type="submit" :disabled="isEditingContato" :class="{ 'disabled-button': isEditingContato }">
          {{ isEditingContato ? 'Salvando...' : 'Salvar' }}
        </button>
      </div>
      </form>
    </div>
    <div class="table-container">
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
              <button class="respButton" @click="salvarEdicaoContato(index)">
                <i class="uil uil-check"></i>
              </button>
              <button class="respButton" @click="cancelarEdicaoContato">
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
import InfoPopup from '../../InfoPopup.vue';
export default {
  components: {
		InfoPopup
  },
  props:{
    ContatosSelecionadas: Array, // O valor passado pelo componente pai
  },
  name: "DashContato",
  data() {
    return {
      tipoContato: "Telefone",
      numero: "",
      campoVazio: false,
      isEditingContato: false,
      listaContatos: [],
      editingIndex: -1,
      isWhatsapp: false,
    };
  },
  methods: {
    salvarContato() {
      // Verifique se o campo numero está vazio
      if (!this.numero) {
        this.campoVazio = true;
        return;
      }

      if (!this.validarNumero()) {
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

      if (this.isEditingContato) {
        // Atualizar um contato existente
        this.listaContatos[this.editingIndex] = novoContato;
        this.isEditingContato = false; // Defina como false após a edição
      } else {
        // Adicionar um novo contato
        this.listaContatos.push(novoContato);
      }
      this.limparCampos();
      this.$emit("dados-salvos", this.listaContatos);
    },
    limparCampos() {
      this.tipoContato = "Telefone";
      this.numero = "";
      this.isWhatsapp = false;
      this.campoVazio = false;
    },
    editarContato(index) {
      this.editingIndex = index;
      this.isEditingContato = true; // Defina como true ao editar um contato
      this.tipoContato = this.listaContatos[index].tipoContato;
      this.numero = this.listaContatos[index].numero;
      this.isWhatsapp = this.listaContatos[index].isWhatsapp;
    },
    excluirContato(index) {
      if (confirm("Tem certeza que deseja excluir o contato?")) {
        this.listaContatos.splice(index, 1);
      }
    },
    salvarEdicaoContato(index) {
        this.listaContatos[index] = {
          tipoContato: this.tipoContato,
          numero: this.numero,
          isWhatsapp: this.isWhatsapp,
        };
        this.editingIndex = -1;
        this.isEditingContato = false;
        this.limparCampos();
      },
    cancelarEdicaoContato() {
      this.editingIndex = -1;
      this.isEditingContato = false; // Defina como false ao cancelar a edição
      this.limparCampos();
    },
    limparCampoVazio() {
      this.campoVazio = false;
    },
    aplicarMascara() {
      let numero = this.numero.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
      let maxCaracteres = this.tipoContato === 'Celular' ? 11 : 10;

      if (numero.length > maxCaracteres) {
        numero = numero.slice(0, maxCaracteres); // Limitar o número de caracteres
      }

      if (this.tipoContato === 'Telefone') {
        // Aplicar a máscara de telefone
        numero = numero.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
      } else if (this.tipoContato === 'Celular') {
        // Aplicar a máscara de celular
        numero = numero.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
      }

      this.numero = numero;
    },

    validarNumero() {
      let minCaracteres = this.tipoContato === 'Celular' ? 11 : 10;
      return this.numero.replace(/\D/g, '').length >= minCaracteres;
    },

    limparCampoNumero() {
      this.numero = "";
      console.log(this.tipoContato);
    },
    
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

/* Ajuste a margem para o select e os campos de entrada */
select,
input[type="time"],
label {
  margin: 0.4rem 0;
}

.container {
  white-space: nowrap;
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.418); 
}

.table-container {
  max-height: 300px; /* Adjust the height as needed */
  overflow: auto;
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
  color: #fff;
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

  input#numero {
  width: 50%; /* Preencher todo o espaço disponível no contêiner */
  box-sizing: border-box; /* Incluir borda e preenchimento no tamanho total */
}

input {
  border: none;
  padding: 8px 15px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
  color: #000;
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


.custom-popup {
    font-size: 15px;
    max-width: 200px; /* Defina a largura máxima desejada */
    white-space: normal; /* Remova o white-space: nowrap */
  }

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
  input#numero {
  width: 100%; /* Preencher todo o espaço disponível no contêiner */
  box-sizing: border-box; /* Incluir borda e preenchimento no tamanho total */
}
  table {
    font-size: 9px;
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
    padding: 6px 25px;
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