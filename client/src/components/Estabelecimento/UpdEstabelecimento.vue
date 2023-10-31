<template>
  <div id="form-wrap" class="form">
    <div class="posicaoform-wrap">

      <!------------------------------------->
                   <!--1-Endereço-->
<!-- Foto Estabelecimento -->
<h2>Foto do estabelecimento</h2><br>
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
      <div>

    <h2>Localização do seu Estabelecimento</h2>
    <br><br>
    <div class="column">
    <div class="group">
  <label for="cep" class="label">CEP:</label><br />
    <input v-model="cep" type="text" id="cep" class="input" name="cep" @blur="pesquisarCep" maxlength="8" required disabled/>
</div>
<div class="group">
  <label for="rua" class="label">Rua:</label><br />
  <input v-model="endereco.rua" type="text" id="rua" class="input" name="rua" disabled/>
</div>
<div class="group">
  <label for="numero" class="label">Número:</label><br />
  <input v-model="numero" ref="numeroInput" type="text" id="numero" class="input" name="numero" required disabled/>
</div>
</div>
<div class="column">
<div class="group">
  <label for="bairro" class="label">Bairro:</label><br />
  <input v-model="endereco.bairro" type="text" id="bairro" class="input" name="bairro" disabled/>
</div>
<div class="group">
  <label for="cidade" class="label">Cidade:</label><br/>
  <input v-model="endereco.cidade" type="text" id="cidade" class="input" name="cidade" disabled/>
</div>
<div class="group">
  <label for="uf" class="label">Estado:</label><br />
  <input v-model="endereco.uf" type="text" id="uf" class="input" name="uf" disabled/>
</div>
</div>

  <!--2-Dados do Estabelecimento-->
<h2>Informações do estabelecimento:</h2><br>
<div class="column">
        <div class="group">
      <label for="nomeEstabelecimento" class="label">Nome do Estabelecimento:</label><br/>
      <input type="text" v-model="nomeEstabelecimento" id="nomeEstabelecimento" class="input" name="nome" disabled/>
    </div>

    <div class="group">
      <label for="cnpj" class="label">CNPJ:</label><br />
      <input v-model="cnpj" type="text" id="cnpj" class="input" name="cnpj" required ref="cnpjInput" disabled/>
    </div>

    <div class="group">
      <label for="descricao" class="label">Descrição do Estabelecimento:</label><br />
      <textarea v-model="descricaoEstabelecimento" id="descricao" class="input" name="descricao" rows="4" maxlength="200" required disabled></textarea>
    </div> <br>
  </div> 

  <!--3 indicações do Chef-->
<!------------------------------------------------------------------------------------------------------------->
  
<h2>Indicação do Chef</h2><br><br>
    <div class="recomendacoes-container">
    <div v-for="(recomendacoes, index) in recomendacao" :key="index" class="recomendacao">
      <div class="recomendacao-item">
      <div id="indication-container">
        <div class="group">
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
      </div>
    </div>
  </div>
    <div class="buttons">
      <button class="custom-button" v-if="recomendacao.length < 3" @click="addrecomendacoes">Adicionar Recomendação</button>
      <button class="custom-button" v-if="recomendacao.length > 1" @click="removerecomendacoes">Cancelar Recomendação</button>
    </div>
  </div>


  <!--4-Contato-->
  <h2>Como podemos contatá-lo?</h2><br>
  <div class="column">
    <!-- Dash Contatos aqui--> 
    <div>
      <div class="container">
  <!--<h1>Contatos</h1>-->  
          <div>
            <form @submit.prevent="salvarContato">
            <label for="tipoContato">Tipo de Contato:
                  <InfoPopup class="custom-popup">	
                    <span class="popup">Olá! Para adicionar seu contato, siga estas etapas simples:</span>
                      <br><span class="popup">1 - Escolha se deseja adicionar um número de telefone ou celular.</span>
                      <br><span class="popup">2 - Digite o número no campo apropriado.</span>
                        <br><span class="popup">3 - Marque a caixa de seleção 'WhatsApp' se desejar que este número seja associado ao WhatsApp.</span>
                        <br><span class="popup">4 - Clique no botão 'Salvar' para concluir a ação.</span>
                  </InfoPopup>
            </label>
              <select v-model="tipoContato" id="tipoContato" @change="aplicarMascara">
                <option value="Telefone">Telefone</option>
                <option value="Celular">Celular</option>
              </select>
              <label for="numeroContato">Número:</label>
              <input v-model="numeroContato" type="text" id="numeroContato" name="numeroContato" placeholder="Digite aqui"
                :class="{ 'error': campoVazio }" @input="aplicarMascara" disabled/>
              <label for="isWhatsapp"><img src="../../../public/img/whatsappLogo.png" alt="É WhatsApp?" class="whatsapp-image" /> É WhatsApp:</label>
              <input v-model="isWhatsapp" type="checkbox" id="isWhatsapp" name="isWhatsapp" />
              <p v-if="campoVazio" class="error-message">Informe um número válido.</p>
              <div>
              <br>
              <button type="submit" :disabled="isEditingContato" :class="{ 'disabled-button': isEditingContato }">
                {{ isEditingContato ? 'Salvando...' : 'Salvar' }}
              </button>
            </div>
            </form>
          </div>
          <div class="table-container">
          <table>
            <thead>
              <tr>
                <th>Tipo de Contato</th>
                <th>Número</th>
                <th>WhatsApp</th>
                <th>Editar/Excluir</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(contato, index) in listaContatos" :key="index">
                <td>{{ contato.tipoContato }}</td>
                <td>{{ contato.numeroContato }}</td>
                <td>{{ contato.isWhatsapp ? 'Sim' : 'Não' }}</td>
                <td>
                  <template v-if="editingIndex !== index">
                    <button class="respButton" @click="editarContato(index)">
                      <i class="uil uil-edit"></i>
                    </button>
                    <button class="respButton" @click="excluirContato(index)">
                      <i class="uil uil-file-times-alt"></i>
                    </button>
                  </template>
                  <template v-else>
                    <button class="respButton" @click="salvarEdicaoContato(index)">
                      <i class="uil uil-check"></i>
                    </button>
                    <button class="respButton" @click="cancelarEdicaoContato">
                      <i class="uil uil-times"></i>
                    </button>
                  </template>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>
    </div>
    <!-- Dash Contatos  Termina aqui--> 
    <br>
    <!-- Dash RdSocial inicia aqui--> 
      <div class="container">
      <div>
        <form @submit.prevent="salvarRedeSocial">
          <label for="redeSocial">Rede Social:
              <InfoPopup class="custom-popup">  	
                <span class="popup">Olá! Para adicionar sua rede social, siga estas etapas simples:</span>
                  <br><span class="popup">1 - Escolha a rede social que deseja compartilhar.</span>
                  <br><span class="popup">2 - Digite seu perfil ou nome de usuário da rede social escolhida no campo apropriado.</span>
                    <br><span class="popup">3 - Clique no botão 'Salvar' para concluir a ação.</span>
              </InfoPopup>
          </label>
          <select v-model="redeSocial" id="redeSocial" >
            <option value="1">Facebook</option>
            <option value="2">Instagram</option>
            <option value="3">Twitter</option>
            <option value="4">Site do Estabelecimento</option>
            <option value="5">Cardápio Online</option>
          </select>
          <label for="perfil">Perfil:</label>
          <input
            v-model="perfil"
            type="text"
            id="perfil"
            name="perfil"
            placeholder="Digite aqui"
            :class="{ 'error': campoVazioRdSocial }"
            disabled
          />
          <p v-if="campoVazioRdSocial" class="error-message">Informe um valor válido.</p>
          <p v-if="redeSocialJaIncluida" class="error-message">Rede social já incluída.</p>
          <button type="submit" :disabled="isEditingRdSocial" :class="{ 'disabled-button': isEditingRdSocial }">
            {{ isEditingRdSocial ? 'Salvando...' : 'Salvar' }}
          </button>
        </form>
      </div>
      <div class="table-container">
      <table>
        <thead>
          <tr>
            <th>Rede Social</th>
            <th>Perfil</th>
            <th>Editar/Excluir</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(rede, index) in listaRedesSociais" :key="index">
            <td>{{ rede.redeSocial }}</td>
            <td>{{ rede.perfil }}</td>
            <td>
              <template v-if="editingIndexRdSocial !== index">
                <button class="respButton" @click="editarRedeSocial(index)">
                  <i class="uil uil-edit"></i>
                </button>
                <button class="respButton" @click="excluirRedeSocial(index)">
                  <i class="uil uil-file-times-alt"></i>
                </button>
              </template>
              <template v-else>
                <button class="respButton" @click="salvarEdicaoRdSocial(index)">
                  <i class="uil uil-check"></i>
                </button>
                <button class="respButton" @click="cancelarEdicaoRdSocial">
                  <i class="uil uil-times"></i>
                </button>
              </template>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    </div>
   <!-- Dash RdSocial Termina aqui--> 

  </div>

    <div class="column">
        <div>
          <h2>Categoria do Estebelecimento:</h2><br>
          <!-- Dash Categoria inicia aqui--> 

            <div class="quadro-categorias">
              
                  <button
                    v-for="opcao in categoria"
                    :key="opcao.id"
                    :class="{ botaoCategoria: true, selecionado: opcaopcaoCategSelecionadaoCategSelecionada(opcao) }"
                    @click="selecionarCategoria(opcao)"
                  >
                    {{ opcao.nome }}
                  </button>
                </div>
            
                <div id="categoriaSelecionadas">
                  <br><p>Categorias selecionadas: {{ categoriaSelecionadasString }}</p>
                </div>
                
                <!-- Dash Categoria Termina aqui--> 
          </div>
          <div>
                <h2>Meu Estebelecimento Oferece:</h2><br>
                <!-- Dash Opcionais inicia aqui--> 
                <div class="quadro-Opcionais">
            <button
              v-for="opcao in opcoes"
              :key="opcao.id"
              :class="{ botaoOpcionais: true, selecionado: opcaoOpicionaisSelecionada(opcao) }"
              @click="selecionarOpcionais(opcao)"
            >
              {{ opcao.nome }}
            </button>
          </div>

          <div id="opcoesSelecionadas">
            <br /><p>Opções selecionadas: {{ opcoesSelecionadasString }}</p>
          </div>
          <!-- Dash Opcionais Termina aqui--> 
          </div>
         <div>
          <h2>Minha Playlist:</h2><br>
           <!-- Dash Estilos Musicais inicia aqui--> 
           <div class="quadro-estilosMusicais">
              <button v-for="opcao in estilos" :key="opcao.id" :class="{ botaoEstiloMusical: true, selecionado: opcaoMusicalSelecionada(opcao) }"
                @click="selecionarEstilo(opcao)">
                {{ opcao.nome }}
              </button>
            </div>

            <div id="estilosSelecionadas">
              <br>
              <p>Estilos selecionados: {{ estilosSelecionadasString }}</p>
            </div>
            <!-- Dash Estilos Musicais  Termina aqui--> 
      </div>
     </div>

     <div class="column">
          <div>
              <h2>Tipo de Comida:</h2><br>
              <!-- DashT ipos Comida inicia aqui--> 
            <div class="tipos-de-comida">
              <button
                v-for="tipo in tiposDeComida"
                :key="tipo.id"
                :class="{ botaoTiposComida: true, selecionado: opcaoComidaSelecionada(tipo) }"
                @click="selecionarComida(tipo)" 
                class="button" id="teste"
              >
                {{ tipo.nome }}
              </button>
           </div>

          <div id="tiposDeComidaSelecionados">
            <br />
            <p>Tipos de Comida Selecionados: {{ tiposDeComidaSelecionadosString }}</p>
          </div>
         <!-- Dash Tipos Comida Termina aqui--> 
      </div>
      <div>
        <h2>Horário de atencimento:</h2><br>
        <!-- Dash Hprario Atendimento inicia aqui --> 
        <div class="container">
          <div>
            <form @submit.prevent="salvarHorario">
              <label for="diaSemana">Dias de Funcionamento:</label>
              <select v-model="diaSelecionado" id="diaSemana">
                <option value="1">Domingo</option>
                <option value="2">Segunda-feira</option>
                <option value="3">Terça-feira</option>
                <option value="4">Quarta-feira</option>
                <option value="5">Quinta-feira</option>
                <option value="6">Sexta-feira</option>
                <option value="7">Sábado</option>
                <option value="8">Segunda a Sexta</option>
                <option value="9">terça a Sexta</option>
                <option value="10">Sábado a Domingo </option>
              </select>
              <label for="horaInicio">Início:</label>
              <input v-model="horaInicio" type="time" id="horaInicio" name="horaInicio" disabled/>
              <label for="horaTermino">Término:</label>
              <input v-model="horaTermino" type="time" id="horaTermino" name="horaTermino" disabled/>
              <button type="submit" :disabled="isEditingHorario" :class="{ 'disabled-button': isEditingHorario }" class="button" id="teste" d>
                {{ isEditingHorario ? 'Salvando...' : 'Salvar' }}
              </button>
            </form>
            <p v-if="timeFieldsError" class="error-message">{{ timeFieldsError }}</p>
          </div>
          <div class="table-container">
          <table>
            <thead>
              <tr>
                <th>Dia de Atendimento</th>
                <th>Abre</th>
                <th>Fecha</th>
                <th>Editar/Excluir</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(horario, index) in listahorarios" :key="index">
                <td>{{ diaSemana[horario.dia] }}</td>
                <td>{{ horario.abre }}</td>
                <td>{{ horario.fecha }}</td>
                <td>
                  <template v-if="editingIndexHorario !== index">
                      <button class="respButton" @click="editarhorario(index)">
                        <i class="uil uil-edit"></i>
                      </button>
                      <button class="respButton" @click="excluirhorario(index)">
                        <i class="uil uil-file-times-alt"></i>
                      </button>
                    </template>
                    <template v-else>
                      <button class="respButton" @click="salvarEdicaoHorario(index)">
                        <i class="uil uil-check"></i>
                      </button>
                      <button class="respButton" @click="cancelarEdicaohorario">
                        <i class="uil uil-times"></i>
                      </button>
                  </template>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>

        <!-- Dash Hprario Atendimento Termina aqui --> 
      </div>
    </div>
  
  <br>
  <div class="group">
        <button type="button" class="button" id="alterarButton" @click="alterar">Alterar</button>
        <button type="button" class="button" id="salvarButton" @click="salvar" disabled>Salvar</button>
        <button type="button" class="button" id="excluirButton">Excluir</button>
        <button type="button" class="button" id="cancelarButton" @click="cancelar" disabled>Cancelar</button>
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
import InfoPopup from '../../components/InfoPopup.vue';
import api from "./../../services/backend.service.js";
import { retornaCodigoBase64 } from "./../../services/conversorDeImagem.service.js";

export default {
components: {
  DashHorAtendimento,
  InfoPopup,
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
      { name: '', description:  '', photo: {imageURL: 'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem10.jpg' }, photoBuffer: null, type: null },],
      estabelecimentoPhoto: null,
      estabelecimentoPhotoType: "",
      fotoEstabelecimento: "https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem10.jpg",
      HorariosSelecionados: [],
      tiposDeComidaSelecionados: [],
      editar: false,
      categoriaSelecionadas: [], //DashCategoria
      categoria: [],//DashCategoria
      opcoesSelecionadas: [],//DashOpcionais
      opcoes: [],//DashOpcionais
      estilosSelecionadas: [],//DashEstilosMusicais
      estilos: [],//DashEstilosMusicais
      tiposDeComidaSelecionados: [],//DashTiposComida
      tiposDeComida: [],//DashTiposComida
      tipoContato: "Telefone", //DashContato
      numeroContato: "",//DashContato
      campoVazio: false,//DashContato
      isEditingContato: false,//DashContato
      listaContatos: [],//DashContato
      editingIndex: -1,//DashContato
      isWhatsapp: false,//DashContato
      redeSocial: "1",//DashRedeSocial
      value: this.redeSocial,//DashRedeSocial
      perfil: "",//DashRedeSocial
      campoVazioRdSocial: false,//DashRedeSocial
      isEditingRdSocial: false,//DashRedeSocial
      listaRedesSociais: [],//DashRedeSocial
      editingIndexRdSocial: -1,//DashRedeSocial
      redesSociaisIncluidas: new Set(),//DashRedeSocial
      redeSocialJaIncluida: false,//DashRedeSocial
      diaSelecionado: "2",//DashHorarioAttendimento
      diaSemana: [null, "Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado", "Segunda a Sexta", "terça a Sexta", "Sábado a Domingo"],//DashHorarioAttendimento
      horariosPorDia: {},//DashHorarioAttendimento
      horaInicio: "",//DashHorarioAttendimento
      horaTermino: "",//DashHorarioAttendimento
      listahorarios: [], //DashHorarioAttendimento
      editingIndexHorario: -1,//DashHorarioAttendimento
      isEditingHorario: false,//DashHorarioAttendimento
      timeFieldsError: false,//DashHorarioAttendimento
  }
},
methods: {
    //DashCategoria------------------------------------------------------
    selecionarCategoria(opcao) { //Dash Categoria
        if (this.opcaopcaoCategSelecionadaoCategSelecionada(opcao)) {
          this.categoriaSelecionadas = this.categoriaSelecionadas.filter(item => item.id !== opcao.id);
        } else {
          if (this.categoriaSelecionadas.length < 3) {
        this.categoriaSelecionadas.push(opcao);
      } else {
        alert('Só é permitido a inclusão de 3 categorias.');
      };
        }
      },
    opcaopcaoCategSelecionadaoCategSelecionada(opcao) {
        return this.categoriaSelecionadas.some(item => item.id === opcao.id);
      },

    //DashOpcionais------------------------------------------------------
    selecionarOpcionais(opcao) {
      if (this.opcaoOpicionaisSelecionada(opcao)) {
        this.opcoesSelecionadas = this.opcoesSelecionadas.filter(item => item.id !== opcao.id);
      } else {
        this.opcoesSelecionadas.push(opcao);
      }
      },
    opcaoOpicionaisSelecionada(opcao) {
        return this.opcoesSelecionadas.some(item => item.id === opcao.id);
      },

    //DashEstilosMusicas------------------------------------------------------
    selecionarEstilo(opcao) {
      if (this.opcaoMusicalSelecionada(opcao)) {
        // Se a opção já estiver selecionada, remova-a da lista
        this.estilosSelecionadas = this.estilosSelecionadas.filter(item => item.id !== opcao.id);
      } else {
        // Caso contrário, adicione-a à lista
        this.estilosSelecionadas.push(opcao);
      }
    },
    opcaoMusicalSelecionada(opcao) {
        return this.estilosSelecionadas.some(item => item.id === opcao.id);
      },

    //DashTipos Comida------------------------------------------------------
    selecionarComida(tipo) {
      if (this.opcaoComidaSelecionada(tipo)) {
        this.tiposDeComidaSelecionados = this.tiposDeComidaSelecionados.filter(item => item.id !== tipo.id);
      } else {
        this.tiposDeComidaSelecionados.push(tipo);
      }
    },
    opcaoComidaSelecionada(tipo) {
      return this.tiposDeComidaSelecionados.some(item => item.id === tipo.id);
    },

    //DashContato------------------------------------------------------
    salvarContato() {
    // Verifique se o campo numeroContato está vazio
    if (!this.numeroContato) {
      this.campoVazio = true;
      return;
    }

    if (!this.validarnumeroContato()) {
      this.campoVazio = true;
      return;
    }

    let tipoContatoId;

    if (this.tipoContato === "Telefone") {
      tipoContatoId = 1; // Defina 1 para Telefone
    } else if (this.tipoContato === "Celular") {
      tipoContatoId = 2; // Defina 2 para Celular
    }

    const novoContato = {
      tipoContato: this.tipoContato,
      numeroContato: this.numeroContato,
      isWhatsapp: this.isWhatsapp,
    };
    
    // Adicione o tipoContatoId ao novoContato
    novoContato.id = tipoContatoId;

    if (this.isEditingContato) {
      // Atualizar um contato existente
      this.listaContatos[this.editingIndex] = novoContato;
      this.isEditingContato = false; // Defina como false após a edição
    } else {
      // Adicionar um novo contato
      this.listaContatos.push(novoContato);
    }
    this.limparCamposContato();
  },
  limparCamposContato() {
    this.tipoContato = "Telefone";
    this.numeroContato = "";
    this.isWhatsapp = false;
    this.campoVazio = false;
  },
  editarContato(index) {
    this.editingIndex = index;
    this.isEditingContato = true; // Defina como true ao editar um contato
    this.tipoContato = this.listaContatos[index].tipoContato;
    this.numeroContato = this.listaContatos[index].numeroContato;
    this.isWhatsapp = this.listaContatos[index].isWhatsapp;
  },
  excluirContato(index) {
    if (confirm("Tem certeza que deseja excluir o contato?")) {
      this.listaContatos.splice(index, 1);
    }
  },
  salvarEdicaoContato(index) {
      this.listaContatos[index] = {
        tipoContato: this.tipoContato,
        numeroContato: this.numeroContato,
        isWhatsapp: this.isWhatsapp,
      };
      this.editingIndex = -1;
      this.isEditingContato = false;
      this.limparCamposContato();
    },
  cancelarEdicaoContato() {
    this.editingIndex = -1;
    this.isEditingContato = false; // Defina como false ao cancelar a edição
    this.limparCamposContato();
  },
  limparCampoVazio() {
    this.campoVazio = false;
  },
  aplicarMascara() {
    let numeroContato = this.numeroContato.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
    let maxCaracteres = this.tipoContato === 'Celular' ? 11 : 10;

    if (numeroContato.length > maxCaracteres) {
      numeroContato = numeroContato.slice(0, maxCaracteres); // Limitar o número de caracteres
    }

    if (this.tipoContato === 'Telefone') {
      // Aplicar a máscara de telefone
      numeroContato = numeroContato.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
    } else if (this.tipoContato === 'Celular') {
      // Aplicar a máscara de celular
      numeroContato = numeroContato.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
    }

    this.numeroContato = numeroContato;
  },

  validarnumeroContato() {
    let minCaracteres = this.tipoContato === 'Celular' ? 11 : 10;
    return this.numeroContato.replace(/\D/g, '').length >= minCaracteres;
  },

  limparCamponumeroContato() {
    this.numeroContato = "";
    console.log(this.tipoContato);
  },

    //DashRdSocias------------------------------------------------------
    salvarRedeSocial() {
      if (!this.perfil) {
        this.campoVazioRdSocial = true;
        this.redeSocialJaIncluida = false;
        return;
      }
      const arrayRedes = [null, 'Facebook', 'Instagram', 'Twitter', 'Site do Estabelecimento', 'Cardápio Online'];
      const redeSocial = arrayRedes[this.redeSocial];

      if (this.redesSociaisIncluidas.has(redeSocial)) {
        this.redeSocialJaIncluida = true;
        this.campoVazioRdSocial = false;
        return;
      }

      const novaRedeSocial = {
        redeSocial: redeSocial,
        perfil: this.perfil,
        idRede: this.redeSocial
      };

      if (this.isEditingRdSocial) {
        this.listaRedesSociais[this.editingIndexRdSocial] = novaRedeSocial;
        this.isEditingRdSocial = false;
      } else {
        this.listaRedesSociais.push(novaRedeSocial);
        this.redesSociaisIncluidas.add(redeSocial);
      }
      this.limparCamposRdSocial();
    },
    limparCamposRdSocial() {
      this.redeSocial = "1";
      this.perfil = "";
      this.campoVazioRdSocial = false;
      this.redeSocialJaIncluida = false;
    },
    editarRedeSocial(index) {
      this.editingIndexRdSocial = index;
      this.redeSocial = this.listaRedesSociais[index].idRede;
      this.perfil = this.listaRedesSociais[index].perfil;
      this.isEditingRdSocial = true;
    },
    salvarEdicaoRdSocial(index) {
      const arrayRedes = [null, 'Facebook', 'Instagram', 'Twitter', 'Site do Estabelecimento', 'Cardápio Online'];
      const novaRedeSocial = arrayRedes[this.redeSocial];
      const perfil = this.perfil;

      if (this.jaExisteOutraRedeSocial(novaRedeSocial, index)) {
        this.redeSocialJaIncluida = true;
        return;
      }


      this.listaRedesSociais[index].redeSocial = novaRedeSocial;
      this.listaRedesSociais[index].perfil = perfil;
      this.editingIndexRdSocial = -1;
      this.isEditingRdSocial = false;
      this.limparCamposRdSocial();
    },
    cancelarEdicaoRdSocial() {
      this.editingIndexRdSocial = -1;
      this.isEditingRdSocial = false;
      this.limparCamposRdSocial();
    },
    excluirRedeSocial(index) {
      if (confirm("Tem certeza que deseja excluir?")) {
        this.listaRedesSociais.splice(index, 1);
      }
    },
    jaExisteOutraRedeSocial(novaRedeSocial, index) {
      for (let i = 0; i < this.listaRedesSociais.length; i++) {
        if (i !== index && this.listaRedesSociais[i].redeSocial === novaRedeSocial) {
          return true;
        }
      }
      return false;
    },



    //DashHorarioAtendimento------------------------------------------------------
    salvarHorario() {
      if (!this.horaInicio || !this.horaTermino) {
        this.timeFieldsError = "Preencha todos os campos.";
      } else {
        const diaSelecionado = this.diaSelecionado;
        const novoHorario = {
          dia: diaSelecionado,
          abre: this.horaInicio,
          fecha: this.horaTermino,
        };
        this.listahorarios.push(novoHorario);
        this.limparCamposhorario();
        this.timeFieldsError = ""; // Limpar o erro, caso tenha sido exibido anteriormente
      }
    },
    limparCamposhorario() {
      this.diaSelecionado = "1"; // Restaurar o valor padrão para Segunda-feira
      this.horaInicio = "";
      this.horaTermino = "";
    },
    editarhorario(index) {
      this.editingIndexHorario = index;
      this.diaSelecionado = this.listahorarios[index].dia;
      this.horaInicio = this.listahorarios[index].abre;
      this.horaTermino = this.listahorarios[index].fecha;
      this.isEditingHorario = true;
    },
    salvarEdicaoHorario(index) {
      if (!this.horaInicio || !this.horaTermino) {
        this.timeFieldsError = "Preencha todos os campos.";
        return;
      }

      const diaSelecionado = this.diaSelecionado;
      const novoHorario = {
        dia: diaSelecionado,
        abre: this.horaInicio,
        fecha: this.horaTermino,
      };

      // Atualize o horário editado no array this.listahorarios
      this.listahorarios[index] = novoHorario;

      // Limpe os campos e redefina as variáveis de controle
      this.limparCamposhorario();
      this.editingIndexHorario = -1;
      this.isEditingHorario = false;
      this.timeFieldsError = "";
    },
    cancelarEdicaohorario() {
      this.editingIndexHorario = -1;
      this.limparCamposhorario();
      this.isEditingHorario = false;
    },
    excluirhorario(index) {
      const diaExcluido = this.listahorarios[index].dia;

      if (
        diaExcluido === "Segunda a Sexta" ||
        diaExcluido === "terça a Sexta" ||
        diaExcluido === "Sábado a Domingo"
      ) {
        const diasEspeciais = {
          "Segunda a Sexta": ["Segunda", "Terca", "Quarta", "Quinta", "Sexta"],
          "terça a Sexta": ["Terca", "Quarta", "Quinta", "Sexta"],
          "Sábado a Domingo": ["Sabado", "Domingo"],
        };

        diasEspeciais[diaExcluido].forEach((dia) => {
          if (this.horariosPorDia[dia] > 0) {
            this.horariosPorDia[dia]--;
          }
        });
      } else {
        if (this.horariosPorDia[diaExcluido] > 0) {
          this.horariosPorDia[diaExcluido]--;
        }
      }
      if (confirm("Tem certeza que deseja excluir?")) {
        this.listahorarios.splice(index, 1);
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

  /*Img estabelecimento*/
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
  habilitarCampos() {
  const camposDesabilitados = document.querySelectorAll('input[disabled], textarea[disabled]');
  camposDesabilitados.forEach((campo) => {
    campo.removeAttribute('disabled');
  });
},

desabilitarCampos() {
  const camposHabilitados = document.querySelectorAll('input:not([disabled]), textarea:not([disabled])');
  camposHabilitados.forEach((campo) => {
    campo.setAttribute('disabled', true);
  });
},

alterar() {
  this.habilitarCampos();
  // Desabilitar o botão "Alterar" e "Excluir"
  document.getElementById("alterarButton").setAttribute("disabled", true);
  document.getElementById("excluirButton").setAttribute("disabled", true);
  // Habilitar os botões "Salvar" e "Cancelar"
  document.getElementById("salvarButton").removeAttribute("disabled");
  document.getElementById("cancelarButton").removeAttribute("disabled");
},

cancelar() {
  this.desabilitarCampos();
  // Habilitar o botão "Alterar"
  document.getElementById("alterarButton").removeAttribute("disabled");
  // Desabilitar os botões "Salvar" , "Cancelar" e "Excluir"
  document.getElementById("excluirButton").removeAttribute("disabled", true);
  document.getElementById("salvarButton").setAttribute("disabled", true);
  document.getElementById("cancelarButton").setAttribute("disabled", true);
},

async salvar() {
  try {
    console.log('PUT estabelecimento')
    this.desabilitarCampos();
    const novosDadosEstabelecimento = {
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
      RdSocialSelecionadas: this.RdSocialSelecionadas,
      ContatosSelecionadas: this.ContatosSelecionadas,
      HorariosSelecionados: this.HorariosSelecionados
    };
    const atualizacaoDados = await api.put('/estabelecimento', {nelson: 'nelson'});
    console.log('atualizacaoDados:: ', atualizacaoDados)

    // Habilitar o botão "Alterar"
    document.getElementById("alterarButton").removeAttribute("disabled");
    // Desabilitar os botões "Salvar" , "Cancelar e "Excluir"
    document.getElementById("salvarButton").setAttribute("disabled", true);
    document.getElementById("cancelarButton").setAttribute("disabled", true);
  } catch (error) {
    console.log('Erro ao atualizar dados do estabelecimento: ', error);
  }
},
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
  categoriaSelecionadasString() { // DashCategoria
    return this.categoriaSelecionadas.map(opcao => opcao.nome).join(", ");
    },
    opcoesSelecionadasString() {// DashOpcionais
    return this.opcoesSelecionadas.map(opcao => opcao.nome).join(", ");
  },
  estilosSelecionadasString() {// DashEstilosMusicais
    return this.estilosSelecionadas.map(opcao => opcao.nome).join(", ");
  },
  tiposDeComidaSelecionadosString() {// DashTiposComida
    return this.tiposDeComidaSelecionados.map(tipo => tipo.nome).join(", ");
  },
  },
  async created() {
    try {      
      const dadosEstabelecimentoRequest = await api.get(`/estabelecimento/meuEstabelecimento/${sessionStorage.getItem('idEstabelecimento')}`);

      console.log('dadosEstabelecimentoRequest:: ', dadosEstabelecimentoRequest.data);

      const {
        nome,
        formatoFoto,
        cnpj,
        descricao,
        numeroEstabelecimento,
        logradouro,
        bairro,
        cidade,
        estado,
        cep,
        categorias,
        opcionais,
        estilosMusica,
        comidas,
        opcionaisEstabelecimento,
        categoriasEstabelecimento,
        redeSociaisEstabelecimento,
        musicasEstabelecimento,
        horariosEstabelecimento,
        recomendacoesEstabelecimento,
        comidasEstabelecimento,
        contatosEstabelecimento
      } = dadosEstabelecimentoRequest.data;
      try {
        this.fotoEstabelecimento = require(`./images/${sessionStorage.getItem('idEstabelecimento')}.${formatoFoto}`);
      } catch (error) {
        console.log('Error ao exibir foto: ', error);
      }
      this.categoria = categorias;
      this.opcoes = opcionais;
      this.estilos = estilosMusica;
      this.tiposDeComida = comidas;

      this.nomeEstabelecimento = nome;
      this.descricaoEstabelecimento = descricao;
      this.cnpj = cnpj;
      this.cep = cep;
      this.numero = numeroEstabelecimento;
      this.endereco.rua = logradouro;
      this.endereco.bairro = bairro;
      this.endereco.cidade = cidade;
      this.endereco.uf = estado;

      this.recomendacao = recomendacoesEstabelecimento;
      try {
        for (let i=0; i < this.recomendacao.length; i++) {
          this.recomendacao[i].photo = {};
          this.recomendacao[i].photo.imageURL = require(`./../../images/recomendacao/${this.recomendacao[i].id}.${this.recomendacao[i].formatoFoto}`);
        }
      } catch (error){
        console.log('Erro ao exibir imagens das recomendações: ', error);
        for (let i=0; i < this.recomendacao.length; i++) {
          this.recomendacao[i].photo = {};
          this.recomendacao[i].photo.imageURL = 'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem10.jpg';
        }
      }

      this.opcoesSelecionadas = opcionaisEstabelecimento;
      this.categoriaSelecionadas = categoriasEstabelecimento;
      this.tiposDeComidaSelecionados = comidasEstabelecimento;
      this.estilosSelecionadas = musicasEstabelecimento;
      this.listaRedesSociais = redeSociaisEstabelecimento;
      this.listahorarios = horariosEstabelecimento;
      this.listaContatos = contatosEstabelecimento;

      console.log('recomendacoesEstabelecimento:: ', recomendacoesEstabelecimento);


      
    } catch (error) {
      console.log('Erro ao buscar dados da página:: ', error);
    }
  },

};
</script>


<style scoped>
#form-wrap {
 margin: auto;
 max-width: 2000px;
 min-height: 3000px;
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
}

#form-wrap .group .button:hover {
  background:#ff9800;
}

.image-container {
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
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

.recomendacoes-container {
display: flex;
grid-template-columns: repeat(auto-fill, minmax(400px, 1fr)); /* Isso cria colunas com um tamanho mínimo de 300px e as ajusta automaticamente para caber no contêiner */
gap: 20px; /* Espaçamento entre as indicações */
justify-content: center;
}

.recomendacao {
flex: 0 0 calc(33.33% - 20px); /* Para exibir 3 indicações por linha */
margin-right: 20px;
}

.recomendacao-item {
margin-bottom: 20px;
}

.custom-button{
background:#e91e2f;
cursor: pointer;
transition: 0.5s;
color: #fff;
border-radius: 20px;
padding: 10px 15px;
}


/* Stile Dash Categoria, Opcionais, EstilosMusicais e Tipos Commida*/

.quadro-categorias,
.quadro-Opcionais,
.quadro-estilosMusicais,
.tipos-de-comida {
  border: 2px solid white;
  padding: 20px;
  width: 400px;
  text-align: center;
  margin: 0 auto;
  background-color: rgba(255, 255, 255, 0.418); 
}

p{ /*ajustar de acordo com o fundo*/
  color: white;
}

.botaoCategoria,
.botaoOpcionais,
.botaoEstiloMusical,
.botaoTiposComida {
  background-color: red;
  padding: 10px 20px;
  margin: 5px;
  cursor: pointer;
  border-radius: 25px; 
  color: #fff;
}

.botaoCategoria.selecionado,
.botaoOpcionais.selecionado,
.botaoEstiloMusical.selecionado,
.botaoTiposComida.selecionado {
  background-color: orange;
}

.botaoCategoria:hover,
.botaoOpcionais:hover,
.botaoEstiloMusical:hover ,
.botaoTiposComida:hover {
  background-color: orange;
}


/* Stile Dash Categoria e Rede socias*/
select,
input[type="time"] {
border: none;
padding: 8px 10px;
border-radius: 25px;
background: rgba(211, 201, 201, 0.774);
width: 100%;
}

/* Ajuste a margem para o select e os campos de entrada */
select,
input[type="time"],
label {
margin: 0.4rem 0;
}

.container {
white-space: nowrap;
max-width: 650px;
margin: 0 auto;
padding: 20px;
background-color: rgba(255, 255, 255, 0.418); 
}

.table-container {
max-height: 300px; /* Adjust the height as needed */
overflow: auto;
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
color: #000;
}

th {
background-color: #f2f2f2;
}

button {
background: #e91e2f;
cursor: pointer;
transition: 0.5s;
border: none;
padding: 8px 30px;
border-radius: 25px;
color: #fff;
}

button:hover {
background: #ff9800;
}

.disabled-button {
background: gray;
cursor: not-allowed;
}

button:disabled:hover {
background: gray;
}

.whatsapp-image {
  width: 30px; 
  height: auto; 
}

input#numeroContato {
width: 50%; /* Preencher todo o espaço disponível no contêiner */
box-sizing: border-box; /* Incluir borda e preenchimento no tamanho total */
}

input {
border: none;
padding: 8px 15px;
border-radius: 25px;
background: rgba(211, 201, 201, 0.774);
color: #000;
}

.error input {
border-color: red; /* Estilizar o campo de entrada quando estiver vazio */
}

.error-message {
color: red;
margin-top: 5px;
font-size: 14px;
}

.respButton {
  padding: 6px 12px;
}


.custom-popup {
  font-size: 15px;
  max-width: 200px; /* Defina a largura máxima desejada */
  white-space: normal; /* Remova o white-space: nowrap */
}

/* Responsive */

@media (max-width: 1160px) {
  .column {
    flex-direction: column;
  }
#form-wrap {
  max-width: 700px;
  background-size: 100% 100%;
}
.container {
    max-width: 900px;
  }
  table {
    font-size: 17px;
  }
  th,
  td {
    padding: 6px;
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



  .respButton {
    padding: 4px 10px;
  }

  .container {
    max-width: 800px;
  }

  form {
    justify-content: flex-start;
  }

  button {
    margin-top: 8px;
  }
  table {
    font-size: 12px;
  }
}

@media (max-width: 600px) {
  .respButton {
    padding: 4px 10px;
  }

  .container {
    max-width: 650px;
  }

  form {
    justify-content: flex-start;
  }

  button {
    margin-top: 8px;
  }
}

@media (max-width: 414px) {

  .container {
    max-width: 240px;
  }
  
  input#numeroContato {
  width: 100%; /* Preencher todo o espaço disponível no contêiner */
  box-sizing: border-box; /* Incluir borda e preenchimento no tamanho total */
}
  table {
    font-size: 9px;
  }

  th,
  td {
    padding: 2px 8px;
  }
}

</style>

