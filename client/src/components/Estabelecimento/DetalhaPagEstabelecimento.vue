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
      <h2>Descrição do Estabelecimento</h2>
      <p>{{ descricao }}</p>
    </section>

    <br><h2>Recomendações do Chef</h2>
    <section class="chef-recomendacoes">
      <div class="recomendacao" v-for="prato in pratosChef" :key="prato.id">
        <h3>{{ prato.nome }}</h3>
        <p>{{ prato.descricao }}</p>
        <img :src="prato.imagem" :alt="'Imagem de ' + prato.nome" class="imagem-prato"/>
      </div>
    </section>

    <section class="adicionais-info">
      <div class="info">
        <h3>O que oferecemos</h3>
        <p>{{ opcional }}</p>
      </div>
      <div class="info">
        <h3>Forma de Contato e Redes Sociais</h3>
        <p>Email: {{ email }}</p>
        <p>Telefone: {{ telefone }}</p>
        <p>Redes Sociais: <a :href="facebook">{{ facebook }}</a>, <a :href="instagram">{{ instagram }}</a>, <a :href="twitter">{{ twitter }}</a></p>
        <p>Nosso site: <a :href="site">{{ site }}</a></p>
        <p>Cardápio Online: <a :href="cardapio">{{ cardapio }}</a></p>
      </div>
      <div class="info">
        <h3>Horário de Atendimento</h3>
        <p>Segunda a Sexta: 10:00 - 22:00</p>
        <p>Sábado e Domingo: 12:00 - 23:00</p>
      </div>
    </section>

    <section class="endereco-info">
      <div class="endereco">
        <h2>Endereço</h2>
        <p>{{  endereco }}</p>
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

    <section class="user-avaliacao">
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
          <textarea id="user-review" class="input" name="user-review" rows="4" cols="50" v-model="avaliacao"></textarea>
          <br />

          <div>
            <input type="button" class="button" value="Avaliar" @click.prevent="avaliar" />
          </div>
        </div>
      </form>
    </section>
  </div>
</template>

<script>
export default {
    name: "DetalhaPagEstabelecimento",
    data() {
        return {
            nota: 0, 
            favorito: false,
            nomeDoEstabeleciment: "",
            categoria: "",
            imagemEstabelecimento: "",
            descricao: "",
            opcional: "",
            email: "",
            telefone: "",
            facebook: "",
            instagram: "",
            twitter: "",
            site: "",
            cardapio: "",
            Endereco: "",
        };
    },
    created() {
      // Acesse o parâmetro 'id' da URL usando this.$route.params.id
      this.id = this.$route.params.id;
      console.log("Id para carregar dados do banco ->",this.id);
    },
    methods: {
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
        toggleFavorito() {
            this.favorito = !this.favorito;
        },
    },
    mounted() {
             
             this.nomeDoEstabelecimento = "Jeff's Burger"; 
             this.categoria = "Hamburgueria"; 
             this.imagemEstabelecimento = "https://www.plakart.com.br/img/galerias/40/0004_19b5c1b5b20643f9fc9045e14cd8ef67.jpeg"; 
             this.descricao = "Big Jeff's Burger está em Sorocaba desde 2015 sempre com grandes conceitos em Hamburguer artesanal";
             this.pratosChef = [
                { id: 1, nome: "Big Jeff's", descricao: "Descrição do Prato 1", imagem: "https://media-cdn.tripadvisor.com/media/photo-s/15/35/5b/64/20180904-221944-largejpg.jpg" },
                { id: 2, nome: "Picanha Jeff's", descricao: "Descrição do Prato 2", imagem: "https://www.guiaponto.com.br/fotos/fotos/c583037d236eaabd4bf1db9d64437594.png" },
                { id: 2, nome: "Picanha Jeff's", descricao: "Descrição do Prato 2", imagem: "https://www.guiaponto.com.br/fotos/fotos/c583037d236eaabd4bf1db9d64437594.png" },
            ];
             this.opcional = ["Area Kids", "Estacionamento", "Wifi"].join(', ');
             this.email = "@teste"; 
             this.telefone = "1533325151"; 
             this.facebook = "@facebook"; 
             this.instagram = "@instagram"; 
             this.twitter = "@twitter"; 
             this.site = "WWW"; 
             this.cardapio = ""; 
             this.endereco = "meu end.";
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
    color: #fff;
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
    background-color: #f0f0f0;
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
    background-color: rgba(255, 255, 255, 0.788); 
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
    background-color: rgba(255, 255, 255, 0.788); 
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
    background-color: rgba(255, 255, 255, 0.788); 
    margin: 0 10px;
    border-radius: 25px
}

/* Estilos da seção de avaliação do usuário */
.user-avaliacao {
    padding: 20px;
    background-color: #f0f0f0;
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
    background-color: #f0f0f0;
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

</style>