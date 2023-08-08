<template>
  <div id="anuncio" class="form">
    <br /><h2>Crie um Anúncio</h2>
    <div class="posicaoAnuncio">
      <div class="group">
        <label for="nome" class="label">Nome do Anúncio:</label><br />
        <input
          type="text"
          id="nome"
          class="input"
          name="nome"
          required
        /><br /><br />
      </div>

      <div class="group">
        <label for="descricao" class="label">Descrição do Anúncio:</label><br />
        <textarea
          id="descricao"
          class="input"
          name="descricao"
          rows="4"
          maxlength="200"
          required
        ></textarea>
        <br />
        <span id="contador">0</span>/<span>200</span><br /><br />
      </div>

      <div class="group">
        <label for="tipo" class="label">Tipo do Anúncio:</label><br />
        <input
          type="radio"
          id="doacao"
          name="tipo"
          value="doacao"
          required
          checked
        />
        <label for="doacao">Doação</label><br />
        <input type="radio" id="troca" name="tipo" value="troca" required />
        <label for="troca">Troca</label><br /><br />
      </div>

      <div class="group">
        <label for="categoria" class="label">Categoria do Anúncio:</label><br />
        <select id="categoria" class="input" name="categoria" required>
          <option value="brinquedo">Brinquedo</option>
          <option value="roupa">Roupa</option>
          <option value="alimento">Alimento</option>
          <option value="carrinho">Carrinho de Bebê</option>
        </select><br /><br />
      </div>

      <div class="group">
        <label for="imagens" class="label">Imagens (Max. 4):</label><br />
        <input
          type="file"
          id="imagens"
          name="imagens[]"
          accept="image/jpeg, image/gif, image/png, image/tiff, image/bmp"
          multiple
        /><br /><br />

        <div id="miniatura-container">
          <div
            v-for="(imagem, index) in imagensSelecionadas"
            :key="index"
            class="miniatura"
          >
            <img :src="imagem.src" alt="Imagem" />
            <button class="excluir" @click="excluirMiniatura(index)">
              <i class="uil uil-times"></i>
            </button>
          </div>
        </div>
        <br /><br />
      </div>

      <div class="group">

        <div>
    <input type="button" class="button" value="Salvar" />
    <input type="button" class="button" value="Cancelar" @click="cancelar"  />
  </div>
        

        <div>
          />
       </div>
      </div>
    </div>
  </div>


</template>

<script>
export default {
  name: "AddEstabelecimento",
  data() {
    return {
      imagensSelecionadas: [], // Lista de imagens selecionadas
    };
  },
  methods: {
    excluirMiniatura(index) {
      this.imagensSelecionadas.splice(index, 1);
    },
    cancelar() {
      this.$router.push('/Anuncio');
    },
  },
  mounted() {
    const imagensInput = document.getElementById("imagens");

    imagensInput.addEventListener("change", () => {
      const files = Array.from(imagensInput.files);
      const imagensRestantes = 4 - this.imagensSelecionadas.length;
      const novasImagens = files.slice(0, imagensRestantes);

      novasImagens.forEach((file) => {
        const reader = new FileReader();

        reader.onload = () => {
          const miniatura = { src: reader.result };
          this.imagensSelecionadas.push(miniatura);
        };

        reader.readAsDataURL(file);
      });

      imagensInput.value = "";
    });
  },
};
</script>

<style scoped>
#anuncio {
  width: 100%;
  margin: auto;
  max-width: 525px;
  min-height: 1010px;
  position: relative;
  
  background: url(https://centroevolvere.com.br/wp-content/uploads/2020/08/22.png)
    no-repeat center;
  background-color: #c9beebe1;
  box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.posicaoAnuncio {
  width: 100%;
  height: 100%;
  position: absolute;
  padding: 50px 70px 50px 70px;
  flex-wrap: wrap;
}

h2 {
  text-align: center;
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

.form .group .label,
.form .group .input {
  width: 100%;
  color: #000;
  display: block;
}

.group .button,
.group .input {
  border: none;
  padding: 15px 100px;
  border-radius: 25px;
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

#anuncio .group .label {
  color: #000000;
  font-size: 16px;
}

#anuncio .group .button {
  background: #8d72e1;
  cursor: pointer;
  transition: 0.5s;
}

#anuncio .group .button:hover {
  background: #51389d;
}

.miniatura {
  display: inline-block;
  position: relative;
  margin-right: 10px;
}

.miniatura img {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border: 3px solid #000000;
}

.miniatura .excluir {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: white;
  border: none;
  color: red;
  font-weight: bold;
  cursor: pointer;
}

.button {
  margin-right: 10px;
}

/* Responsividade */

@media (max-width: 1160px) {
  #anuncio {
    max-width: 950px;
  }
}

@media (max-width: 950px) {
  #anuncio {
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

  .miniatura {
    margin-bottom: 10px;
  }
}
</style>
