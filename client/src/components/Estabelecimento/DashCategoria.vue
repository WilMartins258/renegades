<template>
  
  <div class="container">
    <h1>Categorias</h1>
    <div>
      <form @submit.prevent="salvarCategoria">
        <label for="novaCategoria">Nova Categoria:</label>
        <input
          v-model="novaCategoria"
          type="text"
          id="novaCategoria"
          placeholder="Digite aqui"
        />
        <button type="submit">Salvar</button>
      </form>
    </div>
    <table>
      <thead>
        <tr>
          <th>Categoria</th>
          <th>Opções</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(categoria, index) in listaCategorias" :key="index">
          <td>{{ categoria }}</td>
          <td>
            <button @click="editarCategoria(index)">
              <i class="uil uil-edit"></i>
            </button>
            <button @click="excluirCategoria(index)">
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
  name: "DashCategoria",
  data() {
    return {
      novaCategoria: "",
      listaCategorias: [],
    };
  },
  methods: {
    salvarCategoria() {
      this.listaCategorias.push(this.novaCategoria);
      this.novaCategoria = "";
    },
    editarCategoria(index) {
      const novaCategoria = prompt(
        "Editar categoria:",
        this.listaCategorias[index]
      );
      if (novaCategoria && novaCategoria.trim() !== "") {
        this.listaCategorias[index] = novaCategoria;
      }
    },
    excluirCategoria(index) {
      if (confirm("Tem certeza que deseja excluir esta categoria?")) {
        this.listaCategorias.splice(index, 1);
      }
    },
  },
};
</script>

ste

<style scoped>

.background-container {
  background: url(https://img.elo7.com.br/product/zoom/2BAFCB7/papel-de-parede-infantil-meninos-papel-de-parede-personalizado-para-quarto.jpg) no-repeat center;
  background-size: cover;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.8); /* Optional: Adding a semi-transparent white background to the container */
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
  background: #8d72e1;
  cursor: pointer;
  transition: 0.5s;
  border: none;
  padding: 8px 50px;
  border-radius: 25px;
}

input {
  border: none;
  padding: 8px 60px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
}

.button:hover {
  background: #51389d;
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
  .container {
    max-width: 350px;
  }
  
  form {
    justify-content: flex-start;
  }
  
  button {
    margin-top: 10px;
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
    padding: 8px 14px;
}
}
</style>


