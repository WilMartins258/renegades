<template>
  <div id="form-wrap" class="form">
        <div class="progress">
          <div class="progress-bar" :style="{ width: progressBarWidth }">
            <span class="progressTextSpan">{{ progressBarWidth }}</span>
          </div>
      </div>
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
    maxlength="8"
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
    v-model="numero"
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

    <!-- Chamada para o Component --> 
    <DashContato :ContatosSelecionadas="ContatosSelecionadas" @dados-salvos="receberContato"/> 
    <br>
    <!-- Chamada para o Component --> 
    <DashRdSociais :RdSocialSelecionadas="RdSocialSelecionadas" :redeSocialSelecionada="redeSocialSelecionada" @dados-salvos="receberRdSociais" />

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
      <label for="descricao" class="label">Descrição do Estabelecimento:</label><br />
      <textarea v-model="descricaoEstabelecimento" id="descricao" class="input" name="descricao" rows="4" maxlength="200" required></textarea>
    </div> <br>
    <h2>A categoria do meu estebelecimento é:</h2>
    <br>
    <!-- Chamada para o Component --> 
    <Categorias :value="categoriasSelecionadas" @input="receberCategoriasSelecionadas" />

    <br>
    <TiposComida :value="tiposDeComidaSelecionados" @input=" receberTiposDeComidaSelecionados"/>
  </section><!-- Fecha seção 3-->

  <section v-show="currentSection === 4">
  <h2>Meu Estebelecimento Oferece:</h2>
  <br>
  <!-- Chamada para o Component --> 
  <Opcionais :value="opcoesSelecionadas" @input="receberOpcoesSelecionadas"/>
  <br><br>
  <!-- Chamada para o Component --> 
  <EstilosMusicas :value="estilosSelecionadas" @input="receberEstiloMusicais"/>
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
      :src="estabelecimentoPhoto64"
      alt="Foto do Estabelecimento"
      class="miniatura-imagem"
    />
  </div>
  <br>
  <!-- Chamada para o Component --> 

  <DashHorAtendimento :HorariosSelecionados="HorariosSelecionados" :horarioSelecionado="horarioSelecionado" @dados-salvos="receberHorario" />

  <br>
  <div class="group">
        <div>
          <input
            type="button"
            class="button"
            value="Salvar"
            @click="salvarDados"
          />
          <input
            type="button"
            class="button"
            value="Cancelar"
            @click="cancelar"
          /> <br><br>
        </div>
      </div>
  </section><!-- Fecha seção 6-->
  <br>
  <div class="buttons">
    <button class="custom-button" @click="previousSection" v-if="currentSection !== 1"><i class="uil uil-arrow-circle-left"></i></button>
    <button class="custom-button" @click="nextSection" v-if="currentSection !== 6"><i class="uil uil-arrow-circle-right"></i></button>
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
import TiposComida from "./ComponentsChild/TiposComida.vue";
import api from "./../../services/backend.service.js";
import { retornaCodigoBase64 } from "./../../services/conversorDeImagem.service.js";

export default {
components: {
  DashHorAtendimento,
  DashContato,
  Opcionais,
  DashRdSociais,
  Categorias,
  EstilosMusicas,
  TiposComida
},
name: "AddEstabelecimento",
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
      estabelecimentoPhoto64: null,
      categoriasSelecionadas: [],
      opcoesSelecionadas: [],
      RdSocialSelecionadas: [],
      ContatosSelecionadas: [],
      HorariosSelecionados: [],
      estilosSelecionadas: [],
      tiposDeComidaSelecionados: [],
    };
},
methods: {
  // Recebe os dados do componente "Categorias"
  receberCategoriasSelecionadas(categorias) {
    this.categoriasSelecionadas = categorias;
  },
  // Recebe os dados do componente "Tipos de Comida"
  receberTiposDeComidaSelecionados(TiposComida){
    this.tiposDeComidaSelecionados = TiposComida;
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
  receberHorario(dados) {
    this.HorariosSelecionados = dados;
  },
  async salvarDados() {
    try {
      const formData = {
        idUsuario: sessionStorage.getItem('idUsuario'),
        nomeEstabelecimento: this.nomeEstabelecimento,
        descricaoEstabelecimento: this.descricaoEstabelecimento,
        cnpj: this.cnpj,
        cep: this.cep,
        endereco: this.endereco,
        numero: this.numero,
        recomendacao: this.recomendacao,
        estabelecimentoPhoto: this.estabelecimentoPhoto,
        categoriasSelecionadas: this.categoriasSelecionadas,
        tiposDeComidaSelecionados: this.tiposDeComidaSelecionados,
        opcoesSelecionadas: this.opcoesSelecionadas,
        estilosSelecionadas: this.estilosSelecionadas,
        rdSocialSelecionadas: this.RdSocialSelecionadas,
        contatosSelecionadas: this.ContatosSelecionadas,
        horariosSelecionados: this.HorariosSelecionados
      };

      console.log('this.estabelecimentoPhoto:: ', this.estabelecimentoPhoto)
      
      const salvarEstabelecimento = await api.post('estabelecimento', formData);

      if (salvarEstabelecimento) {
        sessionStorage.setItem('idEstabelecimento', salvarEstabelecimento.data.idEstabelecimento);
        sessionStorage.setItem('tipoUsuario', salvarEstabelecimento.data.tipoUsuario);


        console.log("salvarEstabelecimento:: ", salvarEstabelecimento);
        console.log("idEstabelecimento:: ", sessionStorage.getItem('idEstabelecimento'));
      }
    } catch (error) {
      console.error('ERROR:: ', error);
    }
  },
  nextSection() {

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
  async AddFoto(event, index) {
    const inputImagem = document.getElementById(`fotoIndic${index+1}`);
    const image = inputImagem?.files[0];

    if (image) {
      const imagemBase64 = await retornaCodigoBase64(image);
      const file = event.target.files[0];
      if (file) {
        // const imageURL = URL.createObjectURL(file);
        this.recomendacao[index].photo = imagemBase64;
      }
    }
  },

  /*Img estabelecimento*/
  async handleEstabelecimentoPhotoChange(event) {
    const inputImagem = document.getElementById('estabelecimentoPhoto');
    const image = inputImagem?.files[0];

    if (image) {
        const fileReader = new FileReader();

        // Use um Promisify para FileReader
        const readAsArrayBuffer = (file) => {
            return new Promise((resolve, reject) => {
                fileReader.onloadend = () => resolve(fileReader.result);
                fileReader.onerror = reject;
                fileReader.readAsArrayBuffer(file);
            });
        };

        try {
            const arrayBuffer = await readAsArrayBuffer(image);
            const bufferInsano = new Uint8Array(arrayBuffer);

            this.estabelecimentoPhoto = bufferInsano;
            this.estabelecimentoPhoto64 = await retornaCodigoBase64(image);;
            // console.log('Imagem convertida para ArrayBuffer e armazenada:', this.estabelecimentoPhoto);
            // console.log('bufferInsano:', bufferInsano);
        } catch (error) {
            console.error('Erro ao converter a imagem para ArrayBuffer:', error);
        }
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
/*Imagem de fundo do forms*/
  color: white;
  background-image: url("../../../public/img/FormEstabelecimento.jpg");
  background-size: 40% 100%;
  background-position: center;
  background-attachment: fixed;
  margin: auto;
  max-width: 525px;
  min-height: 1010px;
  position: relative;
}

.posicaoform-wrap {
    width: 100%;
    height: 100%;
    position: absolute;
    padding: 50px 30px 50px 30px;
    flex-wrap: wrap;
  }

  .progress {
    width: 100%;
    height: 20px; /* Altura da barra de progresso */
    background-color: #f0f0f0; /* Cor de fundo da barra de progresso */
  }

  .progress-bar {
  height: 100%;
  background: linear-gradient(to right, #ff9800, #e91e2f);
  transition: width 0.3s ease;

}

.progressTextSpan {
  text-align: center;
  font-weight: bold;
  color: black;
  display: block;
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




</style>

