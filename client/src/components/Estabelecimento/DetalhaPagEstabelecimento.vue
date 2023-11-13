<template>
  <div>
    <header>
      <h1 class="gradient">{{ nomeDoEstabelecimento }}</h1><br>
      <p>{{ categoria }}</p><br>
      <div class="icons">
        <span  v-if="favoritoIsVisible" class="star-icon" :class="{ selected: favorito }" @click="toggleFavorito"   >&#9733;</span>
        <span class="whatsapp-icon" @click="compartilharEstabelecimento"><img src="../../../public/img/WhatsIcon.png" alt=""></span>
      </div>
      <div class="container-estabelecimento">
        <img :src="imagemEstabelecimento" alt="Imagem do Estabelecimento" class="image-estabelecimento"/>
      </div>

    </header>

    <section class="description">
      <h2>Descrição do Estabelecimento:</h2>
      <p>{{ descricao }}</p>
    </section>
    <br>
    <div class="recomendacaoTitulo ">
    <br><h2>Recomendações do Chef:</h2>
    </div>
    <section class="chef-recomendacoes">
      <div class="recomendacao" v-for="prato in pratosChef" :key="prato.id">
        <div>
          <h2><i class="fa-solid fa-utensils" style="color: #000000;"></i> {{ prato.nome }}</h2><br>
          <p><i class="fa-regular fa-comment" style="color: #ff0000;"></i> {{ prato.descricao }}</p><br>
          <img :src="prato.imagem" :alt="'Imagem de ' + prato.nome" class="imagem-prato"/>
        </div>
      </div>
    </section>

    <section class="adicionais-info">
      <div class="info">
        <h2>O que oferecemos:</h2><br>
        <p> <i class="fa-solid fa-newspaper" style="color: #ff0000;"></i> {{ opcional }}</p><br>

        <h2 v-if=this.tocaMusica>Nossa Playlist:</h2><br>
        <p v-if=this.tocaMusica> <i class="fa-solid fa-music" style="color: #ff0000;"></i> {{ musica }}</p>
      </div>
      <div class="info">
        <h2>Forma de Contato e Redes Sociais:</h2><br>
        <p>Telefone:</p>
        <p v-show="telefone.length > 0 "><i class="fa-solid fa-phone" style="color: #000000;"></i> {{ aplicarMascara(telefone, 'Telefone') }}
          <span v-if="isWhatsTelefone == 1" class="whatsapp-iconContato"><img src="../../../public/img/WhatsIcon.png" alt=""></span>
        </p>
        <p v-show="celular.length > 0 "><i class="fa-solid fa-mobile-screen-button" style="color: #000000;"></i> {{ aplicarMascara(celular, 'Celular') }}
          <span v-if="isWhatsCelular == 1" class="whatsapp-iconContato" ><img src="../../../public/img/WhatsIcon.png" alt=""></span>
        </p>
        
        <br><p>Redes Sociais:</p>
        <p class="redes">
            <a v-if="facebook.length > 0" :href="facebook" target="_blank">
              <i class="fa-brands fa-facebook" style="color: #4267b2;"></i>
            </a>
      
            <a v-if="instagram.length > 0" :href="instagram" target="_blank">
              <i class="fab fa-instagram"></i>
            </a>

            <a v-if="twitter.length > 0" class="twitter" :href="twitter" target="_blank">
              <i class="fa-brands fa-twitter" style="color: #1da1f2;"></i>
            </a>
        </p>
     
        <p v-if="site.length > 0">
          Nosso site:<br>
          <a :href="site" target="_blank">
            <i class="fa-solid fa-globe" style="color: #000000;"></i>
          </a>
        </p>

        <p v-if="cardapio.length > 0">
          Cardápio Online:<br>
          <a :href="cardapio" target="_blank">
            <i class="fa-solid fa-utensils" style="color: #3c3b40;"></i>
          </a>
        </p>
      
      
      </div>

    </section>

    <section class="endereco-info">
      <div class="endereco">
        <h2>Endereço</h2><br>
        <p><i class="fa-sharp fa-solid fa-location-dot" style="color: #ff0000;"></i>
        {{ endereco }}</p><br><br>

        <h2>Horário de Atendimento:</h2><br>
        <p><i class="fa-regular fa-clock" style="color: #ff0000;"></i></p><p v-html="horarios"></p>
      </div>


      <div class="endereco">
        <!-- Replace with actual map integration -->
        <h2>Localização no Mapa:</h2><br>
        <div id="map-container"></div>
      </div>
    </section>

    <section class="user-avaliacao" v-show="userType === '0'">
      <h2>Avalie</h2>
      <form>
        <label for="avaliacao">Dê uma Nota:</label>
        <div class="rating">
          <span class="star" :class="{ selected: nota >= 1 }" @click="selecionarNota(1)">&#9733;</span>
          <span class="star" :class="{ selected: nota >= 2 }" @click="selecionarNota(2)">&#9733;</span>
          <span class="star" :class="{ selected: nota >= 3 }" @click="selecionarNota(3)">&#9733;</span>
          <span class="star" :class="{ selected: nota >= 4 }" @click="selecionarNota(4)">&#9733;</span>
          <span class="star" :class="{ selected: nota >= 5 }" @click="selecionarNota(5)">&#9733;</span>
        </div>
        <br />
        <label for="user-review">Digite sua avaliação:</label>
        <div class="group">
          <textarea id="user-review" class="input" name="user-review" rows="4" cols="50" v-model="avaliacaoEstab"></textarea>
          <br />

          <div>
            <input type="button" class="button" value="Avaliar" @click.prevent="avaliar" />
          </div>
        </div>
      </form>
    </section>
    <br>
    <section class="avaliacao-estabelecimento">
        <div>
        <div class="avaliacao">
          <div class="customer-info">
                <h3>Esse Estabelecimento é nota:</h3>
            <span class="nota"> {{ mediaNt?.toFixed(1) }} </span>
          </div>
        </div><br>
        <div v-for="(review, index) in visibleAvaliacaoEstab" :key="index">
          <fieldset>
            <label class="titulo">
              <div class="stars">
                <span
                  v-for="star in 5"
                  :key="star"
                  :class="{ 'filled-star': star <= review.stars, 'empty-star': star > review.stars }"
                >
                  &#9733;
                </span>
              </div><br>
              {{ review.nome }} - Data: {{ review.data }}
            </label>
            <br><br>
            <p class="descricao">{{ review.descricao }}</p>
            <br>
          </fieldset><br>
        </div>
        <div class="Posittion-button">
          <button v-if="visibleAvaliacaoEstab.length < avaliacao.length" @click="showMoreFields">Exibir Avaliações</button>
      </div>
      </div>
    </section>
  </div>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</template>

<script>
import api from './../../services/backend.service.js';
import dataToDiaMesAno from './../../services/dataToDiaMesAno.service.js';
const variaveisGlobais = require('./../../../variaveis.js');

// import openCageGeocodingApi from './../../services/openCageGeocoding.service.js'; 

const formatarHorario = (horarioHhMmSs) => {
    // Divide o horário em horas, minutos e segundos
    const partes = horarioHhMmSs.split(":");
    
    // Obtém horas e minutos
    const horas = partes[0];
    const minutos = partes[1];
    
    // Formata horas e minutos
    const horarioHhMm = horas + ":" + minutos;
    
    return horarioHhMm;
}

export default {
    name: "DetalhaPagEstabelecimento",
    
    data() {
        return {
            nota: 0, 
            favorito: false,
            nomeDoEstabelecimento: "",
            categoria: "",
            imagemEstabelecimento: "",
            descricao: "",
            opcional: "",
            telefone: "",
            celular: "",
            isWhatsTelefone: 0,
            isWhatsCelular: 0,
            facebook: "",
            instagram: "",
            twitter: "",
            site: "",
            cardapio: "",
            endereco: "",
            tocaMusica: false,
            musica: "",
            horarios: "",
            avaliacao: [], // Array de avaliações
            mediaNt: 0, // Média que vem do banco
            visibleAvaliacaoEstab: [], // Array para armazenar as avaliações visíveis
            numToShow: 0, // Número inicial de avaliações para mostrar
        };
    },
  async created() {
    try {
      this.id = this.$route.params.id;

      const dadosEstabelecimento = await api.get(`/estabelecimento/${this.$route.params.id}`);
      // Removendo objetos com dados de dentro do retorno do backend
      const {
        dadosRedesSociais,
        dadosHorarios,
        nome,
        descricao,
        dadosCategoriaArray,
        logradouro,
        numeroEstabelecimento,
        bairro,
        cep,
        cidade,
        estado,
        dadosOpcionaisArray,
        tocaMusica,
        dadosMusicaArray,
        formatoFoto,
        dadosRecomendacao,
        dadosAvaliacao,
        nota,
        dadosContatos,
        latitude,
        longitude
      } = dadosEstabelecimento.data;

      // Depois podemos ver uma forma mais bonita de apresentar os telefones do estabelecimento
      try {
        for (let i = 0; i < dadosContatos.length; i++) {
          if (dadosContatos[i].idContato == 1) {
            this.telefone = dadosContatos[i].contato
            this.isWhatsTelefone = dadosContatos[i].isWhatsapp
          } else {
            this.celular = dadosContatos[i].contato
            this.isWhatsCelular = dadosContatos[i].isWhatsapp
          }
        };

      } catch (error) {
        console.log('Erro ao carregar contato: ', error);
      }

      try {
        this.imagemEstabelecimento = require(`./images/${this.$route.params.id}.${formatoFoto}`);
      } catch (error) {
        console.log('Erro ao exibir imagem do estabelecimento');
      }

      try {
        for (let i = 0; i < dadosRecomendacao.length; i++) {
          dadosRecomendacao[i].imagem = require(`./../../images/recomendacao/${dadosRecomendacao[i].id}.${dadosRecomendacao[i].formatoFoto}`);
        };
      } catch (error) {
        console.log('Erro ao exibir recomendações do estabelecimento');
      }

      this.pratosChef = dadosRecomendacao;
      this.nomeDoEstabelecimento = nome;
      this.descricao = descricao;
      this.categoria = dadosCategoriaArray.join(' - ');
      this.endereco = `${logradouro}, ${numeroEstabelecimento} - ${bairro}. CEP: ${cep}. ${cidade} - ${estado}`;
      this.opcional = dadosOpcionaisArray.join(', ');

      for (let i = 0; i < dadosRedesSociais.length; i++) {
        if (dadosRedesSociais[i].id == 1) {
          this.facebook = dadosRedesSociais[i].redeSocial;
        } else if (dadosRedesSociais[i].id == 2) {
          this.instagram = dadosRedesSociais[i].redeSocial;
        } else if (dadosRedesSociais[i].id == 3) {
          this.twitter = dadosRedesSociais[i].redeSocial;
        } else if (dadosRedesSociais[i].id == 4) {
          this.site = dadosRedesSociais[i].redeSocial;
        } else if (dadosRedesSociais[i].id == 5) {
          this.cardapio = dadosRedesSociais[i].redeSocial;
        }
      }

      let todosHorarios = '';
      for (let i = 0; i < dadosHorarios.length; ++i) {
        todosHorarios += `<p>${dadosHorarios[i].diaSemana}: ${formatarHorario(dadosHorarios[i].horarioInicio)}h - ${formatarHorario(dadosHorarios[i].horarioFim)}h</p>`;
      };

      this.horarios = todosHorarios;
      this.tocaMusica = tocaMusica;
      this.musica = dadosMusicaArray.join(', ');

      for (let i = 0; i < dadosAvaliacao.length; i++) {
        dadosAvaliacao[i].data = dataToDiaMesAno(dadosAvaliacao[i].data);
      }

      this.avaliacao = dadosAvaliacao;
      this.mediaNt = nota;
      this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow); // exibe as 4 primeiras avaliações

      // Verifica se o estabelecimento é favorito do usuário logado
      try {
        if (sessionStorage.getItem('idUsuario')) {
          const verificaFavorito = await api.get(`/favorito/${sessionStorage.getItem('idUsuario')}`);
          for (let i = 0; i < verificaFavorito.data.length; i++) {
            if (verificaFavorito.data[i].idEstabelecimento == this.$route.params.id) {
              this.favorito = true;
            }
          }
        }
      } catch (error) {
        console.log('Erro ao verificar se o estabelecimento é favorito do usuário:: ', error);
      }

      try {
        // const latitude = -23.483156515377846; // Deixadas para testes
        // const longitude = -47.448209149867765; // Deixadas para testes
        this.createMap(latitude, longitude);
      } catch (error) {
        console.log('ERROR:: ', error);
      }

    } catch (error) {
      console.log('ERROR:: ', error);
    }
  },
    methods: {
          showMoreFields() {
            // exibe mais 4 campos
            this.numToShow += 6;
            this.visibleAvaliacaoEstab = this.avaliacao.slice(0, this.numToShow);
          },
        selecionarNota(notaSelecionada) {
            // Atualiza a valor de nota
            this.nota = notaSelecionada;
        },
        async avaliar() {
          try {
            // Pega a avaliação do usuário
            const avaliacao = document.getElementById("user-review").value;

            const dadosAvaliacao = {
              idUsuario: sessionStorage.getItem('idUsuario'),
              idEstabelecimento: this.id,
              descricao: avaliacao,
              nota: this.nota
            };

            await api.post('/avaliacao', dadosAvaliacao);
            location.reload();
          } catch (error) {
            console.log(`Erro ao salvar avaliação: `, error);
          }
        },
        compartilharEstabelecimento() { // Por enquanto apenas coloca a URL do estabelecimento na área de transferência (CTRL+V) do usuário
           // URL para compartilhar
           const url = `http://localhost:8080/PaginaEstabelecimento/${this.$route.params.id}`;

           //Msg de Compartilhamento
           const mensagem = "Better Choice: Sempre a sua melhor opção! Confira este estabelecimento: " + url;

            // Link para compartilhar pelo WhatsApp com a URL, imagem e descrição
            const linkWhatsApp = `https://api.whatsapp.com/send?text=${encodeURIComponent(mensagem)}`;

            // Abra uma nova guia com o link do WhatsApp
            window.open(`https://wa.me/?text=${encodeURIComponent(mensagem)}`, '_blank');

        },
        async toggleFavorito() {
          try {
            // Se for favorito do usuário exclui o favorito senão for adiciona como favorito
            if (this.favorito) {
              await api.delete(`/favorito/${sessionStorage.getItem('idUsuario')}/${this.$route.params.id}`);
            } else {
              if (sessionStorage.getItem('idUsuario')) {
                const dadosFavorito = {
                  idUsuario: sessionStorage.getItem('idUsuario'),
                  idEstabelecimento: this.$route.params.id
                }
                await api.post('/favorito', dadosFavorito);
              }
            }
            this.favorito = !this.favorito;
          } catch (error) {
            console.log('ERROR:: ', error);
          }
        },
        aplicarMascara(numero, tipoContato) {
          if (!numero) {
            return ""; // Não aplique a máscara se o número estiver vazio
          }

          let numeroFormatado;

          if (tipoContato === 'Telefone') {
            numeroFormatado = numero.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
          } else if (tipoContato === 'Celular') {
            numeroFormatado = numero.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
          } else {
            numeroFormatado = numero; // Se não for Telefone nem Celular, não aplique nenhuma máscara
          }

          return numeroFormatado;
        },
        createMap(latitude, longitude) {
          const apiKey = variaveisGlobais.googleApiKey();

          // Cria o URL dinâmico para o mapa do Google
          const mapUrl = `https://www.google.com/maps/embed/v1/place?key=${apiKey}&maptype=roadmap&q=${latitude},${longitude}`;

          // Cria o elemento iframe dinamicamente
          const iframe = document.createElement('iframe');
          iframe.width = '600';
          iframe.height = '450';
          iframe.frameBorder = '0';
          iframe.style.border = '0';
          iframe.src = mapUrl;
          iframe.allowFullscreen = '';
          iframe.loading = 'lazy';

          // Adiciona o iframe ao contêiner do mapa
          const mapContainer = document.getElementById('map-container');
          mapContainer.appendChild(iframe);
        },
    },
    computed:{
      userType() {
      return sessionStorage.getItem("tipoUsuario");
    },
    favoritoIsVisible() {
      const userType = sessionStorage.getItem("tipoUsuario");
      return userType === '0' || userType === '1';
    }
    }
}

</script>

<style scoped>
/* Estilos gerais */
body {
    margin: 0;
    padding: 0;
}

header {
    text-align: center;
    background-color: #333;
    color: #e91e2f;
    padding: 20px;
    border-radius: 25px 25px 0px 0px;
}

.container-estabelecimento {
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  align-items: center; /* Adicione esta linha para centralizar horizontalmente */
  gap: 20px;
  margin-top: 50px;
  width: 700px;
  height: 500px;
  margin: 0 auto;
  }
    

    .image-estabelecimento {
      width: 700px;
      height: 90%; 
      border-radius: 16px;
    }

.gradient {
  background-image: linear-gradient(to bottom, #df8600, #db3240, #ff0015);
  color: black;
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}


.icons {
    float: right;
}

.favorite-icon,
.share-icon {
    margin-left: 10px;
    cursor: pointer;
}

/* Estilos da seção de descrição */
.description {
    padding: 20px;
    /*background-color: #f0f0f0a9;*/
    background-color: #fff;
    border-radius: 0px 0px 25px 25px;
}

/* Estilos das recomendações do chef */
.chef-recomendacoes {
    display: flex;
    justify-content: space-between;
    padding: 20px;
}

h2{
  text-align: center;
  color: #D62718;
  font-size: 2em;
}

h3{
  color: #D62718;
}
.recomendacao {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    /*background-color: #f0f0f0a9;*/
    background-color: #fff;
    margin: 0 10px;
    text-align: center;
    border-radius: 25px;
}

.recomendacaoTitulo{

  padding: 10px;
  /*background-color: #f0f0f0a9;*/
  background-color: #ffffffe0;
  text-align: center;
  max-width: 700px; 
  margin: 0 auto; 
  border-radius: 25px
}

.imagem-prato {
  width: 300px; 
  height: 250px; 
  object-fit: cover; 
  border-radius: 15px; /* Adicione borda arredondada se desejado */
}


/* Estilos das informações adicionais */
.adicionais-info {
    display: flex;
    justify-content: space-between;
    padding: 20px;
}

.info {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    /*background-color: #f0f0f0a9;*/
    background-color: #fff;
    margin: 0 10px;
    border-radius: 25px
}

.redes{
  font-size: 25px;
}

a i {
  margin-right: 10px;
  transition: color 0.3s; 
  color: #000000;
}

a i:hover {

  color: #ff0000 !important;
}

.endereco-info{
    display: flex;
    justify-content: space-between;
    padding: 20px;
}
.endereco{
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    /*background-color: #f0f0f0a9;*/
    background-color: #fff;
    margin: 0 10px;
    border-radius: 25px
}

/* Estilos da seção de avaliação do usuário */
.user-avaliacao {
    padding: 20px;
    /*background-color: #f0f0f0a9;*/
    background-color: #fff;
    text-align: center;
    max-width: 700px; 
    margin: 0 auto; 
    border-radius: 25px
}

/* Estilos para o input de avaliação */
.input {
    width: 100%;
    color: #000;
    display: block;
    box-sizing: border-box; /* Inclui padding e borda na largura total */
    max-width: 90%; /* Largura máxima de 100% */
    margin: 0 auto;
}

/* Estilos da seção de avaliação do usuário */
.user-avaliacao {
    padding: 20px;
    /*background-color: #f0f0f0a9;*/
    background-color: #fff;
    text-align: center;
}

/* Estilos das Estrelas seção de avaliação do usuário*/
.rating {
    font-size: 24px;
    text-align: center;
}

.star {
    cursor: pointer;
    color: gray;
    transition: color 0.2s; /* Transição suave de cor ao passar o mouse */
}

.star.selected {
    color: yellow;
}

.star-icon {
    font-size: 35px; /* Tamanho da fonte desejado para a estrela */
    cursor: pointer;
    transition: color 0.2s; /* Transição suave de cor ao passar o mouse */
    color: #b39a9a;
}

.whatsapp-icon img {
    cursor: pointer;
    width: 26px;
    height: 26px;
}

.whatsapp-iconContato img{
  width: 26px;
  height: 26px;
}

.star-icon.selected  {
    color: yellow;
}

/* Estilos seção de avaliação do estabelecimento*/

.avaliacao-estabelecimento{
    padding: 20px;
    /*background-color: #f0f0f0a9;*/
        background-color: #ffffffe0;
    text-align: center;
    max-width: 700px; 
    margin: 0 auto; 
    border-radius: 25px
}

fieldset {
      border: 2px solid #ff9800;
      border-radius: 20px;
      padding: 10px;
      margin-bottom: 20px;
      background-color: rgba(255, 255, 255, 0.678);
      box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px;
      max-width: 800px;
      margin: 0 auto;
  }
  
  .titulo {
      font-weight: bold;
      color: #f50000;
      font-size: 20px;
  }
  
  .avaliacao {
      display: flex;
      align-items: center;
      justify-content: center;
  }

  .stars {
      display: flex;
  }
  
  .filled-star,
  .nota {
      color: rgb(194, 194, 4);
  }
  
  .empty-star {
      color: grey;
  }
  
  .customer-info {
      margin-left: 10px;
      font-weight: bold;
      color: #fff;
      font-size: 35px;
      text-align: center;
  }
  
  .descricao {
      margin-top: 5px;
  }


/* Estilos para links */
a {
    color: #333;
    text-decoration: none;
}


a:hover {
    text-decoration: underline;
}

/* Estilos para os botões */
.group {
    margin-bottom: 15px;
  }
  
 .group .label,
.group .input {
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
  
  .group .button
  {
    text-transform: uppercase;
  }
  
  .group .button-spacing {
    margin-right: 10px;
  }
  
.group .button {
    padding: 15px 30px;
  }

.group .button {
    background:#e91e2f;
    cursor: pointer;
    transition: 0.5s;
    color: #fff;
  }
  
.group .button:hover {
    background:#ff9800;
  }

button{
    background-color: #e91e2f; 
    color: #fff; 
    font-size: 16px; 
    padding: 10px 15px; 
    border: none; 
    border-radius: 25px; 
    cursor: pointer;
    margin: 0 auto; 
  }
 
button:hover {
    background:#ff9800;
  }
  
.Posittion-button {
  display: flex;
  justify-content: center; /* Centraliza horizontalmente */
  align-items: center; /* Centraliza verticalmente */

} 
 p{
  font-weight: bold;
  font-size: 22px;
 }

</style>