<template>
  <div id="form-wrap" class="form">
    <div class="posicaoform-wrap">

      <div class="personal-image">
              <label class="label">
                <input type="file" @change="AtualizarImagem" id="input_imagem"/>
                <figure class="personal-figure">
                  <img :src="avatarSrc" class="personal-avatar" alt="avatar" ref="avatarImage">
                  <figcaption class="personal-figcaption">
                    <img src="https://raw.githubusercontent.com/ThiagoLuizNunes/angular-boilerplate/master/src/assets/imgs/camera-white.png">
                  </figcaption>
                </figure>
              </label>
            </div><br><br>

          <div class="column">
              <div class="group">
                <label for="nome" class="label">Nome Completo:</label><br />
                <input type="text" v-model="nome" id="nome" class="input" name="nome" disabled/>
              </div>

              <div class="group">
                <label for="dataNasc" class="label">Data de Nascimento:</label><br />
                <input v-model="dataNasc" type="text" id="dataNasc" class="input" name="dataNasc" required ref="dataNascInput" disabled/>
              </div>

              <div class="group">
                <label for="celular" class="label">Celular:</label><br />
                <input maxlength="15" type="text" v-model="celular" id="celular" class="input" name="celular" required disabled/>
            </div>
          </div>

           <div class="column">
            <div class="group">
              <label for="email" class="label">E-mail:</label><br />
              <input type="email" v-model="email" id="email" class="input" name="email" disabled/>
            </div>  

            <div class="group">
              <label for="senha" class="label">Senha:</label><br />
                <input type="password" v-model="senha" id="senha" class="input" name="senha" disabled/>
            </div>  

            <div class="group">
              <label for="senha2" class="label">Confirme sua senha:</label><br />
                <input type="password" v-model="senhaConfirm" id="senha2" class="input" name="senha2" disabled/>
                <span style="color: red;">{{ senhaError }}</span>
            </div> 
          </div>

          <div class="column">
            <div class="group">
              <label for="cep" class="label">CEP:</label><br />
              <input maxlength="9" v-model="endereco.cep" type="text" id="cep" class="input" name="cep" @blur="pesquisarCep" required disabled/><br />
            </div>

            <div class="group">
            <label for="rua" class="label">Rua:</label><br />
            <input v-model="endereco.rua" type="text" id="rua" class="input" name="rua" disabled/><br />
          </div>
          
          <div class="group">
            <label for="numero" class="label">Número:</label><br />
            <input v-model="endereco.numero" ref="numeroInput" type="text" id="numero" class="input" name="numero" required disabled/><br />
          </div>
        </div>

        <div class="column">
          <div class="group">
            <label for="bairro" class="label">Bairro:</label><br />
            <input v-model="endereco.bairro" type="text" id="bairro" class="input" name="bairro" disabled/><br />
          </div>

          <div class="group">
            <label for="cidade" class="label">Cidade:</label><br />
            <input v-model="endereco.cidade" type="text" id="cidade" class="input" name="cidade" disabled/><br />
          </div>

          <div class="group">
            <label for="uf" class="label">Estado:</label><br />
            <input v-model="endereco.uf" type="text" id="uf" class="input" name="uf" disabled/><br />
          </div> 
        </div>
          
        <div class="group">
            <button type="button" class="button" id="alterarButton">Alterar</button>
            <button type="button" class="button" id="salvarButton" disabled>Salvar</button>
            <button type="button" class="button" id="inativaButton">Inativar</button>
            <button type="button" class="button" id="cancelarButton" disabled>Cancelar</button>
        </div>
    </div>
  </div>
</template>

<script>
  import IMask from "imask";
  import api from './../../services/backend.service';
  import dataToDiaMesAno from './../../services/dataToDiaMesAno.service.js';
  import axios from "axios";

export default{
  name: "UpdUsuario",
  data(){
   return{
    avatarSrc: "https://play-lh.googleusercontent.com/jkkC8gyT_HY4dnKsKysYmdH2T4A4R_K0z7xiaH4wjwgUlpJ_Uz-iXRzM3CCh8Sc1DZk=w240-h480-rw",
    endereco: {
        rua: "",
        bairro: "",
        cidade: "",
        uf: "",
        cep: "",
        numero: ""
      },
      nome: "",
      dataNasc: "",
      celular: "",
      email: "",
      senha: "",
      senhaConfirm: "",
      fotoUsuario: "",
      fotoUsuarioType: ""
  };
  },
  created() {
	  this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      try {
        if (sessionStorage.getItem('idUsuario')) {
          const requisicaoUsuario = await api.get(`/usuario/${sessionStorage.getItem('idUsuario')}`);          
          const dadosUsuario = requisicaoUsuario.data;

          let dataFormatada = '';
          if (dadosUsuario.dataNascimento) {
            dataFormatada = dataToDiaMesAno(dadosUsuario.dataNascimento);
          }

          // Dados Usuário
          this.nome = dadosUsuario.nome;
          this.dataNasc = dataFormatada;
          this.celular = dadosUsuario.celular;
          this.email = dadosUsuario.email;
          this.senha = dadosUsuario.senha;
          this.senhaConfirm = dadosUsuario.senha;
          this.endereco.bairro = dadosUsuario.bairro;
          this.endereco.cep = dadosUsuario.cep;
          this.endereco.rua = dadosUsuario.logradouro;
          this.endereco.uf = dadosUsuario.estado;
          this.endereco.cidade = dadosUsuario.cidade;
          this.endereco.numero = dadosUsuario.numeroResidencia;

          this.$nextTick(() => {
            this.aplicarMascaraCelular();
            this.aplicarMascaraCEP() 
          });

          if (dadosUsuario.fotoPerfil) {
            try {
              this.avatarSrc = require(`./images/${sessionStorage.getItem('idUsuario')}.${dadosUsuario.fotoPerfil}`);
            } catch (error) {
              console.log('Erro ao exibir imagem do usuário');
            }
          }
        } else {
          alert('usuário não autenticado, autentique para visualizar dados.');
        }
      } catch (error) {
        console.log('ERROR:: ', error);
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
      const cep = this.endereco.cep?.replace(/\D/g, "");
      if (cep !== "") {
        const validacep = /^[0-9]{8}$/;
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
    async AtualizarImagem(event) {
      try {
        const inputImagem = document.getElementById('input_imagem');
        const file = inputImagem?.files[0];

        if (file) {
          const reader = new FileReader();

          const fileReader = new FileReader();
          const readAsArrayBuffer = (file) => {
              return new Promise((resolve, reject) => {
                  fileReader.onloadend = () => resolve(fileReader.result);
                  fileReader.onerror = reject;
                  fileReader.readAsArrayBuffer(file);
              });
          };

          reader.
          onload = () => {
            this.avatarSrc = reader.result;
          };
          reader.readAsDataURL(file);
        
          try {
            const arrayBuffer = await readAsArrayBuffer(file);
            const bufferValido = new Uint8Array(arrayBuffer);
            this.fotoUsuario = bufferValido;
            this.fotoUsuarioType = file.type;
          } catch (error) {
            console.log('Erro ao ler imagem como buffer: ', error);
          }
        }
      } catch (error) {
        console.log('Erro ao atualizar imagem do usuário: ', error);
      }
    }, 
    setupFormListeners() {
      const nomeInput = document.getElementById("nome");
      const dataNascimentoInput = document.getElementById("dataNasc");
      const emailInput = document.getElementById("email");
      const celularInput = document.getElementById("celular");
      const senhaInput = document.getElementById("senha");
      const senha2Input = document.getElementById("senha2");
      const cepInput = document.getElementById("cep");
      const ruaInput = document.getElementById("rua");
      const numeroInput = document.getElementById("numero");
      const bairroInput = document.getElementById("bairro");
      const cidadeInput = document.getElementById("cidade");
      const ufInput = document.getElementById("uf");
      const alterarButton = document.getElementById("alterarButton");
      const salvarButton = document.getElementById("salvarButton");
      const inativaButton = document.getElementById("inativaButton");
      const cancelarButton = document.getElementById("cancelarButton");
   
      alterarButton.addEventListener("click", () => {
        nomeInput.removeAttribute("disabled");
        dataNascimentoInput.removeAttribute("disabled");
        emailInput.removeAttribute("disabled");
        celularInput.removeAttribute("disabled");
        senhaInput.removeAttribute("disabled");
        senha2Input.removeAttribute("disabled");
        cepInput.removeAttribute("disabled");
        ruaInput.removeAttribute("disabled");
        numeroInput.removeAttribute("disabled");
        bairroInput.removeAttribute("disabled");
        cidadeInput.removeAttribute("disabled");
        ufInput.removeAttribute("disabled");
        salvarButton.removeAttribute("disabled");
        cancelarButton.removeAttribute("disabled");
        alterarButton.setAttribute("disabled", true);
        inativaButton.setAttribute("disabled", true);
      });  

      cancelarButton.addEventListener("click", () => {
        nomeInput.setAttribute("disabled", true);
        dataNascimentoInput.setAttribute("disabled", true);
        emailInput.setAttribute("disabled", true);
        celularInput.setAttribute("disabled", true);
        senhaInput.setAttribute("disabled", true);
        senha2Input.setAttribute("disabled", true);
        cepInput.setAttribute("disabled", true);
        ruaInput.setAttribute("disabled", true);
        numeroInput.setAttribute("disabled", true);
        bairroInput.setAttribute("disabled", true);
        cidadeInput.setAttribute("disabled", true);
        ufInput.setAttribute("disabled", true);
        salvarButton.setAttribute("disabled", true);
        cancelarButton.setAttribute("disabled", true);
        alterarButton.removeAttribute("disabled");
        inativaButton.removeAttribute("disabled");
      });

      salvarButton.addEventListener("click", async () => {
        if (!this.validarSenhas()) {
          // Display error message
          alert(this.senhaError);
          return;
        }
        nomeInput.setAttribute("disabled", true);
        dataNascimentoInput.setAttribute("disabled", true);
        emailInput.setAttribute("disabled", true);
        celularInput.setAttribute("disabled", true);
        senhaInput.setAttribute("disabled", true);
        senha2Input.setAttribute("disabled", true);
        cepInput.setAttribute("disabled", true);
        ruaInput.setAttribute("disabled", true);
        numeroInput.setAttribute("disabled", true);
        bairroInput.setAttribute("disabled", true);
        cidadeInput.setAttribute("disabled", true);
        ufInput.setAttribute("disabled", true);
        salvarButton.setAttribute("disabled", true);
        cancelarButton.setAttribute("disabled", true);
        alterarButton.removeAttribute("disabled");
        inativaButton.removeAttribute("disabled");

        try {
          const novosDadosUsuario = {
            idUsuario: sessionStorage.getItem('idUsuario'),
            nome: nomeInput.value,
            dataNascimento: dataNascimentoInput.value,
            email: emailInput.value,
            celular: celularInput.value,
            senha: senhaInput.value,
            cep: cepInput.value,
            estado: ufInput.value,
            cidade: cidadeInput.value,
            bairro: bairroInput.value,
            logradouro: ruaInput.value,
            numero: numeroInput.value,
            fotoBuffer: this.fotoUsuario,
            fotoType: this.fotoUsuarioType
          };
          await api.put('/usuario', novosDadosUsuario);
        } catch (error) {
          console.error('ERROR:: ', error);
        } finally {
          console.log('Atualização de dados concluída com sucesso!');
        }
      });

      inativaButton.addEventListener("click", async () => {
        try {
          if (window.confirm("Confirma a inativação do usuário? Essa conta não poderá mais ser acessada.")) {
              await api.put('/usuario/invalidar', {idUsuario: sessionStorage.getItem('idUsuario')});

              sessionStorage.clear();
              this.$router.push({ name: 'home', query: {  logged: 'false' }});
          }
        } catch (error) {
          this.mostrarmensagemError(error.response.data.msg);
        }
      });
    },
    aplicarMascaraCelular() {
      const celularInput = document.getElementById("celular");
      const celularMask = IMask(celularInput, {
        mask: "(00) 00000-0000",
      });
    },

    aplicarMascaraCEP() {
      const cepInput = document.getElementById("cep");
      const cepMask = IMask(cepInput, {
        mask: "00000-000",
      });
    },
    validarSenhas() {
      if (this.senha !== this.senhaConfirm) {
        this.senhaError = "As senhas não coincidem";
        return false;
      } else {
        this.senhaError = "";
        return true;
      }
    },
  },
  mounted(){
    dataNasc
    const dataNascInput = document.getElementById("dataNasc"); // Corrected variable name
    const dataNascMask = IMask(dataNascInput, {
      mask: "00/00/0000",
    });

    const celularInput = document.getElementById("celular");
    const celularMask = IMask(celularInput, {
    mask: "(00) 00000-0000",
    });

    this.setupFormListeners();
    
  }
}

</script>

<style scoped>

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

  #form-wrap {
   margin: auto;
   max-width: 2000px;
   min-height: 1010px;
   position: relative;
   background-color: rgba(94, 92, 92, 0.541); 
   box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24),
     0 17px 50px 0 rgba(0, 0, 0, 0.19);
 }
 
 .posicaoform-wrap {
   width: 100%;
   height: 100%;
   position: absolute;
   padding: 50px 70px 50px 70px;
   flex-wrap: wrap;
   
 }

 .form {
    min-height: 345px;
    position: relative;
    perspective: 1000px;
    transform-style: preserve-3d;
  }
  
  .form .group {
    margin-bottom: 15px;
  }
  
  .form .column {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 20px;
  }

  .group {
    flex: 1;
    margin-right: 20px; 
  }
  
  .form .group .label,
  .form .group .input {
    width: 100%;
    color: #000;
    display: block;
  }
  
  .group .button,
  .group .input {
    border: none;
    padding: 15px 20px;
    border-radius: 25px;
    background: rgba(221, 214, 214, 0.911);
  }
  #form-wrap .group .button[disabled] {
  background-color: #7a7a7a6c;
  pointer-events: none;
}

#form-wrap .group .input[disabled] {
  background: rgba(211, 201, 201, 0.774);

}
  .group .button,
  .group .label {
    text-transform: uppercase;
  }
  
  .group .button-spacing {
    margin-right: 10px;
  }
  
  .form .group .button {
    padding: 15px 50px;
  }
  
  #form-wrap .group .label {
    color: #fff;
    font-size: 16px;
  }

  
  
  #form-wrap .group .button {
    background:#e91e2f;
    cursor: pointer;
    transition: 0.5s;
    color: #fff;
    display: inline-block;
  }
  
  #form-wrap .group .button:hover {
    background:#ff9800;
  }

.button {
    margin-right: 10px;
  }

  /*Responsive*/
  
  @media (max-width: 1060px) {
  .posicaoform-wrap {
    padding: 50px 40px; 
  }
}

  @media (max-width: 768px) {
    #form-wrap {
    min-height: 1800px; 
  }
  .column {
    flex-direction: column;
  }
  .form .group .input {
    width: 300%;
  }
  .group:nth-child(n+4) .button {
    margin-top: 15px; 
  }

}

  @media (max-width: 414px) {
  #form-wrap {
    min-height: 2000px; 
  }
  .group .button {
    padding: 15px 20px; 
  }

  .form .group .input {
    width: 120%;
  }
}
</style>