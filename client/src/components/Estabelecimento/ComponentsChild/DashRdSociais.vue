<template>
  <div class="container">
    <!--<h1>Redes Sociais</h1>-->
    <div>
      <form @submit.prevent="salvarRedeSocial">
        <label for="redeSocial">Rede Social:</label>
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
        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
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
export default {
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
      isEditing: false,
      listaRedesSociais: [],
      editingIndex: -1,
    };
  },
  methods: {
    salvarRedeSocial() {
      if (!this.perfil) {
        this.campoVazio = true;
        return;
      }
      const arrayRedes = [null, 'Facebook', 'Instagram', 'Twitter', 'Site do Estabelecimento', 'Cardápio Online'];
      const novaRedeSocial = {
        redeSocial: arrayRedes[this.redeSocial],
        perfil: this.perfil,
        idRede: this.redeSocial
      };
      if (this.isEditing) {
        this.listaRedesSociais[this.editingIndex] = novaRedeSocial;
        this.isEditing = false;
      } else {
        this.listaRedesSociais.push(novaRedeSocial);
      }
      this.limparCampos();
       this.$emit('dados-salvos', this.listaRedesSociais); //Enviar dados para o Componente pai
    },
    limparCampos() {
      this.redeSocial = "1";
      this.perfil = "";
      this.campoVazio = false;
    },
    editarRedeSocial(index) {
      this.editingIndex = index;
      this.redeSocial = this.listaRedesSociais[index].redeSocial;
      this.perfil = this.listaRedesSociais[index].perfil;
      this.isEditing = true;
    },
    salvarEdicao(index) {
      this.listaRedesSociais[index].redeSocial = this.redeSocial;
      this.listaRedesSociais[index].perfil = this.perfil;
      this.editingIndex = -1;
      this.limparCampos();
    },
    excluirRedeSocial(index) {
      if (confirm("Tem certeza que deseja excluir?")) {
        this.listaRedesSociais.splice(index, 1);
      }
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.isEditing = false;
      this.limparCampos();
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

input {
  border: none;
  padding: 8px 60px;
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