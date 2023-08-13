<template>
  <div id="form-wrap" class="form">
    <br />
    <h2>Crie seu Estabelecimento</h2>
    <div class="posicaoform-wrap">
      <div class="group">
        <label for="nome" class="label">Nome do Estabelecimento:</label><br />
        <input type="text" id="nome" class="input" name="nome" required /><br />
      </div>

      <div class="group">
        <label for="cnpj" class="label">CNPJ:</label><br />
        <input type="text" id="cnpj" class="input" name="cnpj" required /><br />
      </div>

      <!--Pesquisa por cep e completa os campos-->

      <div class="group">
        <label for="cep" class="label">CEP:</label><br />
        <input
          v-model="cep"
          type="text"
          id="cep"
          class="input"
          name="cep"
          @blur="pesquisarCep"
          required
        /><br />
      </div>
      <div class="group">
        <label for="rua" class="label">Rua:</label><br />
        <input
          v-model="endereco.rua"
          type="text"
          id="rua"
          class="input"
          name="rua"
        /><br />
      </div>
      <div class="group">
        <label for="numero" class="label">Número:</label><br />
        <input
          ref="numeroInput"
          type="text"
          id="numero"
          class="input"
          name="numero"
          required
        /><br />
      </div>
      <div class="group">
        <label for="bairro" class="label">Bairro:</label><br />
        <input
          v-model="endereco.bairro"
          type="text"
          id="bairro"
          class="input"
          name="bairro"
        /><br />
      </div>
      <div class="group">
        <label for="cidade" class="label">Cidade:</label><br />
        <input
          v-model="endereco.cidade"
          type="text"
          id="cidade"
          class="input"
          name="cidade"
        /><br />
      </div>
      <div class="group">
        <label for="uf" class="label">Estado:</label><br />
        <input
          v-model="endereco.uf"
          type="text"
          id="uf"
          class="input"
          name="uf"
        /><br />
      </div>

      <div class="group">
        <label for="descricao" class="label"
          >Descrição do Estabelecimento:</label
        ><br />
        <textarea
          id="descricao"
          class="input"
          name="descricao"
          rows="4"
          maxlength="200"
          required
        ></textarea>
        <br />
        <span id="contador">0</span>/<span>200</span><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">Tipo do Anúncio:</label><br />
        <input
          type="radio"
          id="doacao"
          name="tipo"
          value="doacao"
          required
          checked
        />
        <label for="doacao" class="label2">Doação</label><br />
        <input type="radio" id="troca" name="tipo" value="troca" required />
        <label for="troca" class="label2">Troca</label><br /><br />
      </div>

      <div class="group">
        <label for="categoria" class="label"
          >Categoria do Estabelecimento:</label
        ><br />
        <select id="categoria" class="input" name="categoria" required>
          <option value="brinquedo">Bar</option>
          <option value="roupa">Lanchonete</option>
          <option value="alimento">Pizzaria</option>
          <option value="carrinho">Hamburgueria</option></select
        ><br /><br />
      </div>

      <div class="group">
        <label for="imagens" class="label">Imagens (Max. 4):</label><br />
        <input
          type="file"
          id="imagens"
          name="imagens[]"
          accept="image/jpeg, image/gif, image/png, image/tiff, image/bmp"
          multiple
        /><br /><br />

        <div id="miniatura-container">
          <div
            v-for="(imagem, index) in imagensSelecionadas"
            :key="index"
            class="miniatura"
          >
            <img :src="imagem.src" alt="Imagem" />
            <button class="excluir" @click="excluirMiniatura(index)">
              <i class="uil uil-times"></i>
            </button>
          </div>
        </div>
        <br /><br />
      </div>

      <div class="group">
        <div>
          <input type="button" class="button" value="Salvar" />
          <input
            type="button"
            class="button"
            value="Cancelar"
            @click="cancelar"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import IMask from "imask";
import axios from "axios";
export default {
  components: {},
  name: "AddEstabelecimento",
  data() {
    return {
      imagensSelecionadas: [],
      cnpj: "",
      cep: "",
      endereco: {
        rua: "",
        bairro: "",
        cidade: "",
        uf: "",
      },
    };
  },
  methods: {
    excluirMiniatura(index) {
      this.imagensSelecionadas.splice(index, 1);
    },
    cancelar() {
      this.$router.push("/form-wrap");
    },
    limpa_formulário_cep() {
      document.getElementById("rua").value = "";
      document.getElementById("bairro").value = "";
      document.getElementById("cidade").value = "";
      document.getElementById("uf").value = "";
    },
    meu_callback(conteudo) {
      if (!("erro" in conteudo)) {
        document.getElementById("rua").value = conteudo.logradouro;
        document.getElementById("bairro").value = conteudo.bairro;
        document.getElementById("cidade").value = conteudo.localidade;
        document.getElementById("uf").value = conteudo.uf;
      } else {
        this.limpa_formulário_cep();
        alert("CEP não encontrado.");
      }
    },
    pesquisarCep() {
      var cep = this.cep.replace(/\D/g, "");
      if (cep !== "") {
        var validacep = /^[0-9]{8}$/;
        if (validacep.test(cep)) {
          axios
            .get(`https://viacep.com.br/ws/${cep}/json/`)
            .then((response) => {
              this.meu_callback(response.data);
              this.$refs.numeroInput.focus();
            })
            .catch((error) => {
              this.limpa_formulário_cep();
              alert("CEP não encontrado.");
            });
        } else {
          this.limpa_formulário_cep();
          alert("Formato de CEP inválido.");
        }
      } else {
        this.limpa_formulário_cep();
      }
    },
  },
  mounted() {
    const cnpjInput = document.getElementById("cnpj");
    const cnpjMask = IMask(cnpjInput, {
      mask: "00.000.000/0000-00",
    });

    const imagensInput = document.getElementById("imagens");

    imagensInput.addEventListener("change", () => {
      const files = Array.from(imagensInput.files);
      const imagensRestantes = 4 - this.imagensSelecionadas.length;
      const novasImagens = files.slice(0, imagensRestantes);

      novasImagens.forEach((file) => {
        const reader = new FileReader();

        reader.onload = () => {
          const miniatura = { src: reader.result };
          this.imagensSelecionadas.push(miniatura);
        };

        reader.readAsDataURL(file);
      });

      imagensInput.value = "";
    });
  },
};
</script>


<style scoped>
#form-wrap {
  /*Imagem de fundo do forms*/
  min-height: 1500px;
  background-image: url("https://img.freepik.com/vetores-gratis/papel-de-parede-mural-do-restaurante_23-2148695092.jpg?w=900&t=st=1691866632~exp=1691867232~hmac=21d65c3cc870912f929637ba1f0b0e7e37fc93f5ad62c92f9803f5cf52f03be5");
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  width: 100%;
  height: 100vh;
}

span {
  color: #fff;
}

.form .group .label2 {
  color: #fff;
}

.miniatura {
  display: inline-block;
  position: relative;
  margin-right: 10px;
}

.miniatura img {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border: 3px solid #fff;
}

.miniatura .excluir {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: white;
  border: none;
  color: red;
  font-weight: bold;
  cursor: pointer;
}

h2 {
  color: #fff;
}

.label {
  color: #fff;
}
/* Responsividade */

@media (max-width: 1160px) {
  #form-wrap {
    max-width: 950px;
  }
}

@media (max-width: 950px) {
  #form-wrap {
    max-width: 768px;
  }
}

@media (max-width: 768px) {
  .group .button,
  .group .input {
    padding: 10px;
    margin-bottom: 10px;
    display: block;
    width: 100%;
  }

  .miniatura {
    margin-bottom: 10px;
  }
}
</style>
