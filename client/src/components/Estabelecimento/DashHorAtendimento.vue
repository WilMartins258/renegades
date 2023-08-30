<template>
  <div class="container">
    <h1>Horários de Atendimento</h1>
    <div>
      <form @submit.prevent="salvarHorario">
        <label for="diaSemana">Dias de Funcionamento:</label>
        <select v-model="diaSelecionado" id="diaSemana">
          <option value="segunda">Segunda-feira</option>
          <option value="terca">Terça-feira</option>
          <option value="quarta">Quarta-feira</option>
          <option value="quinta">Quinta-feira</option>
          <option value="sexta">Sexta-feira</option>
          <option value="sabado">Sábado</option>
          <option value="domingo">Domingo</option>
          <option value="Semana">Segunda a Sexta</option>
          <option value="Semana2">terça a Sexta</option>
          <option value="FimSemana">Sábado a Domingo </option>
        </select>
        <label for="horaInicio">Início:</label>
        <input v-model="horaInicio" type="time" id="horaInicio" name="horaInicio" />
        <label for="horaTermino">Término:</label>
        <input v-model="horaTermino" type="time" id="horaTermino" name="horaTermino" />
        <button type="submit">Salvar</button>
      </form>
    </div>
    <table>
      <thead>
        <tr>
          <th>Dia de Atendimento</th>
          <th>Abre</th>
          <th>Fecha</th>
          <th>Editar/Excluir</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(horario, index) in listahorarios" :key="index">
          <td>{{ horario.dia }}</td>
          <td>{{ horario.abre }}</td>
          <td>{{ horario.fecha }}</td>
          <td>
            <template v-if="editingIndex !== index">
                <button class="respButton" @click="editarhorario(index)">
                  <i class="uil uil-edit"></i>
                </button>
                <button class="respButton" @click="excluirhorario(index)">
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
  </div>>
</template>

<script>
export default {
  name: "DashHorAtendimento",
  data() {
    return {
      diaSelecionado: "segunda",
      horaInicio: "",
      horaTermino: "",
      listahorarios: [], // Array para armazenar os horários de atendimento
      editingIndex: -1,
    };
  },
  methods: {
    salvarHorario() {
      if (this.horaInicio && this.horaTermino) {
        const novoHorario = {
          dia: this.diaSelecionado,
          abre: this.horaInicio,
          fecha: this.horaTermino,
        };
        this.listahorarios.push(novoHorario);
        this.limparCampos();
      }
    },
    limparCampos() {
      this.diaSelecionado = "segunda";
      this.horaInicio = "";
      this.horaTermino = "";
    },
    editarhorario(index) {
    this.editingIndex = index;
    this.diaSelecionado = this.listahorarios[index].dia;
    this.horaInicio = this.listahorarios[index].abre;
    this.horaTermino = this.listahorarios[index].fecha;
    },
    salvarEdicao(index) {
      this.listahorarios[index].dia = this.diaSelecionado;
      this.listahorarios[index].abre = this.horaInicio;
      this.listahorarios[index].fecha = this.horaTermino;
      this.cancelarEdicao();
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.limparCampos();
    },
    excluirhorario(index) {
      this.listahorarios.splice(index, 1);
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

  form {
    display: flex;
    flex-direction: column; 
    align-items: flex-start; 
  }
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


