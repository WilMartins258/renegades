<template>
  <div id="form-wrap" class="form">
    <div class="posicaoform-wrap">
      <!--Pesquisa por cep e completa os campos-->
      <!--1-Endereço-->
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

      <!--2-Contato-->

      <div class="group">
        <label for="nome" class="label">Telefone:</label><br />
        <input
          type="text"
          id="telefone"
          class="input"
          name="telefone"
          required
        /><br />
      </div>

      <div class="group">
        <label for="whatsapp" class="label">É WhatsApp?</label><br />
        <input type="checkbox" id="whatsapp" name="whatsapp" />
      </div>

      <div class="group">
        <label for="nome" class="label">Celular:</label><br />
        <input
          type="text"
          id="celular"
          class="input"
          name="celular"
          required
        /><br />
      </div>

      <div class="group">
        <label for="whatsapp" class="label">É WhatsApp?</label><br />
        <input type="checkbox" id="whatsapp" name="whatsapp" />
      </div>

      <div class="group">
        <label for="nome" class="label">Informe seu site:</label><br />
        <input type="text" id="site" class="input" name="site" /><br />
      </div>

      <div class="group">
        <label for="nome" class="label">Cardápio Online:</label><br />
        <input type="text" id="nome" class="input" name="nome" /><br />
      </div>

      <!--3-Dados do Estabelecimento-->

      <div class="group">
        <label for="nome" class="label">Nome do Estabelecimento:</label><br />
        <input type="text" id="nome" class="input" name="nome" /><br />
      </div>

      <div class="group">
        <label for="cnpj" class="label">CNPJ:</label><br />
        <input type="text" id="cnpj" class="input" name="cnpj" required /><br />
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
        <label for="tipo" class="label">Oferece Rodízio?</label><br />
        <input
          type="radio"
          id="rodizioSim"
          name="tipo"
          value="rodizioSim"
          required
          checked
        />
        <label for="rodizioSim" class="label2">Sim</label><br />
        <input
          type="radio"
          id="rodizioNao"
          name="tipo"
          value="rodizioNao"
          required
        />
        <label for="rodizioNao" class="label2">Não</label><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">Precisa Agendar?</label><br />
        <input
          type="radio"
          id="agendarSim"
          name="tipo"
          value="agendarSim"
          required
          checked
        />
        <label for="agendarSim" class="label2">Sim</label><br />
        <input
          type="radio"
          id="agendarNao"
          name="tipo"
          value="agendarNao"
          required
        />
        <label for="agendarNao" class="label2">Não</label><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">Tem Estacionamento?</label><br />
        <input
          type="radio"
          id="EstacionamentoSim"
          name="tipo"
          value="EstacionamentoSim"
          required
          checked
        />
        <label for="EstacionamentoSim" class="label2">Sim</label><br />
        <input
          type="radio"
          id="EstacionamentoNao"
          name="tipo"
          value="EstacionamentoNao"
          required
        />
        <label for="EstacionamentoNao" class="label2">Não</label><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">Tem Estacionamento?</label><br />
        <input
          type="radio"
          id="EstacionamentoSim"
          name="tipo"
          value="EstacionamentoSim"
          required
          checked
        />
        <label for="EstacionamentoSim" class="label2">Sim</label><br />
        <input
          type="radio"
          id="EstacionamentoNao"
          name="tipo"
          value="EstacionamentoNao"
          required
        />
        <label for="EstacionamentoNao" class="label2">Não</label><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">Toca Musica?</label><br />
        <input
          type="radio"
          id="musicaSim"
          name="tipo"
          value="musicaSim"
          required
          checked
        />
        <label for="musicaSim" class="label2">Sim</label><br />
        <input
          type="radio"
          id="musicaNao"
          name="tipo"
          value="musicaNao"
          required
        />
        <label for="musicaNao" class="label2">Não</label><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">é ao Musica?</label><br />
        <input
          type="radio"
          id="aoVivoSim"
          name="tipo"
          value="aoVivoSim"
          required
          checked
        />
        <label for="musicaSim" class="label2">Sim</label><br />
        <input
          type="radio"
          id="aoVivoNao"
          name="tipo"
          value="aoVivoNao"
          required
        />
        <label for="aoVivoNao" class="label2">Não</label><br /><br />
      </div>

      <div class="group">
        <label for="generoMusica" class="label">Gênero de Música:</label><br />
        <select id="generoMusica" class="input" name="generoMusica" required>
          <option value="rock">Rock</option>
          <option value="sertanejo">Sertanejo</option>
          <option value="jazz">Jazz</option>
          <option value="pop">Pop</option></select
        ><br /><br />
      </div>

      <div class="group">
        <label for="categoriaEstabelecimento" class="label"
          >Categoria do Estabelecimento:</label
        ><br />
        <select
          id="categoriaEstabelecimento"
          class="input"
          name="categoriaEstabelecimento"
          required
        >
          <option value="bar">Bar</option>
          <option value="lanchonete">Lanchonete</option>
          <option value="pizzaria">Pizzaria</option>
          <option value="hamburgueria">Hamburgueria</option></select
        ><br /><br />
      </div>

      <!--3-Prato Principal-->

      <h2>Cadastre até 3 pratos pricipais</h2>

      <div class="group">
        <label for="nomePrato1" class="label">Item 1:</label><br />
        <input
          type="text"
          id="nomePrato1"
          class="input"
          name="nomePrato1"
        /><br />
      </div>

      <div class="group">
        <label for="descricaoItem1" class="label">Descrição do item 1:</label
        ><br />
        <textarea
          id="descricaoItem1"
          class="input"
          name="descricaoItem1"
          rows="4"
          maxlength="200"
          required
        ></textarea>
        <br />
        <span id="contador">0</span>/<span>200</span><br /><br />
      </div>

      <div class="group">
        <label for="nomePrato2" class="label">Item 2:</label><br />
        <input
          type="text"
          id="nomePrato2"
          class="input"
          name="nomePrato2"
        /><br />
      </div>

      <div class="group">
        <label for="descricaoItem2" class="label">Descrição do item 1:</label
        ><br />
        <textarea
          id="descricaoItem2"
          class="input"
          name="descricaoItem2"
          rows="4"
          maxlength="200"
          required
        ></textarea>
        <br />
        <span id="contador">0</span>/<span>200</span><br /><br />
      </div>

      <div class="group">
        <label for="nomePrato3" class="label">Item 3:</label><br />
        <input
          type="text"
          id="nomePrato3"
          class="input"
          name="nomePrato3"
        /><br />
      </div>

      <div class="group">
        <label for="descricaoItem3" class="label">Descrição do item 3:</label
        ><br />
        <textarea
          id="descricaoItem3"
          class="input"
          name="descricaoItem3"
          rows="4"
          maxlength="200"
          required
        ></textarea>
        <br />
        <span id="contador">0</span>/<span>200</span><br /><br />
      </div>

      <!--foto prato principal-->

      <div class="group">
        <label for="imagens" class="label">Imagens (Max. 3):</label><br />
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

      <!--foto Estabelecimento-->

      <div class="group">
        <label for="imagemEstabelecimento" class="label"
          >Imagem do Estabelecimento:</label
        ><br />
        <input
          type="file"
          id="imagemEstabelecimento"
          name="imagemEstabelecimento"
          accept="image/jpeg, image/gif, image/png, image/tiff, image/bmp"
          @change="adicionarImagemEstabelecimento"
        /><br /><br />

        <div id="miniatura-imagem-estabelecimento">
          <div class="miniatura">
            <img
              :src="imagemEstabelecimentoSrc"
              alt="Imagem do Estabelecimento"
            />
            <button class="excluir" @click="excluirImagemEstabelecimento">
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
      imagemEstabelecimentoSrc: "",
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
    adicionarImagemEstabelecimento(event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = () => {
          this.imagemEstabelecimentoSrc = reader.result;
        };
        reader.readAsDataURL(file);
      }
    },
    excluirImagemEstabelecimento() {
      this.imagemEstabelecimentoSrc = "";
    },


  },
  mounted() {
    const cnpjInput = document.getElementById("cnpj");
    const cnpjMask = IMask(cnpjInput, {
      mask: "00.000.000/0000-00",
    });

    const telefoneInput = document.getElementById("telefone");
    const telefoneMask = IMask(telefoneInput, {
      mask: "(00) 0000-0000",
    });

    const celularInput = document.getElementById("celular");
    const celularMask = IMask(celularInput, {
      mask: "(00) 00000-0000",
    });

    /*Img Cardápio*/
    const imagensInput = document.getElementById("imagens");

    imagensInput.addEventListener("change", () => {
      const files = Array.from(imagensInput.files);
      const imagensRestantes = 3 - this.imagensSelecionadas.length;
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

    /*Img Logo Estabelecimento*/

    
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
