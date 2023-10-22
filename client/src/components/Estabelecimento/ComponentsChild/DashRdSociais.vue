<template>
  <div class="container">
    <div>
      <form @submit.prevent="salvarRedeSocial">
        <label for="redeSocial">Rede Social:
            <InfoPopup class="custom-popup">  	
              <span class="popup">Olá! Para adicionar sua rede social, siga estas etapas simples:</span>
                <br><span class="popup">1 - Escolha a rede social que deseja compartilhar.</span>
                <br><span class="popup">2 - Digite seu perfil ou nome de usuário da rede social escolhida no campo apropriado.</span>
                  <br><span class="popup">3 - Clique no botão 'Salvar' para concluir a ação.</span>
            </InfoPopup>
        </label>
        <select v-model="redeSocial" id="redeSocial">
          <option value="1">Facebook</option>
          <option value="2">Instagram</option>
          <option value="3">Twitter</option>
          <option value="4">Site do Estabelecimento</option>
          <option value="5">Cardápio Online</option>
        </select>
        <label for="perfil">Perfil:</label>
        <input
          v-model="perfil"
          type="text"
          id="perfil"
          name="perfil"
          placeholder="Digite aqui"
          :class="{ 'error': campoVazio }"
        />
        <p v-if="campoVazio" class="error-message">Informe um valor válido.</p>
        <p v-if="redeSocialJaIncluida" class="error-message">Rede social já incluída.</p>
        <button type="submit" :disabled="isEditingRdSocial" :class="{ 'disabled-button': isEditingRdSocial }">
          {{ isEditingRdSocial ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
    </div>
    <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>Rede Social</th>
          <th>Perfil</th>
          <th>Editar/Excluir</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(rede, index) in listaRedesSociais" :key="index">
          <td>{{ rede.redeSocial }}</td>
          <td>{{ rede.perfil }}</td>
          <td>
            <template v-if="editingIndex !== index">
              <button class="respButton" @click="editarRedeSocial(index)">
                <i class="uil uil-edit"></i>
              </button>
              <button class="respButton" @click="excluirRedeSocial(index)">
                <i class="uil uil-file-times-alt"></i>
              </button>
            </template>
            <template v-else>
              <button class="respButton" @click="salvarEdicaoRdSocial(index)">
                <i class="uil uil-check"></i>
              </button>
              <button class="respButton" @click="cancelarEdicaoRdSocial">
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
  props: {
    RdSocialSelecionadas: Array, // O valor passado pelo componente pai
  },
  name: "DashRdSociais",
  data() {
    return {
      redeSocial: "1",
      value: this.redeSocial,
      perfil: "",
      campoVazio: false,
      isEditingRdSocial: false,
      listaRedesSociais: [],
      editingIndex: -1,
      redesSociaisIncluidas: new Set(),
      redeSocialJaIncluida: false,
    };
  },
  methods: {
    salvarRedeSocial() {
      if (!this.perfil) {
        this.campoVazio = true;
        this.redeSocialJaIncluida = false;
        return;
      }
      const arrayRedes = [null, 'Facebook', 'Instagram', 'Twitter', 'Site do Estabelecimento', 'Cardápio Online'];
      const redeSocial = arrayRedes[this.redeSocial];

      if (this.redesSociaisIncluidas.has(redeSocial)) {
        this.redeSocialJaIncluida = true;
        this.campoVazio = false;
        return;
      }

      const novaRedeSocial = {
        redeSocial: redeSocial,
        perfil: this.perfil,
        idRede: this.redeSocial
      };

      if (this.isEditingRdSocial) {
        this.listaRedesSociais[this.editingIndex] = novaRedeSocial;
        this.isEditingRdSocial = false;
      } else {
        this.listaRedesSociais.push(novaRedeSocial);
        this.redesSociaisIncluidas.add(redeSocial);
      }
      this.limparCampos();
       this.$emit('dados-salvos', this.listaRedesSociais); //Enviar dados para o Componente pai
    },
    limparCampos() {
      this.redeSocial = "1";
      this.perfil = "";
      this.campoVazio = false;
      this.redeSocialJaIncluida = false;
    },
    editarRedeSocial(index) {
      this.editingIndex = index;
      this.redeSocial = this.listaRedesSociais[index].idRede;
      this.perfil = this.listaRedesSociais[index].perfil;
      this.isEditingRdSocial = true;
    },
    salvarEdicaoRdSocial(index) {
      const arrayRedes = [null, 'Facebook', 'Instagram', 'Twitter', 'Site do Estabelecimento', 'Cardápio Online'];
      const novaRedeSocial = arrayRedes[this.redeSocial];
      const perfil = this.perfil;

      if (this.jaExisteOutraRedeSocial(novaRedeSocial, index)) {
        this.redeSocialJaIncluida = true;
        return;
      }
      

      this.listaRedesSociais[index].redeSocial = novaRedeSocial;
      this.listaRedesSociais[index].perfil = perfil;
      this.editingIndex = -1;
      this.isEditingRdSocial = false;
      this.limparCampos();
    },
    cancelarEdicaoRdSocial() {
      this.editingIndex = -1;
      this.isEditingRdSocial = false;
      this.limparCampos();
    },
    excluirRedeSocial(index) {
      if (confirm("Tem certeza que deseja excluir?")) {
        this.listaRedesSociais.splice(index, 1);
      }
    },
    jaExisteOutraRedeSocial(novaRedeSocial, index) {
      for (let i = 0; i < this.listaRedesSociais.length; i++) {
        if (i !== index && this.listaRedesSociais[i].redeSocial === novaRedeSocial) {
          return true;
        }
      }
      return false;
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
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.418); 
  white-space: nowrap;
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
  padding: 8px 20px;
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

input {
  border: none;
  padding: 8px 60px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
  color: #000;
}



.error-message {
  color: red;
  margin-top: 5px;
  font-size: 14px;
}

.custom-popup {
    font-size: 15px;
    max-width: 200px; /* Defina a largura máxima desejada */
    white-space: normal; /* Remova o white-space: nowrap */
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

  .respButton {
    padding: 6px 15px;
  }
}

@media (max-width: 768px) {
  .container {
    max-width: 600px;
  }
  table {
    font-size: 14px;
  }
  th,
  td {
    padding: 6px;
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

  input {
    width: 100%; 
    box-sizing: border-box; 
  }
}

@media (max-width: 414px) {
  table {
    font-size: 9px; 
  }
  th,
  td {
    padding: 4px; 
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