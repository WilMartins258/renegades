<template>
  <h1>Minhas Avaliações</h1>
  <section class="user-avaliacao">
    <div v-for="(avaliacao, index) in visibleAvaliacao" :key="index" class="avaliacao-box">
      <fieldset>
        <label class="titulo">{{ avaliacao.nome }} Avaliado em: {{ avaliacao.data }}</label><br><br>
        <label for="avaliacao">Nota:</label>
        <div class="rating">
          <span v-for="star in 5" :key="star" class="star" :class="{ 'selected': avaliacao.nota >= star }"
            :style="{ pointerEvents: editingIndex === index ? 'auto' : 'none' }" @click="selecionarNota(avaliacao, star)">
            &#9733;
          </span>
        </div>
        <br />
        <label for="user-review">Sua avaliação:</label>
        <div class="group">
          <textarea id="user-review" class="input" name="user-review" rows="4" cols="50" v-model="avaliacao.descricao"
            :disabled="editingIndex !== index"></textarea>
          <br />
          <div class="Posittion-button">
            <button class="button" @click="editReview(index)" v-if="editingIndex !== index">
              <i class="uil uil-edit"></i>
            </button>
            <template v-else>
              <button class="button" @click="saveReview(index)">
                <i class="uil uil-check"></i>
              </button>
              <button class="button" @click="cancelEdit(index)">
                <i class="uil uil-times"></i>
              </button>
            </template>
          </div>
        </div>
      </fieldset>
      <br />
    </div>
  </section>
  <div class="group">
    <div class="Posittion-button">
      <button v-if="numToShow < avaliacao.length" @click="showMoreFields" class="button">Mostrar mais</button>
    </div>
  </div>
</template>

<script>
import api from './../../services/backend.service.js';

export default {
  name: "MinhasAvaliacoes",
  data() {
    return {
      avaliacao: [], // Array de avaliações
      visibleAvaliacao: [], // Array para as avaliações visíveis
      numToShow: 4, // Número inicial de avaliações para mostrar
      editingIndex: -1, // Índice da avaliação em edição (-1 avaliação está sendo editada)
    };
  },
  created() {
    this.metodoInicial();
  },
  methods: {
    async metodoInicial() {
      try {
        const avaliacoes = await api.get(`/avaliacao/${sessionStorage.getItem('idUsuario')}`);

        this.avaliacao = avaliacoes.data;
        this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow); // exibe as 4 primeiras avaliações
      } catch (error) {
        console.error('Erro ao buscar avaliações do usuário:: ', error);
      }
    },
    showMoreFields() {
      // exibe mais 4 campos
      this.numToShow += 4;
      this.updateVisibleAvaliacao(); // Chama a função para atualizar a exibição
    },
    editReview(index) {
      // Inicia a edição da avaliação
      this.editingIndex = index;
    },
    saveReview(index) {
      // Salva as edições e encerra a edição
      this.editingIndex = -1;
      this.updateVisibleAvaliacao(); // Chama a função para atualizar a exibição após salvar
    },
    cancelEdit(index) {
      // Cancela a edição
      this.editingIndex = -1;
    },
    selecionarNota(avaliacao, notaSelecionada) {
      // Atualiza o valor de nota na avaliação
      avaliacao.nota = notaSelecionada;
    },
    updateVisibleAvaliacao() {
      // Atualiza o array de avaliações visíveis com base em numToShow
      this.visibleAvaliacao = this.avaliacao.slice(0, this.numToShow);
    },
  },
};
</script>

<style scoped>
h1 {
  color: #fff;
}

.user-avaliacao {
  padding: 20px;

}

/* Estilos das Estrelas seção de avaliação do usuário*/
.rating {
  font-size: 20px;
}


.star {
  cursor: pointer;
  color: gray;
  transition: color 0.2s;
  /* Transição suave de cor ao passar o mouse */
}

.star.selected {
  color: yellow;
}

.group .button,
.group .input {
  border: none;
  padding: 15px 20px;
  border-radius: 25px;
  background: rgba(211, 201, 201, 0.774);
}

.group .button {
  text-transform: uppercase;
}

.group .label,
.group .input {
  width: 95%;
  color: #000;
  display: block;
  margin: 0 auto;
}

.group .button {
  background: #e91e2f;
  cursor: pointer;
  transition: 0.5s;
  color: #fff;
}

.group .button:hover {
  background: #ff9800;
}

.Posittion-button {
  display: flex;
  justify-content: center;
  /* Centraliza horizontalmente */
  align-items: center;
  /* Centraliza verticalmente */
}

.group .button+.button {
  margin-left: 10px;
  /* Ajuste a margem esquerda conforme necessário */
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

/* Estilos para telas com largura menor ou igual a 414px (exemplo: iPhone 5/SE) */
@media (max-width: 414px) {
  .avaliacao-box {
    padding: 10px;
    /* Reduza o padding para economizar espaço */
  }

  .group .button {
    font-size: 14px;
    /* Reduza o tamanho do texto dos botões */
  }

  .star {
    font-size: 18px;
    /* Reduza o tamanho das estrelas */
  }
}

/* Responsivo*/
@media (max-width: 360px) {
  .avaliacao-box {
    padding: 5px;
    /* Reduza ainda mais o padding para economizar espaço */
  }

  legend {
    font-size: 10px;
  }

  .group .button {
    font-size: 12px;
    /* Reduza ainda mais o tamanho do texto dos botões */
  }

  .star {
    font-size: 16px;
    /* Reduza ainda mais o tamanho das estrelas */
  }

  legend {
    font-size: 15px;
  }
}
</style>
