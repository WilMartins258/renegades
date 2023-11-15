<template>
  <div id="form-wrap" class="form" autocomplete="off" >
    <ComponentMessage v-if="mostrarMensagem" :title="tituloMsg" :message="mensagemPUser" @close="fecharMensagem" />
        <div class="progress">
          <div class="progress-bar" :style="{ width: progressBarWidth }">
            <span class="progressTextSpan">{{ progressBarWidth }}</span>
          </div>
      </div>
    <div class="posicaoform-wrap">
     
      <InfoPopupEstab
  v-if="showDescriptionPopup"
  :show="showDescriptionPopup"
  :title="currentSectionInfo.title"
  :description="currentSectionInfo.descricaoEstUser"
  @close="closeDescriptionPopup"
></InfoPopupEstab>
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
    <Categorias :value="categoriasSelecionadas" @inputArray="receberCategoriasSelecionadas" @restauranteSelecionado="receberRestauranteSelecionado" />
    <br>
    <h2 v-if="isRestaurante">Tipo de Comida do Restaurante:</h2>
    <br>
    <TiposComida v-if="isRestaurante" :value="tiposDeComidaSelecionados" @input=" receberTiposDeComidaSelecionados"/>
  </section><!-- Fecha seção 3-->

  <section v-show="currentSection === 4">
  <h2>Meu Estebelecimento Oferece:</h2>
  <br>
  <!-- Chamada para o Component --> 
  <Opcionais v-model="opcoesSelecionadas" @input="receberOpcoesSelecionadas" @MusicaSelecionada="receberMusicaSelecionada" />
  <br>
  <h2 v-if="isMusica">Selecione os Estilos Musicais do Estabelecimento:</h2>
  <br>
  <!-- Chamada para o Component --> 
  <EstilosMusicas v-if="isMusica" :value="estilosSelecionadas" @input="receberEstiloMusicais"/>
  </section><!-- Fecha seção 4-->

  

  <section v-show="currentSection === 5">
    <h2>Recomendações:</h2><br><br>
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

      <div class="image-container">
          <br>
          <label
            :for="'fotoIndic' + (index + 1)"
            class="label image-label"
            style="cursor: pointer;"
          >
            <input
              :id="'fotoIndic' + (index + 1)"
              type="file"
              accept="image/*"
              @change="AddFoto($event, index)"
              style="display: none;"
            />
            <img
              v-if="recomendacoes.photo && recomendacoes.photo.imageURL"
              :src="recomendacoes.photo.imageURL"
              alt="Foto da Indicação"
              class="miniatura-imagem"
            />
            <img
              v-else
              src="https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem10.jpg"
              alt="Foto da Indicação"
              class="miniatura-imagem"
            />
            <div class="image-overlay">
              <img src="https://raw.githubusercontent.com/ThiagoLuizNunes/angular-boilerplate/master/src/assets/imgs/camera-white.png" alt="Adicionar Foto" />
             
            </div>
          </label>
        </div>

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
    <div class="personal-image center-image">
    <div class="personal-image">
        <label class="label" for="estabelecimentoPhoto">
          <input type="file" id="estabelecimentoPhoto" accept="image/*" @change="handleEstabelecimentoPhotoChange" style="display: none" />
          <figure class="personal-figure">
            <img :src="fotoEstabelecimento" class="personal-avatar round-avatar" alt="Foto do Estabelecimento" ref="avatarImage" />
            <figcaption class="personal-figcaption">
              <img src="https://raw.githubusercontent.com/ThiagoLuizNunes/angular-boilerplate/master/src/assets/imgs/camera-white.png" alt="Adicionar Foto" />
            </figcaption>
          </figure>
        </label>
      </div>
    </div>
  </div>
  <br>
  <!-- Chamada para o Component --> 

  <DashHorAtendimento :HorariosSelecionados="HorariosSelecionados" :horarioSelecionado="horarioSelecionado" @dados-salvos="receberHorario" />

  <br>
  <fieldset>
    <legend>Finalizar Cadastro:</legend>
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
    </fieldset>
  </section><!-- Fecha seção 6-->
  <br>
  <div class="buttons">
  <img class="custom-Imag" @click="voltarSection" v-if="currentSection !== 1" 
                                        src="../../../public/img/ArrowVoltar.png" alt="Voltar"/>
  <div class="space-between-arrows"></div>
  <img class="custom-Imag" @click="avancarSection" v-if="currentSection !== 6" 
                                        src="../../../public/img/ArrowAvancar.png" alt="Avançar"/>
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
import InfoPopupEstab from "./ComponentsChild/InfoPopupEstab.vue";
import ComponentMessage from './../Message.vue';
const variaveisGlobais = require('./../../../variaveis.js');

export default {
components: {
  DashHorAtendimento,
  DashContato,
  Opcionais,
  DashRdSociais,
  Categorias,
  EstilosMusicas,
  TiposComida,
  InfoPopupEstab,
  ComponentMessage
},
name: "AddEstabelecimento",
data() {
  return {
    currentSection: 1,
    nomeEstabelecimento: "",
    descricaoEstabelecimento: "",
    cnpj: "",
    cep: "",
    latitude: "",
    longitude: "",
    endereco: {
      rua: "",
      bairro: "",
      cidade: "",
      uf: "",
      },
      numero: "",
      recomendacao: [
      { name: '', description:  '', photo: {imageURL: 'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem10.jpg' }, photoBuffer: null, type: null },],
      estabelecimentoPhoto: null,
      estabelecimentoPhotoType: "",
      fotoEstabelecimento: "https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem10.jpg",
      categoriasSelecionadas: [],
      opcoesSelecionadas: [],
      RdSocialSelecionadas: [],
      ContatosSelecionadas: [],
      HorariosSelecionados: [],
      estilosSelecionadas: [],
      tiposDeComidaSelecionados: [],
      showDescriptionPopup: false,
      currentSectionInfo: null, // Informações da seção atual
      isRestaurante: false,
      isMusica: false,
      sectionInfo: [
        { 
          title: "Seção 1: Endereço", 
          descricaoEstUser: "Vamos começar pelo endereço do seu estabelecimento. Por favor, preencha o CEP para localizarmos seu endereço, clique em 'Próximo' para continuar." 
        },
        { 
          title: "Seção 2: Dados de Contato", 
          descricaoEstUser: "Agora, informe os dados de contato, incluindo telefone, celular e redes sociais, se desejar. Marque a caixa 'WhatsApp' se o número estiver associado a ele. Clique em 'Próximo'." 
        },
        { 
          title: "Seção 3: Dados do Estabelecimento", 
          descricaoEstUser: "Nesta seção, insira o nome, CNPJ, Descrição e categoria do seu estabelecimento. Essas informações são importantes para os usuários encontrarem você facilmente. Clique em 'Próximo'." 
        },
        { 
          title: "Seção 4: Ofertas para Clientes", 
          descricaoEstUser: "O que o seu estabelecimento oferece aos clientes? Selecione suas opções. Clique em 'Próximo'." 
        },
        { 
          title: "Seção 5: Indicação do Chef", 
          descricaoEstUser: "Carregue uma foto do seu estabelecimento e informe os horários de atendimento. A imagem é uma ótima maneira de atrair clientes. Clique em 'Próximo'."
        },
        { 
          title: "Seção 6: Foto e Horário de Atendimento", 
          descricaoEstUser: " Carregue uma foto do seu estabelecimento e informe os horários de atendimento. Clique em 'Salvar' para finalizar o cadastro do seu estabelecimento. Seus dados serão salvos e visíveis para os usuários em breve." 
        },
      ],
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
        estabelecimentoPhotoType: this.estabelecimentoPhotoType,
        categoriasSelecionadas: this.categoriasSelecionadas,
        tiposDeComidaSelecionados: this.tiposDeComidaSelecionados,
        opcoesSelecionadas: this.opcoesSelecionadas,
        estilosSelecionadas: this.estilosSelecionadas,
        rdSocialSelecionadas: this.RdSocialSelecionadas,
        contatosSelecionados: this.ContatosSelecionadas,
        horariosSelecionados: this.HorariosSelecionados,
        latitude: this.latitude,
        longitude: this.longitude
      };

      console.log('formData:: ', formData);
      
      const salvarEstabelecimento = await api.post('estabelecimento', formData);

      if (salvarEstabelecimento) {
        sessionStorage.setItem('idEstabelecimento', salvarEstabelecimento.data.idEstabelecimento);
        sessionStorage.setItem('tipoUsuario', salvarEstabelecimento.data.tipoUsuario);
        
        this.mostrarmensagemPUser();
       //  console.log("salvarEstabelecimento:: ", salvarEstabelecimento);
       //  console.log("idEstabelecimento:: ", sessionStorage.getItem('idEstabelecimento'));


      }
    } catch (error) {
      this.mostrarmensagemError(error.response.data.msg);
    }
  },
    async avancarSection() {
      if (this.currentSection == 1) {
        if (this.cep) {
          try {
            const googleGeocodeApi = `https://maps.googleapis.com/maps/api/geocode/json?address=${this.numero ? this.numero : ''},${this.cep}&key=${variaveisGlobais.googleApiKey()}`;
            const geolocalizacaoRequest = await axios.get(googleGeocodeApi);

            this.latitude = geolocalizacaoRequest?.data?.results[0]?.geometry?.location?.lat;
            this.longitude = geolocalizacaoRequest?.data?.results[0]?.geometry?.location?.lng;
          } catch (error) {
            console.log('Erro: ', error);
          }
        }
      }
    if (this.currentSection < 6) {
      this.currentSection++;
      this.calculaAltura(); // Calcule a altura
      this.title = "Novo Título da Seção"; // Atualize o título aqui
      this.openDescriptionPopup(); // Abra o popup ao avançar
      
    }
    this.scrollToTop();
  },

  voltarSection() {
    if (this.currentSection > 1) {
      this.currentSection--;
      this.calculaAltura(); // Calcule a altura 
    }
    this.scrollToTop()
  },

  openDescriptionPopup() {
    this.showDescriptionPopup = true;
    this.currentSectionInfo = this.sectionInfo[this.currentSection - 1]; // Informações da seção atual
  },
  closeDescriptionPopup() {
    this.showDescriptionPopup = false;
  },

    loadSectionInfo() {
      this.currentSectionInfo = this.sectionInfo[this.currentSection - 1];
    },

  cancelar() {
    this.$router.push("home");
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
    try {
      const inputImagem = document.getElementById(`fotoIndic${index + 1}`);
      const image = inputImagem?.files[0];
      if (image) {
        const file = event.target.files[0];
        if (file) {
          const fileReader = new FileReader();
          const readAsArrayBuffer = (file) => {
            return new Promise((resolve, reject) => {
              fileReader.onloadend = () => resolve(fileReader.result);
              fileReader.onerror = reject;
              fileReader.readAsArrayBuffer(file);
            });
          };

          const arrayBuffer = await readAsArrayBuffer(file);
          const bufferValido = new Uint8Array(arrayBuffer);

          // Salve a imagem no objeto recomendacoes
          this.recomendacao[index].photoBuffer = bufferValido;
          this.recomendacao[index].type = file.type;

          // Exiba a miniatura da imagem
          const imageURL = URL.createObjectURL(file);
          this.recomendacao[index].photo = { imageURL }; // Adicione a miniatura

          // Limpe o input de arquivo para permitir a seleção de outra imagem
          inputImagem.value = "";
        }
      }
    } catch (error) {
      console.log('ERROR:: ', error);
    }
  },

  async handleEstabelecimentoPhotoChange(event) {
    try {
      const inputImagem = document.getElementById('estabelecimentoPhoto');
      const image = inputImagem?.files[0];

      if (image) {
          const fileReader = new FileReader();

          const readAsArrayBuffer = (file) => {
              return new Promise((resolve, reject) => {
                  fileReader.onloadend = () => resolve(fileReader.result);
                  fileReader.onerror = reject;
                  fileReader.readAsArrayBuffer(file);
              });
          };

          try {
              const arrayBuffer = await readAsArrayBuffer(image);
              const bufferValido = new Uint8Array(arrayBuffer);

              this.estabelecimentoPhoto = bufferValido;
              this.estabelecimentoPhotoType = image.type;
              this.fotoEstabelecimento = await retornaCodigoBase64(image);;
          } catch (error) {
              console.error('Erro ao converter a imagem para ArrayBuffer:', error);
          }
      }
    } catch (error) {
      console.log('ERROR:: ', error);
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
  },
  calculaAltura() {
    const formWrap = document.getElementById('form-wrap');
    if (formWrap) {
      switch (this.currentSection) {
        case 2:
          formWrap.style.minHeight = '1200px'; // Ajuste de altura para a seção 2
          break;
        case 3:
          formWrap.style.minHeight = '1400px'; // Ajuste de altura para a seção 3
          break;
        case 4:
          formWrap.style.minHeight = '1400px'; // Ajuste de altura para a seção 4
          break;
        case 5:
          formWrap.style.minHeight = '1600px'; // Ajuste de altura para a seção 5
          break;

        // Adicione casos para outras seções, se necessário
        default:
          formWrap.style.minHeight = '1090px'; // Altura padrão
      }
    }
  },
  mostrarmensagemPUser() {
		this.tituloMsg = "Seja Bem Vindo!"
		this.mensagemPUser = "Seu cadastro foi concluído com êxito. Agora, estamos redirecionando você para a area do Estabelecimento .";
		this.mostrarMensagem = true;
    },

	mostrarmensagemError(msg) {
		this.tituloMsg = "Erro"
		this.mensagemPUser = msg
		this.mostrarMensagem = true;
    },
	
    fecharMensagem() {
      this.mostrarMensagem = false;
      if(sessionStorage.getItem('idUsuario')=='1'){
        this.$router.push('/AreaDoEstabelecimento');
      }
    },
    receberRestauranteSelecionado(restauranteSelecionado) {
      // Passa True ou false se o "Restaurante" estiver selecionado
     // console.log('Restaurante foi selecionado!');
      this.isRestaurante = restauranteSelecionado;
  },
  receberMusicaSelecionada(isMusica) {
      // Passa True ou false se "música ao vivo" ou "Toca Música" selecionado
      //console.log("Pelo menos um tipo de música foi selecionado: ", isMusica);
      this.isMusica = isMusica;
    },
},
  mounted(){
    this.openDescriptionPopup();//Carregar popup primeira seção
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
  min-height: 1090px;
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

.custom-Imag{
  background-size: cover;
  background-position: center; 
  width: 90px; 
  height:90px; 
  background-color: #e91e2f;
  border-radius: 25px;
  transition: background-color 0.2s;
}

.custom-Imag:hover {
  background-color: #ff9800; 
}
.space-between-arrows {
  width: 10px; 
  display: inline-block;
}

/* Estilo imagem Indicação */
.image-container {
  position: relative;
  display: inline-block;
}

.image-label {
  position: relative;
}

.miniatura-imagem {
  width: 100px;
  height: 100px;
  border-radius: 25px;
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
  color: white;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  opacity: 0;
  transition: opacity 0.3s;
  border-radius: 25px;
}

.image-overlay img {
  width: 50px;
  height: 50px;
}

.image-label:hover .image-overlay {
  opacity: 1;
}

/* Estilo imagem Estabelecimento */
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
    width: 150px;
    height: 150px;
  }
  
  .personal-avatar {
    cursor: pointer;
    width: inherit;
    height: inherit;
    box-sizing: border-box;
    border-radius: 25px;
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
    border-radius: 25px;
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
  
  .center-image {
  display: flex;
  justify-content: center;
  align-items: center;
}

fieldset {
        border: 2px solid #ff9800;
        border-radius: 20px;
        padding: 10px;
        margin-bottom: 20px;
        box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px ;
        flex-direction: column; 
        justify-content: center; 
        align-items: center;
        display: flex; 
    }

    legend {
        font-weight: bold;
        color: #fff;
        font-size: 15px;
    }

    .custom-button{
      color: #fff;
    }

/* Responsive */

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
.custom-Imag{
  width: 60px; 
  height:60px; 
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
.custom-Imag{
  width: 50px; 
  height:50px; 
}
}

</style>

