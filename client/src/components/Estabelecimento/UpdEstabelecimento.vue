<template>
    <div id="form-wrap" class="form">
      <div class="posicaoform-wrap">
  
        <!------------------------------------->
                     <!--1-Endereço-->
  <!-- Foto Estabelecimento -->
  <h2>Foto do estabelecimento</h2><br>
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
    <br>

        <div>

      <h2>Localização do seu Estabelecimento</h2>
      <br><br>
      <div class="column">
      <div class="group">
    <label for="cep" class="label">CEP:</label><br />
      <input v-model="cep" type="text" id="cep" class="input" name="cep" @blur="pesquisarCep" maxlength="8" required/>
  </div>
  <div class="group">
    <label for="rua" class="label">Rua:</label><br />
    <input v-model="endereco.rua" type="text" id="rua" class="input" name="rua"/>
  </div>
  <div class="group">
    <label for="numero" class="label">Número:</label><br />
    <input v-model="numero" ref="numeroInput" type="text" id="numero" class="input" name="numero" required/>
  </div>
</div>
<div class="column">
  <div class="group">
    <label for="bairro" class="label">Bairro:</label><br />
    <input v-model="endereco.bairro" type="text" id="bairro" class="input" name="bairro"/>
</div>
  <div class="group">
    <label for="cidade" class="label">Cidade:</label><br />
    <input v-model="endereco.cidade" type="text" id="cidade" class="input" name="cidade"/>
  </div>
  <div class="group">
    <label for="uf" class="label">Estado:</label><br />
    <input v-model="endereco.uf" type="text" id="uf" class="input" name="uf"/>
  </div>
</div>

    <!--3-Dados do Estabelecimento-->
<h2>Informações do estabelecimento:</h2><br><br>
<div class="column">
          <div class="group">
        <label for="nome" class="label">Nome do Estabelecimento:</label><br />
        <input type="text" v-model="nomeEstabelecimento" id="nome" class="input" name="nome" />
      </div>
  
      <div class="group">
        <label for="cnpj" class="label">CNPJ:</label><br />
        <input v-model="cnpj" type="text" id="cnpj" class="input" name="cnpj" required ref="cnpjInput"/>
      </div>
  
      <div class="group">
        <label for="descricao" class="label">Descrição do Estabelecimento:</label><br />
        <textarea v-model="descricaoEstabelecimento" id="descricao" class="input" name="descricao" rows="4" maxlength="200" required></textarea>
      </div> <br>
    </div> 

    <!--indicações do Chef-->
    <h2>Indicação do Chef</h2><br><br>
    <div class="recomendacoes-container">
  <div v-for="(recomendacoes, index) in recomendacao" :key="index" class="recomendacao">
    <div class="recomendacao-item">
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
    </div>
  </div>  
      <div class="buttons">
        <button class="custom-button" v-if="recomendacao.length < 3" @click="addrecomendacoes">Adicionar Recomendação</button>
        <button class="custom-button" v-if="recomendacao.length > 1" @click="removerecomendacoes">Cancelar Recomendação</button>
      </div>
    </div>
  </div>


    <!--2-Contato-->
  


      <h2>Como podemos contatá-lo?</h2>
      <br><br>
  
      <!-- Chamada para o Component --> 
      <DashContato :ContatosSelecionadas="ContatosSelecionadas" @dados-salvos="receberContato"/> 
      <br>
      <!-- Chamada para o Component --> 
      <DashRdSociais :RdSocialSelecionadas="RdSocialSelecionadas" :redeSocialSelecionada="redeSocialSelecionada" @dados-salvos="receberRdSociais" />
  

  

  


      <!-- Chamada para o Component --> 
      <Categorias :value="categoriasSelecionadas" @input="receberCategoriasSelecionadas" />

      <!--4-Dados do Estabelecimento-->

    <h2>Meu Estebelecimento Oferece:</h2>
    <br>
    <!-- Chamada para o Component --> 
    <Opcionais :value="opcoesSelecionadas" @input="receberOpcoesSelecionadas"/>
    <br><br>
    <!-- Chamada para o Component --> 
    <EstilosMusicas :value="estilosSelecionadas" @input="receberEstiloMusicais"/>
   
    <!-- Chamada para o Component --> 
    <DashHorAtendimento :value="HorariosSelecionados" @input="receberHorario"/>
  
    
    <br>
    <div class="group">
            <button type="button" class="button" id="alterarButton">Alterar</button>
            <button type="button" class="button" id="salvarButton" disabled>Salvar</button>
            <button type="button" class="button" id="excluirButton">Excluir</button>
            <button type="button" class="button" id="cancelarButton" disabled>Cancelar</button>
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
  import Opcionais from "./ComponentsChild/Opcionais.vue"
  import DashContato from "./ComponentsChild/DashContato.vue";
  import DashRdSociais from "./ComponentsChild/DashRdSociais.vue";
  import Categorias from "./ComponentsChild/Categorias.vue";
  import EstilosMusicas from "./ComponentsChild/EstilosMusicas.vue";
  import api from "./../../services/backend-service.js";
  
  export default {
  components: {
    DashHorAtendimento,
    DashContato,
    Opcionais,
    DashRdSociais,
    Categorias,
    EstilosMusicas,
  },
  name: "UpdUsuario",
  data() {
    return {
      currentSection: 1,
      nomeEstabelecimento: "",
      descricaoEstabelecimento: "",
      cnpj: "",
      cep: "",
      endereco: {
        rua: "",
        bairro: "",
        cidade: "",
        uf: "",
        },
        numero: "",
        recomendacao: [
        { name: '', description:  '', photo: null },],
        estabelecimentoPhoto: null,
        categoriasSelecionadas: [],
        opcoesSelecionadas: [],
        RdSocialSelecionadas: [],
        ContatosSelecionadas: [],
        HorariosSelecionados: [],
        estilosSelecionadas: [],
      };
  },
  methods: {
    // Recebe os dados do componente "Categorias"
    receberCategoriasSelecionadas(categorias) {
      this.categoriasSelecionadas = categorias;
    },
    // Recebe os dados do componente "Opcionais"
    receberOpcoesSelecionadas(opcionais) {
      this.opcoesSelecionadas = opcionais;
    },
    // Recebe os dados do componente "Estilos Musicais"
    receberEstiloMusicais(estiloMusicais) {
      this.estilosSelecionadas = estiloMusicais;
    },
    // Recebe os dados do componente "DashRdSocias"
    receberRdSociais(dados) {
        this.RdSocialSelecionadas = dados;
      },
    // Recebe os dados do componente "DashContatos"
    receberContato(contato) {
        this.ContatosSelecionadas = contato;
      },
    receberHorario(horario) {
      this.HorariosSelecionados = horario;
    },
  
    async salvarDados() {
      const formData = {
        nomeEstabelecimento: this.nomeEstabelecimento,
        descricaoEstabelecimento: this.descricaoEstabelecimento,
        cnpj: this.cnpj,
        cep: this.cep,
        endereco: this.endereco,
        numero: this.numero,
        recomendacao: this.recomendacao,
        estabelecimentoPhoto: this.estabelecimentoPhoto,
        categoriasSelecionadas: this.categoriasSelecionadas,
        opcoesSelecionadas: this.opcoesSelecionadas,
        estilosSelecionadas: this.estilosSelecionadas,
        RdSocialSelecionadas: this.RdSocialSelecionadas,
        ContatosSelecionadas: this.ContatosSelecionadas,
        HorariosSelecionados: this.HorariosSelecionados,
      };
      const formDataFake = {
        nomeEstabelecimento: 'nome estabelecimento',
        descricaoEstabelecimento: 'descricaoEstabelecimento',
        categoriasSelecionadas: [
          {
            id: 1,
            nome: 'Pizzaria',
          },
          {
            id: 2,
            nome: 'Hamburgueria',
          },
          {
            id: 3,
            nome: 'Lanchonete',
          },
        ],
        cnpj: 'cnpj',
        cep: '',
        endereco: this.endereco,
        numero: '1234',
        recomendacao: this.recomendacao,
        estabelecimentoPhoto: this.estabelecimentoPhoto,
        opcoesSelecionadas: [
          {
            id: 2,
            nome: 'Wi-Fi',
          },
          {
            id: 3,
            nome: 'Estacionamento',
          },
        ],
        estilosSelecionadas: this.estilosSelecionadas,
        RdSocialSelecionadas: [
          {
            redeSocial: 'Facebook',
            perfil: 'link facebook',
          },
          {
            redeSocial: 'Instagram',
            perfil: 'link instagram',
          },
        ],
        ContatosSelecionadas: [
          {
            tipoContato: 'Celular',
            numero: '(15) 98163-5309',
            isWhatsapp: true,
            id: 2,
          },
          {
            tipoContato: 'Telefone',
            numero: '(15) 3242-2433',
            isWhatsapp: false,
            id: 1,
          },
          {
            tipoContato: 'Telefone',
            numero: '(15) 9811-1412',
            isWhatsapp: true,
            id: 1,
          },
        ],
        HorariosSelecionados: this.HorariosSelecionados,
      };
  
  
      console.log("Dados do formulário e componentes filhos:", formDataFake);
      
      const salvarEstabelecimento = await api.post('estabelecimento', formDataFake);
  
      if (salvarEstabelecimento) {
        console.log("salvarEstabelecimento:: ", salvarEstabelecimento);
      }
      
      
      
    },
    nextSection() {
      console.log('nomeEstabelecimento:', this.nomeEstabelecimento);
      console.log('descricaoEstabelecimento:', this.descricaoEstabelecimento);
      console.log('cnpj:', this.cnpj);
      console.log('cep:', this.cep);
      console.log('endereco:', this.endereco);
      console.log('numero:', this.numero);
      console.log('recomendacao:', this.recomendacao);
      console.log('estabelecimentoPhoto:', this.estabelecimentoPhoto);
      console.log('categoriasSelecionadas:', this.categoriasSelecionadas);
      console.log('opcoesSelecionadas:', this.opcoesSelecionadas);
      console.log('estilosSelecionadas:', this.estilosSelecionadas);
      console.log('RdSocialSelecionadas:', this.RdSocialSelecionadas);
      console.log('ContatosSelecionadas:', this.ContatosSelecionadas);
      console.log('HorariosSelecionados:', this.HorariosSelecionados);
  
  
      if (this.currentSection < 6) {
        this.currentSection++;
      }
      this.scrollToTop()
    },
  
    previousSection() {
      if (this.currentSection > 1) {
        this.currentSection--;
      }
      this.scrollToTop()
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
      this.endereco.rua = conteudo.logradouro; // Define a rua
      this.endereco.bairro = conteudo.bairro;   // Define o bairro
      this.endereco.cidade = conteudo.localidade; // Define a cidade
      this.endereco.uf = conteudo.uf;  // Define o estado
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
    scrollToTop() {
      window.scrollTo({
        top: 0,
        behavior: "smooth", // Isso cria uma rolagem suave
      })
    }
  },
    mounted(){
      const cnpjInput = document.getElementById("cnpj");
      const cnpjMask = IMask(cnpjInput, {
        mask: "00.000.000/0000-00",
    });
  },
  computed: {
    progressBarWidth() {
      return `${Math.round((this.currentSection - 1) / 5 * 100)}%`;
    },
  },
  };
  </script>
  
  
  <style scoped>
  #form-wrap {
   margin: auto;
   max-width: 2000px;
   min-height: 3000px;
   position: relative;
   background-color: #c9beebe1;
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
    background: rgba(211, 201, 201, 0.774);
  }
  #form-wrap .group .button[disabled] {
  background-color: #7a7a7a6c;
  pointer-events: none;
}

#form-wrap .group .input[disabled] {
  background-color: #7a7a7a6c;

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
  }
  
  #form-wrap .group .button:hover {
    background:#ff9800;
  }

.button {
    margin-right: 10px;
  }
 
  h2 {
  color: #fff;
  text-align: center;
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

  .recomendacoes-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(400px, 1fr)); /* Isso cria colunas com um tamanho mínimo de 300px e as ajusta automaticamente para caber no contêiner */
  gap: 20px; /* Espaçamento entre as indicações */
  justify-content: space-between;
}

.recomendacao {
  flex: 0 0 calc(33.33% - 20px); /* Para exibir 3 indicações por linha */
  margin-right: 20px;
}

.recomendacao-item {
  margin-bottom: 20px;
}
  
  
  /* Responsividade */
  
  @media (max-width: 1160px) {
  #form-wrap {
    max-width: 950px;
    background-size: 100% 100%;
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
  
  