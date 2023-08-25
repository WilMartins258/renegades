<template>

    <div id="form-wrap" class="form">
      <div class="posicaoform-wrap">

        <div>
          <section v-show="currentSection === 1">
            <h2>Meu cadastro</h2><br/>
            <div class="personal-image">
              <label class="label">
                <input type="file" @change="AtualizarImagem" />
                <figure class="personal-figure">
                  <img :src="avatarSrc" class="personal-avatar" alt="avatar" ref="avatarImage">
                  <figcaption class="personal-figcaption">
                    <img src="https://raw.githubusercontent.com/ThiagoLuizNunes/angular-boilerplate/master/src/assets/imgs/camera-white.png">
                  </figcaption>
                </figure>
              </label>
            </div><br><br>

            <div class="group">
              <label for="nome" class="label">Nome Completo:</label><br />
              <input type="text" v-model="nome" id="nome" class="input" name="nome" />
            </div>

            <div class="group">
              <label for="cpf" class="label">CPF:</label><br />
              <input v-model="cpf" type="text" id="cpf" class="input" name="cpf" required ref="cpfInput"/>
            </div>

            <div class="group">
              <label for="dataNasc" class="label">Data de Nascimento:</label><br />
              <input v-model="dataNasc" type="text" id="dataNasc" class="input" name="dataNasc" required ref="dataNascInput" />
            </div>

            <div class="group">
            <label for="celular" class="label">Celular:</label><br />
            <input type="text" v-model="celular" id="celular" class="input" name="celular" required />
          </div>

          <div class="group">
            <input type="checkbox" v-model="isCelularWhatsApp" id="whatsappCelular" name="whatsapp" />
            <label for="whatsappCelular">
             <img src="../../../public/img/whatsappLogo.png" alt="É WhatsApp?" class="whatsapp-image" />
           </label>
        </div>
          </section> <!-- Fecha seção 1-->

          <section v-show="currentSection === 2">
            
          
          <div class="group">
            <label for="cep" class="label">CEP:</label><br />
            <input v-model="cep" type="text" id="cep" class="input" name="cep" @blur="pesquisarCep" required
            /><br />
        </div>
      <div class="group">
        <label for="rua" class="label">Rua:</label><br />
        <input v-model="endereco.rua" type="text" id="rua" class="input" name="rua"
        /><br />
      </div>
      <div class="group">
        <label for="numero" class="label">Número:</label><br />
        <input ref="numeroInput" type="text" id="numero" class="input" name="numero" required
        /><br />
      </div>
      <div class="group">
        <label for="bairro" class="label">Bairro:</label><br />
        <input v-model="endereco.bairro" type="text" id="bairro" class="input" name="bairro"
        /><br />
      </div>
      <div class="group">
        <label for="cidade" class="label">Cidade:</label><br />
        <input v-model="endereco.cidade" type="text" id="cidade" class="input" name="cidade"
        /><br />
      </div>
      <div class="group">
        <label for="uf" class="label">Estado:</label><br />
        <input v-model="endereco.uf" type="text" id="uf" class="input" name="uf"
        /><br />
      </div>

      <div class="group">
         <label for="apelido" class="label">Apelido:</label><br />
          <input type="text" v-model="apelido" id="apelido" class="input" name="apelido" />
      </div>     
      
      <div class="group">
         <label for="email" class="label">E-mail:</label><br />
          <input type="email" v-model="email" id="email" class="input" name="email" />
      </div>  

      <div class="group">
         <label for="senha" class="label">Senha:</label><br />
          <input type="password" v-model="senha" id="senha" class="input" name="senha" />
      </div>  

          </section> <!-- Fecha seção 2-->

          <div class="buttons">
            <button class="custom-button" @click="previousSection" :disabled="currentSection === 1">
              <i class="uil uil-arrow-circle-left"></i>
            </button>
            <button class="custom-button" @click="nextSection" :disabled="currentSection === 2">
              <i class="uil uil-arrow-circle-right"></i>
            </button>

          </div>
      </div> <!-- Fechar "posicaoform-wrap" -->
    </div> <!-- Fechar "form-wrap" -->
  </div> <!-- Fechar "posicaoform-wrap" -->
</template>

<script>
import IMask from "imask";
import axios from "axios";

export default {
  components: {},
  name: "AddUsuario",
  data() {
    return {
      currentSection: 1,
      imagensEstabelecimentoSelecionadas: [],
      cpf: "",
      dataNasc: "",
      cep: "",
      avatarSrc: "https://play-lh.googleusercontent.com/jkkC8gyT_HY4dnKsKysYmdH2T4A4R_K0z7xiaH4wjwgUlpJ_Uz-iXRzM3CCh8Sc1DZk=w240-h480-rw",
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
      if (this.currentSection < 2) {
        this.currentSection++;
      }
    },
    previousSection() {
      if (this.currentSection > 1) {
        this.currentSection--;
      }
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
    AtualizarImagem(event) {
      const file = event.target.files[0];

      if (file) {
        const reader = new FileReader();
        reader.
        onload = () => {
              this.avatarSrc = reader.result;
            };
            reader.readAsDataURL(file);
      }
    },
  },
  mounted(){
    const cpfInput = document.getElementById("cpf");
    const cpfMask = IMask(cpfInput, {
      mask: "000.000.000-00",
    });
    dataNasc

    const dataNascInput = document.getElementById("dataNasc"); // Corrected variable name
    const dataNascMask = IMask(dataNascInput, {
      mask: "00/00/0000",
    });

    const celularInput = document.getElementById("celular");
    const celularMask = IMask(celularInput, {
    mask: "(00) 00000-0000",
    });
    
  }
  
};
</script>

<style scoped>
#form-wrap {
  max-width: 700px;
  min-height: 1200px;
  background-image: url("../../../public/img/FormUsuario.jpg");
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  width: 100%;
  height: 100vh;
  background-size: 30%;
}



.personal-image {
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;

  }
  .personal-image input[type="file"] {
    display: none;
  }
  
  .personal-figure {
    position: relative;
    width: 120px;
    height: 120px;
  }
  
  .personal-avatar {
    cursor: pointer;
    width: inherit;
    height: inherit;
    box-sizing: border-box;
    border-radius: 100%;
    border: 2px solid transparent;
    box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.2);
    transition: all ease-in-out .3s;
  }
  .personal-avatar:hover {
    box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.5);
  }
  
  .personal-figcaption {
    cursor: pointer;
    position: absolute;
    top: 0px;
    width: inherit;
    height: inherit;
    border-radius: 100%;
    opacity: 0;
    background-color: rgba(0, 0, 0, 0);
    transition: all ease-in-out .3s;
  }
  .personal-figcaption:hover {
    opacity: 1;
    background-color: rgba(0, 0, 0, .5);
  }
  .personal-figcaption > img {
    margin-top: 32.5px;
    width: 50px;
    height: 50px;
  }

  /* Responsividade */


@media (max-width: 1160px) {
  #form-wrap {
    max-width: 80%;
    background-size: 55%;
  }
}

@media (max-width: 950px) {
  #form-wrap {
    max-width: 90%; 
   
  }
}

@media (max-width: 768px) {
  #form-wrap {
    max-width: 100%; 
    background-size: 70%;
  } 
  .personal-figure {
    position: relative;
    width: 100px;
    height: 100px;
  }
}



</style>