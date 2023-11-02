<template>
  <div class="container">
    <!--<h1>Horários de Atendimento</h1>-->
    <div>
      <form @submit.prevent="salvarHorario">
        <label for="diaSemana">Dias de Funcionamento:</label>
        <select v-model="diaSelecionado" id="diaSemana">
          <option value="1">Domingo</option>
          <option value="2">Segunda-feira</option>
          <option value="3">Terça-feira</option>
          <option value="4">Quarta-feira</option>
          <option value="5">Quinta-feira</option>
          <option value="6">Sexta-feira</option>
          <option value="7">Sábado</option>
          <option value="8">Segunda a Sexta</option>
          <option value="9">terça a Sexta</option>
          <option value="10">Sábado a Domingo </option>
        </select>
        <label for="horaInicio">Início:</label>
        <input v-model="horaInicio" type="time" id="horaInicio" name="horaInicio" />
        <label for="horaTermino">Término:</label>
        <input v-model="horaTermino" type="time" id="horaTermino" name="horaTermino" />
        <button type="submit" :disabled="isEditingHorario" :class="{ 'disabled-button': isEditingHorario }">
          {{ isEditingHorario ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
      <p v-if="timeFieldsError" class="error-message">{{ timeFieldsError }}</p>
    </div>
    <div class="table-container">
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
          <td>{{ diaSemana[horario.dia] }}</td>
          <td>{{ horario.abre }}</td>
          <td>{{ horario.fecha }}</td>
          <td>
            <template v-if="editingIndexHorario !== index">
                <button class="respButton" @click="editarhorario(index)">
                  <i class="uil uil-edit"></i>
                </button>
                <button class="respButton" @click="excluirhorario(index)">
                  <i class="uil uil-file-times-alt"></i>
                </button>
              </template>
              <template v-else>
                <button class="respButton" @click="salvarEdicaoHorario(index)">
                  <i class="uil uil-check"></i>
                </button>
                <button class="respButton" @click="cancelarEdicaohorario">
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
  name: "DashHorAtendimento",
  props: {
    value: {
      HorariosSelecionados: Array, // O valor passado pelo componente pai
    }
  },
  data() {
    return {
      diaSelecionado: "2",
      diaSemana: [null, "Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado", "Segunda a Sexta", "terça a Sexta", "Sábado a Domingo"],
      horariosPorDia: {},// contagem de horários por dia
      horaInicio: "",
      horaTermino: "",
      listahorarios: [], // Array para armazenar os horários de atendimento
      editingIndexHorario: -1,
      isEditingHorario: false,
      timeFieldsError: false,
    };
  },
  methods: {
    salvarHorario() {
      if (!this.horaInicio || !this.horaTermino) {
        this.timeFieldsError = "Preencha todos os campos.";
      } else {
        const diaSelecionado = this.diaSelecionado;
        const novoHorario = {
          dia: diaSelecionado,
          abre: this.horaInicio,
          fecha: this.horaTermino,
        };
        this.listahorarios.push(novoHorario);
        this.limparCamposhorario();
        this.timeFieldsError = ""; // Limpar o erro, caso tenha sido exibido anteriormente
        this.$emit("dados-salvos", this.listahorarios); // Emitir o evento para atualizar o valor no componente pai
      }
    },
    limparCamposhorario() {
      this.diaSelecionado = "2"; // Restaurar o valor padrão para Segunda-feira
      this.horaInicio = "";
      this.horaTermino = "";
    },
    editarhorario(index) {
      this.editingIndexHorario = index;
      this.diaSelecionado = this.listahorarios[index].dia;
      this.horaInicio = this.listahorarios[index].abre;
      this.horaTermino = this.listahorarios[index].fecha;
      this.isEditingHorario = true;
    },
    salvarEdicaoHorario(index) {
      if (!this.horaInicio || !this.horaTermino) {
        this.timeFieldsError = "Preencha todos os campos.";
        return;
      }

      const diaSelecionado = this.diaSelecionado;
      const novoHorario = {
        dia: diaSelecionado,
        abre: this.horaInicio,
        fecha: this.horaTermino,
      };

      // Atualize o horário editado no array this.listahorarios
      this.listahorarios[index] = novoHorario;

      // Limpe os campos e redefina as variáveis de controle
      this.limparCamposhorario();
      this.editingIndexHorario = -1;
      this.isEditingHorario = false;
      this.timeFieldsError = "";

      this.$emit("dados-salvos", this.listahorarios); // Emita o evento para atualizar o valor no componente pai
    },
    cancelarEdicaohorario() {
      this.editingIndexHorario = -1;
      this.limparCamposhorario();
      this.isEditingHorario = false;
    },
    excluirhorario(index) {
      const diaExcluido = this.listahorarios[index].dia;

      if (
        diaExcluido === "Segunda a Sexta" ||
        diaExcluido === "terça a Sexta" ||
        diaExcluido === "Sábado a Domingo"
      ) {
        const diasEspeciais = {
          "Segunda a Sexta": ["Segunda", "Terca", "Quarta", "Quinta", "Sexta"],
          "terça a Sexta": ["Terca", "Quarta", "Quinta", "Sexta"],
          "Sábado a Domingo": ["Sabado", "Domingo"],
        };

        diasEspeciais[diaExcluido].forEach((dia) => {
          if (this.horariosPorDia[dia] > 0) {
            this.horariosPorDia[dia]--;
          }
        });
      } else {
        if (this.horariosPorDia[diaExcluido] > 0) {
          this.horariosPorDia[diaExcluido]--;
        }
      }
      if (confirm("Tem certeza que deseja excluir?")) {
        this.listahorarios.splice(index, 1);
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
  background-color: rgba(255, 255, 255, 0.418); 
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
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 10px;
}

label,
input[type="time"],
select,
button {
  margin: 0.4rem 0;
  display: inline-block;
}

select,
input[type="time"],
input[type="text"] {
  border: none;
  padding: 8px 10px;
  border-radius: 25px;
  width: 100%;
  background: rgba(211, 201, 201, 0.774);
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #fff;
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
  padding: 8px 13px;
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

.error input {
  border-color: red;
}

.error-message {
  color: red;
  margin-top: 5px;
  font-size: 14px;
}

/* Responsive */
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
    padding: 8px 30px;
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
  button {
    padding: 8px 20px;
  }
  .container {
    max-width: 350px;
  }
  form {
    justify-content: flex-start;
  }
  input {
    width: 100%;
    box-sizing: border-box;
  }
}

@media (max-width: 414px) {
  table {
    font-size: 10px;
  }
  th,
  td {
    padding: 4px 10px;
  }

  button {
    padding: 4px 8px;
  }
}

@media (max-width: 360px) {
  h1 {
    font-size: 16px;
  }
}

@media (max-width: 350px) {
  h1 {
    font-size: 18px;
  }
  button {
    padding: 8px 15px;
  }
  input {
    padding: 8px 10px;
  }
  
  table {
    font-size: 10px;
  }
  th,
  td {
    padding: 3px;
  }
  
  button {
    padding: 3px 10px;
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
