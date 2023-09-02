<template>
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
  <input type="text" v-model="telefone" id="telefone" class="input" name="telefone" required />
</div>

<div class="group">
<input type="checkbox" v-model="isTelefoneWhatsApp" id="whatsapp" name="whatsapp" />
<label for="whatsapp">
  <img src="../../../public/img/whatsappLogo.png" alt="É WhatsApp?" class="whatsapp-image" />
</label>
</div><br />

<div class="group">
  <label for="celular" class="label">Celular:</label><br />
  <input type="text" v-model="celular" id="celular" class="input" name="celular" required />
</div>

<div class="group">
<input type="checkbox" v-model="isCelularWhatsApp" id="whatsappCelular" name="whatsapp" />
<label for="whatsappCelular">
  <img src="../../../public/img/whatsappLogo.png" alt="É WhatsApp?" class="whatsapp-image" />
</label>
</div><br />

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
  <input v-model="cnpj" type="text" id="cnpj" class="input" name="cnpj" required ref="cnpjInput"/>
</div>

<div class="group">
  <label for="cpf" class="label">CPF:</label><br />
  <input v-model="cpf" type="text" id="cpf" class="input" name="cpf" required ref="cpfInput"/>
</div>

<div class="group">
  <label for="descricao" class="label">Descrição do Estabelecimento:</label><br />
  <textarea v-model="descricaoEstabelecimento" id="descricao" class="input" name="descricao" rows="4" maxlength="200" required></textarea>
</div>

<div class="group ex1">
  <label class="label">Oferece Rodízio?</label>
  <br>
  <label class="radio sim">
    <input type="radio" name="ofereceRodizio" value="1" v-model="ofereceRodizio" style="display: none;"> 
    <span>Sim</span>
  </label>
  <label class="radio nao">
    <input class="Teste" type="radio" name="ofereceRodizio" value="2" v-model="ofereceRodizio" style="display: none;" checked>
    <span>Não</span>
  </label>
</div><br>

<div class="group ex1">
    <label class="label">Toca Música?</label>
    <br>
    <label class="radio sim">
      <input type="radio" name="tocaMusica" value="1" v-model="tocaMusica" style="display: none;"> 
      <span>Sim</span>
    </label>
    <label class="radio nao">
      <input type="radio" name="tocaMusica" value="2" v-model="tocaMusica" style="display: none;" checked>
      <span>Não</span>
    </label>
  </div><br>

  <div class="group ex1" v-show="tocaMusica === '1'">
    <label class="label">É ao Vivo?</label>
    <br>
    <label class="radio sim">
      <input type="radio" name="musicaAoVivo" value="1" v-model="musicaAoVivo" style="display: none;"> 
      <span>Sim</span>
    </label>
    <label class="radio nao">
      <input type="radio" name="musicaAoVivo" value="2" v-model="musicaAoVivo" style="display: none;" checked>
      <span>Não</span>
    </label>
  </div><br>

  <div class="group" v-show="tocaMusica === '1'">
    <label for="generoMusica" class="label">Gênero de Música:</label><br />
    <select v-model="generoMusica" id="generoMusica" class="input" name="generoMusica" required>
      <option value="rock">Rock</option>
      <option value="sertanejo">Sertanejo</option>
      <option value="jazz">Jazz</option>
      <option value="pop">Pop</option>
    </select><br />

</div>
  </section><!-- Fecha seção 3-->

  <section v-show="currentSection === 4">

  <div class="group ex1">
    <label class="label">Tem Área Kids?</label>
    <br>
    <label class="radio sim">
      <input type="radio" name="areaKids" value="1" v-model="areaKids" style="display: none;"> 
      <span>Sim</span>
    </label>
    <label class="radio nao">
      <input type="radio" name="areaKids" value="2" v-model="areaKids" style="display: none;" checked>
      <span>Não</span>
    </label>
  </div><br>

    <div class="group">
  <label for="categoriaEstabelecimento" class="label">Categoria do Estabelecimento:</label><br />
  <select v-model="categoriaEstabelecimento" id="categoriaEstabelecimento" class="input" name="categoriaEstabelecimento" required>
    <option value="bar">Bar</option>
    <option value="lanchonete">Lanchonete</option>
    <option value="pizzaria">Pizzaria</option>
    <option value="hamburgueria">Hamburgueria</option>
  </select><br />
  </div>
  <div class="group ex1">
  <label class="label">Precisa Agendar?</label>
  <br>
  <label class="radio sim">
    <input type="radio" name="precisaAgendar" value="1" v-model="precisaAgendar" style="display: none;"> 
    <span>Sim</span>
  </label>
  <label class="radio nao">
    <input type="radio" name="precisaAgendar" value="2" v-model="precisaAgendar" style="display: none;" checked>
    <span>Não</span>
  </label>
</div><br>

<div class="group ex1">
  <label class="label">Tem Estacionamento?</label>
  <br>
  <label class="radio sim">
    <input type="radio" name="temEstacionamento" value="1" v-model="temEstacionamento" style="display: none;"> 
    <span>Sim</span>
  </label>
  <label class="radio nao">
    <input type="radio" name="temEstacionamento" value="2" v-model="temEstacionamento" style="display: none;" checked>
    <span>Não</span>
  </label>
</div>
  </section><!-- Fecha seção 4-->

  

  <section v-show="currentSection === 5">
    <h2>Indicação do Chef</h2><br><br>
    <div id="indication-container">
    <div v-for="(recomendacoes, index) in recomendacao" :key="index" class="group">
      <label :for="'indicacao' + (index + 1)" class="label">{{ index + 1 }}° Indicação:</label><br />
      <input
        :id="'indicacao' + (index + 1)"
        v-model="recomendacoes.name"
        type="text"
        class="input"
        :name="'indicacao' + (index + 1)"
      /><br />

      <label :for="'descricaoIndic' + (index + 1)" class="label">Descrição da {{ index + 1 }}° Indicação:</label><br />
      <textarea
        :id="'descricaoIndic' + (index + 1)"
        v-model="recomendacoes.description"
        class="input"
        :name="'descricaoIndic' + (index + 1)"
        rows="4"
        maxlength="200"
        required
      ></textarea>

      <label :for="'fotoIndic' + (index + 1)" class="label">Foto da {{ index + 1 }}° Indicação:</label><br />
      <input
        :id="'fotoIndic' + (index + 1)"
        type="file"
        accept="image/*"
        @change="AddFoto($event, index)"
      />
      <img
        v-if="recomendacoes.photo && recomendacoes.photo.imageURL"
        :src="recomendacoes.photo.imageURL"
        alt="Foto da Indicação"
        class="miniatura-imagem"
      />
    </div>

    <div class="buttons">
      <button class="custom-button" v-if="recomendacao.length < 3" @click="addrecomendacoes">Adicionar Recomendação</button>
      <button class="custom-button" v-if="recomendacao.length > 1" @click="removerecomendacoes">Cancelar Recomendação</button>
    </div>
  </div>
  </section><!-- Fecha seção 5-->

  <section v-show="currentSection === 6">
         
   <!-- Foto Estabelecimento -->
     <h3>Adicione aqui a foto do seu estabelecimento</h3><br>
  <div class="group">
    <label for="estabelecimentoPhoto" class="label">Foto do Estabelecimento:</label><br />
    <input
      type="file"
      id="estabelecimentoPhoto"
      accept="image/*"
      @change="handleEstabelecimentoPhotoChange"
    />
    <img
      v-if="estabelecimentoPhoto"
      :src="estabelecimentoPhoto"
      alt="Foto do Estabelecimento"
      class="miniatura-imagem"
    />
  </div>

  <DashHorAtendimento/>

  </section><!-- Fecha seção 6-->

  <div class="buttons">
    <button class="custom-button" @click="previousSection" :disabled="currentSection === 1" ><i class="uil uil-arrow-circle-left"></i></button>
    <button class="custom-button" @click="nextSection" :disabled="currentSection === 6"><i class="uil uil-arrow-circle-right"></i></button>
  </div>
</div>

      <!------------------------------------->

  </div> <!-- Fechar "posicaoform-wrap" -->
</div> <!-- Fechar "form-wrap" -->
</template>

<script>
import IMask from "imask";
import axios from "axios";
import DashHorAtendimento from "./ComponentsChild/DashHorAtendimento.vue"
export default {
components: {
  DashHorAtendimento,
},
name: "AddEstabelecimento",
data() {
  return {
    currentSection: 1,
    cnpj: "",
    cep: "",
    endereco: {
      rua: "",
      bairro: "",
      cidade: "",
      uf: "",
      },
      recomendacao: [
      { name: '', description:  '', photo: null },],
      tocaMusica: '2', // '1'  Sim, '2'  Não
      estabelecimentoPhoto: null,
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

      /*Img Cardápio*/
  addrecomendacoes() {
    if (this.recomendacao.length < 3) {
      this.recomendacao.push({ name: '', description: '' });
    }
  },
  AddFoto(event, index) {
    const file = event.target.files[0];
    if (file) {
      const imageURL = URL.createObjectURL(file);
      this.recomendacao[index].photo = { file, imageURL };
    }
  },

  /*Img estabelecimento*/
  handleEstabelecimentoPhotoChange(event) {
    const file = event.target.files[0];
    if (file) {
      this.estabelecimentoPhoto = URL.createObjectURL(file);
    }
  },

  removerecomendacoes() {
    if (this.recomendacao.length > 0) {
      const removedPhoto = this.recomendacao.pop().photo;
      if (removedPhoto && removedPhoto.imageURL) {
        URL.revokeObjectURL(removedPhoto.imageURL);
      }
    }
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
}
};
</script>


<style scoped>
#form-wrap {
/*Imagem de fundo do forms*/
color: white;
background-image: url("../../../public/img/FormEstabelecimento.jpg");
background-size: cover;
background-position: center;
background-attachment: fixed;
width: 100%;
height: 100vh;
}

h2 {
color: #fff;
}

.label {
color: #fff;
}

.miniatura-imagem {
width: 100px; 
height: 100px; 
object-fit: cover;
border: 2px solid red;
margin-top: 10px;
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

}

.custom-file-input {
display: none;
}
</style>

