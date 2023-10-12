<template>
  <div>
    <header>
      <h1>{{ nomeDoEstabelecimento }}</h1>
      <p>{{ categoria }}</p>
      <img :src="imagemEstabelecimento" alt="Imagem do Estabelecimento" class="imagem-estabelecimento"/>
      <div class="icons">
        <span class="star-icon" :class="{ selected: favorito }" @click="toggleFavorito">&#9733;</span>
        <span class="share-icon">Compartilhar</span>
      </div>
    </header>

    <section class="description">
      <h2>Descrição do Estabelecimento:</h2>
      <p>{{ descricao }}</p>
    </section>

    <br><h2>Recomendações do Chef:</h2>
    <section class="chef-recomendacoes">
      <div class="recomendacao" v-for="prato in pratosChef" :key="prato.id">
        <div>
          <h3>{{ prato.nome }}</h3>
          <p>{{ prato.descricao }}</p>
          <img :src="prato.imagem" :alt="'Imagem de ' + prato.nome" class="imagem-prato"/>
        </div>
      </div>
    </section>

    <section class="adicionais-info">
      <div class="info">
        <h3>O que oferecemos:</h3>
        <p>{{ opcional }}</p><br>

        <h3 v-if=this.tocaMusica>Nossa Playlist:</h3>
        <p v-if=this.tocaMusica>{{ musica }}</p>
      </div>
      <div class="info">
        <h3>Forma de Contato e Redes Sociais:</h3>
        <p >Telefone: {{ telefone }}</p>
        <p>Redes Sociais: <a :href="facebook" target="_blank" >{{ facebook }}</a>, <a :href="instagram" target="_blank">{{ instagram }}</a>, <a :href="twitter" target="_blank">{{ twitter }}</a></p>
        <p v-if="this.site.length > 0">Nosso site: <a :href="site" target="_blank">{{ site }}</a></p>
        <p v-if="this.cardapio.length > 0">Cardápio Online: <a :href="cardapio" target="_blank">{{ cardapio }}</a></p>
      </div>
      <div class="info">
        <h3>Horário de Atendimento:</h3>
        <div v-html="horarios"></div>
      </div>
    </section>

    <section class="endereco-info">
      <div class="endereco">
        <h2>Endereço</h2>
        <p>{{ endereco }}</p>
      </div>
      <div class="endereco">
        <!-- Replace with actual map integration -->
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.349676015265!2dSUA-LONGITUDE!3dSUA-LATITUDE!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zSsKwMTcnMzcuNSJTIDQwwrAyMSc1LjciRQ!5e0!3m2!1spt-BR!2sbr!4v1618986094141!5m2!1spt-BR!2sbr"
          width="600"
          height="450"
          style="border:0;"
          allowfullscreen=""
          loading="lazy"
        ></iframe>
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
                Esse Estabelecimento é nota:<br>
            <span class="nota"> {{ mediaNt }} </span>
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
</template>

<script>
import api from './../../services/backend.service.js';
import dataToDiaMesAno from './../../services/dataToDiaMesAno.service.js';
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
          nota
        } = dadosEstabelecimento.data;

        // try {
        //   const test = await openCageGeocodingApi.obterLatLongPorCEP('18117121');
        //   console.log('test:: ', test);
        // } catch (error) {
        //   console.error('Erro ao obter latitude e longitude:', error);
        // }

        try {
          this.imagemEstabelecimento = require(`./images/${this.$route.params.id}.${formatoFoto}`);
        } catch (error) {
          console.log('Erro ao exibir imagem do estabelecimento');
        }
        
        try {
          for (let i=0; i < dadosRecomendacao.length; i++) {
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

        for (let i=0; i < dadosRedesSociais.length; i++) {
          switch (dadosRedesSociais[i].id) {
            case 1:
              this.facebook = dadosRedesSociais[i].redeSocial;
              break;
            case 2:
              this.instagram = dadosRedesSociais[i].redeSocial;
              break;
            case 3:
              this.twitter = dadosRedesSociais[i].redeSocial;
              break;
            case 4:
              this.site = dadosRedesSociais[i].redeSocial;
              break;
            case 5:
              this.cardapio = dadosRedesSociais[i].redeSocial;
              break;
            default:
              break;
          }
        }

        let todosHorarios = '';
        for (let i=0; i < dadosHorarios.length; ++i) {
          todosHorarios +=`<p>${dadosHorarios[i].diaSemana}: ${formatarHorario(dadosHorarios[i].horarioInicio)}h - ${formatarHorario(dadosHorarios[i].horarioFim)}h</p>`;
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
        avaliar() {
            // Pega a avaliação do usuário
            const avaliacao = document.getElementById("user-review").value;

            // teste de saida:
            console.log(`Nota: ${this.nota}`);
            console.log(`Avaliação: ${avaliacao}`);
            console.log(`Favoritar: ${this.favorito}`);
            this.limpa_Avaliacao();
        },
        limpa_Avaliacao() {
          this.nota = 0; // Define a nota como 0
          this.$refs.userReview.value = ""; // Limpa o campo de avaliação
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
    },
    computed:{
      userType() {
      return sessionStorage.getItem("tipoUsuario");
    },
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

.imagem-estabelecimento {
  width: 600px;
  height: 500px;
  object-fit: cover; 
  border-radius: 15px; 
}

header h1 {
    margin: 0;
    color: #ff9800;
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
    background-color: #f0f0f0a9;
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
  color: #fff;
}

.recomendacao {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #f0f0f0a9;
    margin: 0 10px;
    text-align: center;
    border-radius: 25px;
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
    background-color: #f0f0f0a9;
    margin: 0 10px;
    border-radius: 25px
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
    background-color: #f0f0f0a9;
    margin: 0 10px;
    border-radius: 25px
}

/* Estilos da seção de avaliação do usuário */
.user-avaliacao {
    padding: 20px;
    background-color: #f0f0f0a9;
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
    background-color: #f0f0f0a9;
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
    font-size: 26px; /* Tamanho da fonte desejado para a estrela */
    cursor: pointer;
    transition: color 0.2s; /* Transição suave de cor ao passar o mouse */
}

.star-icon.selected  {
    color: yellow;
}

/* Estilos seção de avaliação do estabelecimento*/

.avaliacao-estabelecimento{
    padding: 20px;
    background-color: #f0f0f0a9;
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
      color: yellow;
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


</style>