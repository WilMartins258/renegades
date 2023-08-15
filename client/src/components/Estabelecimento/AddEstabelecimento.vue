<template>
  <div class="main-container">
    <div id="form-wrap" class="form">
      <div class="posicaoform-wrap">

        <!------------------------------------->
                     <!--1-Endereço-->
        <div>
    <section v-show="currentSection === 1">
      <h2>Onde Fica Localizado?</h2>
      <br><br>
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
    </section><!-- Fecha seção 1-->

             <!--2-Contato-->

    <section v-show="currentSection === 2">
      <h2>Como podemos contatá-lo?</h2>
      <br><br>
  <div class="group">
    <label for="telefone" class="label">Telefone:</label><br />
    <input type="text" v-model="telefone" id="telefone" class="input" name="telefone" required /><br />
  </div>
  
  <div class="group">
    <input type="checkbox" v-model="isTelefoneWhatsApp" id="whatsapp" name="whatsapp" />
    <label for="whatsapp">É WhatsApp?</label>
  </div>

  <div class="group">
    <label for="celular" class="label">Celular:</label><br />
    <input type="text" v-model="celular" id="celular" class="input" name="celular" required /><br />
  </div>

  <div class="group">
  <input type="checkbox" v-model="isCelularWhatsApp" id="whatsappCelular" name="whatsapp" />
  <label for="whatsappCelular">É WhatsApp?</label>
  </div>

  <div class="group">
    <label for="site" class="label">Informe seu site:</label><br />
    <input type="text" v-model="site" id="site" class="input" name="site" /><br />
  </div>

  <div class="group">
    <label for="cardapioOnline" class="label">Cardápio Online:</label><br />
    <input type="text" v-model="cardapioOnline" id="cardapioOnline" class="input" name="nome" /><br />
  </div>
    </section><!-- Fecha seção 2-->

    <!--3-Dados do Estabelecimento-->

    <section v-show="currentSection === 3">
      <h2>Informações do estabelecimento:</h2><br><br>
      <div class="group">
    <label for="nome" class="label">Nome do Estabelecimento:</label><br />
    <input type="text" v-model="nomeEstabelecimento" id="nome" class="input" name="nome" />
  </div>

  <div class="group">
    <label for="cnpj" class="label">CNPJ:</label><br />
    <input v-model="cnpj" type="text" id="cnpj" class="input" name="cnpj" required ref="cnpjInput"
/>
  </div>

  <div class="group">
    <label for="descricao" class="label">Descrição do Estabelecimento:</label><br />
    <textarea v-model="descricaoEstabelecimento" id="descricao" class="input" name="descricao" rows="4" maxlength="200" required></textarea>
  </div>

  <div class="group">
    <label class="label">Oferece Rodízio?</label><br />
    <input type="radio" v-model="ofereceRodizio" value="Sim" required checked/> Sim
    <input type="radio" v-model="ofereceRodizio" value="Não" /> Não<br /><br />
  </div>

  <div class="group">
    <label class="label">Toca Música?</label><br />
    <input type="radio" v-model="tocaMusica" value="Sim" required checked/> Sim
    <input type="radio" v-model="tocaMusica" value="Não"  /> Não<br /><br />
  </div>

  <div class="group">
    <label class="label">É ao Vivo?</label><br />
    <input class="radio" type="radio" v-model="musicaAoVivo" value="Sim" required checked/> Sim
    <input type="radio" v-model="musicaAoVivo" value="Não"  /> Não<br /><br />
  </div>

  <div class="group">
    <label for="generoMusica" class="label">Gênero de Música:</label><br />
    <select v-model="generoMusica" id="generoMusica" class="input" name="generoMusica" required>
      <option value="rock">Rock</option>
      <option value="sertanejo">Sertanejo</option>
      <option value="jazz">Jazz</option>
      <option value="pop">Pop</option>
    </select><br /><br />
  </div>
    </section><!-- Fecha seção 3-->

    <section v-show="currentSection === 4">

      <div class="group">
    <label for="categoriaEstabelecimento" class="label">Categoria do Estabelecimento:</label><br />
    <select v-model="categoriaEstabelecimento" id="categoriaEstabelecimento" class="input" name="categoriaEstabelecimento" required>
      <option value="bar">Bar</option>
      <option value="lanchonete">Lanchonete</option>
      <option value="pizzaria">Pizzaria</option>
      <option value="hamburgueria">Hamburgueria</option>
    </select><br /><br />
  </div>
      <div class="group">
    <label class="label">Precisa Agendar?</label><br />
    <input type="radio" v-model="precisaAgendar" value="Sim" required checked/> Sim
    <input type="radio" v-model="precisaAgendar" value="Não"  /> Não<br /><br />
  </div>

  <div class="group">
    <label class="label">Tem Estacionamento?</label><br />
    <input type="radio" v-model="temEstacionamento" value="Sim" required checked/> Sim
    <input type="radio" v-model="temEstacionamento" value="Não" /> Não<br /><br />
  </div>
    </section><!-- Fecha seção 4-->

    

    <section v-show="currentSection === 5">
      <h2>Indicação do Chef</h2><br><br>
      <div class="group">
    <label for="indicacao1" class="label">1° Indicação:</label><br />
    <input type="text" v-model="indicacao1" id="indicacao1" class="input" name="indicacao1" /><br />
  </div>

  <div class="group">
    <label for="descricaoIndic1" class="label">Descrição da 1° Indicação::</label><br />
    <textarea v-model="descricaoIndic1" id="descricaoIndic1" class="input" name="descricaoIndic11" rows="4" maxlength="200" required></textarea>
  </div>

  <div class="group">
    <label for="indicacao2" class="label">2° Indicação:</label><br />
    <input type="text" v-model="indicacao2" id="indicacao2" class="input" name="indicacao2" /><br />
  </div>

  <div class="group">
    <label for="descricaoIndic2" class="label">Descrição da 2° Indicação:</label><br />
    <textarea v-model="descricaoIndic2" id="descricaoIndic2" class="input" name="descricaoIndic2" rows="4" maxlength="200" required></textarea>
  </div>

  <div class="group">
    <label for="indicacao3" class="label">3° Indicação:</label><br />
    <input type="text" v-model="indicacao3" id="indicacao3" class="input" name="indicacao3" /><br />
  </div>

  <div class="group">
    <label for="descricaoIndic3" class="label">Descrição da 3° Indicação:</label><br />
    <textarea v-model="descricaoIndic3" id="descricaoIndic3" class="input" name="descricaoIndic3" rows="4" maxlength="200" required></textarea>
  </div>
    </section><!-- Fecha seção 5-->

    <section v-show="currentSection === 6">
      <h2>Inclua Suas Imagens</h2><br><br>
      
      <!-- foto prato principal -->
      <h3>Adicione aqui as fotos das suas indicações</h3>
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
     <!-- Foto Estabelecimento -->
  <h3>Adicione aqui a foto do seu estabelecimento</h3>
  <div class="group">
    <label for="estabelecimentoImagens" class="label">Imagens do Estabelecimento (Max. 3):</label><br />
    <input
      type="file"
      id="estabelecimentoImagens"
      name="estabelecimentoImagens[]"
      accept="image/jpeg, image/gif, image/png, image/tiff, image/bmp"
      multiple
    /><br /><br />

    <div id="miniatura-estabelecimento-container">
      <div
        v-for="(imagem, index) in imagensEstabelecimentoSelecionadas"
        :key="index"
        class="miniatura"
      >
        <img :src="imagem.src" alt="Imagem" />
        <button class="excluir" @click="excluirEstabelecimentoMiniatura(index)">
          <i class="uil uil-times"></i>
        </button>
      </div>
    </div>
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
    </section><!-- Fecha seção 6-->

    <div class="buttons">
      <button class="custom-button" @click="previousSection" :disabled="currentSection === 1" ><i class="uil uil-arrow-circle-left"></i></button>
      <button class="custom-button" @click="nextSection" :disabled="currentSection === 6"><i class="uil uil-arrow-circle-right"></i></button>
    </div>
  </div>

        <!------------------------------------->

    </div> <!-- Fechar "posicaoform-wrap" -->
  </div> <!-- Fechar "form-wrap" -->
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
      currentSection: 1,
      imagensSelecionadas: [],
      imagensEstabelecimentoSelecionadas: [],
      cnpj: "",
      cep: "",
      endereco: {
        rua: "",
        bairro: "",
        cidade: "",
        uf: "",
        }
    };
  },
  methods: {
    nextSection() {
      if (this.currentSection < 6) {
        this.currentSection++;
      }
    },
    previousSection() {
      if (this.currentSection > 1) {
        this.currentSection--;
      }
    },
    cancelar() {
      this.$router.push("/");
    },
    excluirMiniatura(index) {
      this.imagensSelecionadas.splice(index, 1);
    },
    cancelar() {
      this.$router.push("/AreaDoEstabelecimento");
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
    excluirMiniatura(index) {
      this.imagensSelecionadas.splice(index, 1);
    },
    excluirEstabelecimentoMiniatura(index) {
    this.imagensEstabelecimentoSelecionadas.splice(index, 1);
     },
  },
  mounted(){
    const telefoneInput = document.getElementById("telefone");
  const telefoneMask = IMask(telefoneInput, {
    mask: "(00) 0000-0000",
  });

  const celularInput = document.getElementById("celular");
  const celularMask = IMask(celularInput, {
    mask: "(00) 00000-0000",
  });

  const cnpjInput = document.getElementById("cnpj");
  const cnpjMask = IMask(cnpjInput, {
    mask: "00.000.000/0000-00",
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
const estabelecimentoImagensInput = document.getElementById("estabelecimentoImagens");

estabelecimentoImagensInput.addEventListener("change", () => {
const files = Array.from(estabelecimentoImagensInput.files);
const imagensRestantes = 1 - this.imagensEstabelecimentoSelecionadas.length;
const novasImagens = files.slice(0, imagensRestantes);

novasImagens.forEach((file) => {
  const reader = new FileReader();

  reader.onload = () => {
    const miniatura = { src: reader.result };
    this.imagensEstabelecimentoSelecionadas.push(miniatura);
  };

  reader.readAsDataURL(file);
});

estabelecimentoImagensInput.value = "";
});

  }
};
</script>


<style scoped>
#form-wrap {
  /*Imagem de fundo do forms*/
  color: white;
  background-image: url("https://img.freepik.com/vetores-gratis/papel-de-parede-mural-do-restaurante_23-2148695092.jpg?w=900&t=st=1691866632~exp=1691867232~hmac=21d65c3cc870912f929637ba1f0b0e7e37fc93f5ad62c92f9803f5cf52f03be5");
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  width: 100%;
  height: 100vh;
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

