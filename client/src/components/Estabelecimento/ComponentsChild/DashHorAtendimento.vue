<template>
  <div class="container">
    <!--<h1>Horários de Atendimento</h1>-->
    <div>
      <form @submit.prevent="salvarHorario">
        <label for="diaSemana">Dias de Funcionamento:</label>
        <select v-model="diaSelecionado" id="diaSemana">
          <option value="Segunda">Segunda-feira</option>
          <option value="Terca">Terça-feira</option>
          <option value="Quarta">Quarta-feira</option>
          <option value="Quinta">Quinta-feira</option>
          <option value="Sexta">Sexta-feira</option>
          <option value="Sabado">Sábado</option>
          <option value="Domingo">Domingo</option>
          <option value="Segunda a Sexta">Segunda a Sexta</option>
          <option value="terça a Sexta">terça a Sexta</option>
          <option value="Sábado a Domingo">Sábado a Domingo </option>
        </select>
        <label for="horaInicio">Início:</label>
        <input v-model="horaInicio" type="time" id="horaInicio" name="horaInicio" />
        <label for="horaTermino">Término:</label>
        <input v-model="horaTermino" type="time" id="horaTermino" name="horaTermino" />
        <button type="submit" :disabled="isEditing" :class="{ 'disabled-button': isEditing }">
          {{ isEditing ? 'Salvando...' : 'Salvar' }}
        </button>
      </form>
      <p v-if="timeFieldsError" class="error-message">{{ timeFieldsError }}</p>
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
  </div>
</template>

<script>
export default {
  name: "DashHorAtendimento",
  props: {
    value: {
      type: Array, // O valor passado pelo componente pai
    }
  },
  data() {
    return {
      diaSelecionado: "Segunda",
      horariosPorDia: {},// contagem de horários por dia
      horaInicio: "",
      horaTermino: "",
      listahorarios: [], // Array para armazenar os horários de atendimento
      editingIndex: -1,
      isEditing: false,
      timeFieldsError: false,
    };
  },
  methods: {
    salvarHorario() {
      if (!this.horaInicio || !this.horaTermino) {
        this.timeFieldsError = "Preencha ambos os horários.";
      } else {
        const diaSelecionado = this.diaSelecionado;

        if (
          diaSelecionado === "Segunda a Sexta" ||
          diaSelecionado === "terça a Sexta" ||
          diaSelecionado === "Sábado a Domingo"
        ) {
          const diasEspeciais = {
            "Segunda a Sexta": ["Segunda", "Terca", "Quarta", "Quinta", "Sexta"],
            "terça a Sexta": ["Terca", "Quarta", "Quinta", "Sexta"],
            "Sábado a Domingo": ["Sabado", "Domingo"],
          };

          const diasSelecionados = diasEspeciais[diaSelecionado];
          const diasJaSelecionados = diasSelecionados.filter(
            (dia) => this.horariosPorDia[dia]
          );

          if (diasJaSelecionados.length + this.horariosPorDia[diaSelecionado] >= 2) {
            this.timeFieldsError = "Limite de dois dias para este período atingido.";
            return;
          }

          diasSelecionados.forEach((dia) => {
            this.horariosPorDia[dia]++;
          });
        } else {
          if (!this.horariosPorDia[diaSelecionado]) {
            this.horariosPorDia[diaSelecionado] = 1;
          } else if (this.horariosPorDia[diaSelecionado] < 2) {
            this.horariosPorDia[diaSelecionado]++;
          } else {
            this.timeFieldsError = "Limite de dois horários para este dia atingido.";
            return;
          }
        }

        const novoHorario = {
          dia: diaSelecionado,
          abre: this.horaInicio,
          fecha: this.horaTermino,
        };
        this.listahorarios.push(novoHorario);
        this.limparCampos();
        this.timeFieldsError = ""; // Limpar o erro, caso tenha sido exibido anteriormente

        this.$emit("input", this.listahorarios); // Emitir o evento para atualizar o valor no componente pai
      }
    },
    limparCampos() {
      this.diaSelecionado = "Segunda";
      this.horaInicio = "";
      this.horaTermino = "";
    },
    editarhorario(index) {
      this.editingIndex = index;
      this.diaSelecionado = this.listahorarios[index].dia;
      this.horaInicio = this.listahorarios[index].abre;
      this.horaTermino = this.listahorarios[index].fecha;
      this.isEditing = true; 
    },
    salvarEdicao(index) {
      const diaSelecionado = this.diaSelecionado;
      const diaAnterior = this.listahorarios[index].dia;

      if (
        diaSelecionado === "Segunda a Sexta" ||
        diaSelecionado === "terça a Sexta" ||
        diaSelecionado === "Sábado a Domingo"
      ) {
        const diasEspeciais = {
          "Segunda a Sexta": ["Segunda", "Terca", "Quarta", "Quinta", "Sexta"],
          "terça a Sexta": ["Terca", "Quarta", "Quinta", "Sexta"],
          "Sábado a Domingo": ["Sabado", "Domingo"],
        };

        const diasSelecionados = diasEspeciais[diaSelecionado];
        const diasJaSelecionados = diasSelecionados.filter(
          (dia) => dia !== diaAnterior && this.horariosPorDia[dia]
        );

        if (diasJaSelecionados.length + this.horariosPorDia[diaSelecionado] >= 2) {
          this.timeFieldsError = "Limite de dois dias para este período atingido.";
          return;
        }

        diasSelecionados.forEach((dia) => {
          if (dia !== diaAnterior) {
            this.horariosPorDia[dia]++;
          }
        });
      } else {
        if (
          !this.horariosPorDia[diaSelecionado] ||
          this.horariosPorDia[diaSelecionado] === 1
        ) {
          if (diaSelecionado !== diaAnterior) {
            this.horariosPorDia[diaAnterior]--;
            this.horariosPorDia[diaSelecionado]++;
            this.listahorarios[index].dia = diaSelecionado;
          }
        } else {
          this.timeFieldsError = "Limite de dois horários para este dia atingido.";
          return;
        }
      }

      this.listahorarios[index].abre = this.horaInicio;
      this.listahorarios[index].fecha = this.horaTermino;
      this.cancelarEdicao();
    },
    cancelarEdicao() {
      this.editingIndex = -1;
      this.limparCampos();
      this.isEditing = false; 
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

      this.listahorarios.splice(index, 1);
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
input[type="time"],
select,
button {
  margin: 0.4rem 0;
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
  /* Adjust button padding for smaller screens */
  button {
    padding: 8px 30px;
  }
}

@media (max-width: 768px) {
  .container {
    max-width: 600px;
  }
  /* Adjust table font size and padding */
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
  /* Adjust button padding for smaller screens */
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
  /* Adjust table font size and padding */
  table {
    font-size: 10px;
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
}

@media (max-width: 350px) {
  h1 {
    font-size: 18px;
  }
  /* Adjust button and input padding for smaller screens */
  button {
    padding: 8px 15px;
  }
  input {
    padding: 8px 10px;
  }
  /* Adjust table font size and padding for very small screens */
  table {
    font-size: 10px;
  }
  th,
  td {
    padding: 3px;
  }
  /* Adjust button padding for very small screens */
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
