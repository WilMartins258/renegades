<template>
  
  <div class="container">
    <h1>Estilos Musicais</h1>
    <div>
      <form @submit.prevent="salvarMusica">
        <label for="novaMusica">Nova musica:</label>
        <input
          v-model="novaMusica"
          type="text"
          id="novaMusica"
          placeholder="Digite aqui"
          :class="{ 'error': campoVazio }"
        />
        <button type="submit">Salvar</button>
        <p v-if="campoVazio" class="error-message">Informe uma estilo de música valido.</p>
      </form>
    </div>
    <table>
      <thead>
        <tr>
          <th>Estilos Musicais</th>
          <th>Editar/Excluir</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(musica, index) in listaMusicas" :key="index">
          <td>{{ musica }}</td>
          <td>
            <button class="respButton" @click="editarMusica(index)">
              <i class="uil uil-edit"></i>
            </button>
            <button class="respButton" @click="excluirMusica(index)">
              <i class="uil uil-file-times-alt"></i>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "DashEstiloMusica",
  data() {
    return {
        novaMusica: "",
        listaMusicas: [],
        campoVazio: false, // Variável de estado para verificar se o campo está vazio
      };
    },
    methods: {
      salvarMusica() {
        if (this.novaMusica.trim() !== "") {
          this.listaMusicas.push(this.novaMusica);
          this.novaMusica = "";
          this.campoVazio = false; // Reiniciar o estado de campo vazio
        } else {
          this.campoVazio = true; // Definir o estado de campo vazio como verdadeiro
        }
      },
    editarMusica(index) {
      const novaMusica = prompt(
        "Editar seu Estilo Musical:",
        this.listaMusicas[index]
      );
      if (novaMusica && novaMusica.trim() !== "") {
        this.listaMusicas[index] = novaMusica;
      }
    },
    excluirMusica(index) {
      if (confirm("Tem certeza que deseja excluir esse estilo?")) {
        this.listaMusicas.splice(index, 1);
      }
    },
  },
};
</script>

ste

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


