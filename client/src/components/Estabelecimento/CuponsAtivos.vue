<template>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <div class="container">
      <div class="ticket" v-for="cupom in cupons" :key="cupom.codigo">
        <div class="ticket-left">
            <div class="cut-line-left"></div>
            <p class="text-code">Código:</p><br>
            <p class="code">{{cupom.codigo}}</p>
            <div class="cut-line-left"></div>
        </div>
        <div class= "ticket-right">
            <div class="cut-line"></div>
            <p class="name">{{cupom.nome}}</p><br>
            <p class="category">{{ cupom.categoria.join(', ') }}</p>
            <p class="description">{{ cupom.descricao }}</p><br>
            <p class="icon"> <i class="	fas fa-calendar-alt"></i>Promoção Ativa: de {{ cupom.dtInicio }} a {{ cupom.dtFim }}</p><br>
            <p><i class="fas fa-map-marker-alt"></i> {{ cupom.endereco }}</p>
            <button class="page">Acessar a Página</button>
            <div class="cut-line"></div>
        </div>
    </div>
    </div>
</template>

<script>
    export default {
        name: "CuponsAtivos",
        data(){
            return{
                codigo: "",
                nome: "",
                categoria: [],
                descricao: "",
                dtInicio: "",
                dtFim: "",
                endereco: "",
                cupons: []
            }
        },
        mounted() {
            this.cupons = [
                {
                    codigo: "Seu dia",
                    nome: "Jeff Burg",
                    categoria: ["Hamburgueria", "Pizzaria"],
                    descricao: "Aproveite seu aniversario",
                    dtInicio: "14/10/2023",
                    dtFim: "18/10/2023",
                    endereco: "Nove de julho, 150"
                },
                {
                    codigo: "Seu dia",
                    nome: "teste 2",
                    categoria: ["Hamburgueria", "Pizzaria", "restaurante"],
                    descricao: "Chopp em dobro",
                    dtInicio: "14/10/2023",
                    dtFim: "18/10/2023",
                    endereco: "10 de julho, 300"
                },
            ];
        }
    }
</script>

<style scoped>

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.ticket {
            width: 700px;
            background: #fff;
            border-radius: 25px;
            padding: 20px;
            display: flex;
            position: relative;
            -webkit-mask-image: radial-gradient(circle at 10px, transparent 10px, red 10.5px), radial-gradient(circle at 31px 31px, red 31px, transparent 31.5px);
            -webkit-mask-position: -10px, -31px -31px;
            -webkit-mask-size: 100% 40px, 100%;
            -webkit-mask-composite: source-out, destination-over;
            mask-composite: subtract, add;
            margin-bottom: 20px; 
        }

        .ticket-left {
            border-right: 1px dashed #ccc;
            padding-right: 10px;
            position: relative;
        }

        .ticket-right {
            padding-left: 10px;
            position: relative;
        }

        .text-code {
            font-size: 20px;
            margin-top: 20px;
        }

        .code{
            font-weight: bold;
            writing-mode: vertical-rl; /* Isso define a orientação vertical */
            text-orientation: upright; /* Isso mantém o texto em posição vertical */
            text-transform: uppercase;
        }

        .name {
            font-size: 1.5em;
        }

        .category {
            color: #777;
        }

        .description {
            margin-top: 10px;
        }

        .icon {
            font-size: 1.2em;
            margin-right: 5px;
        }

        .page {
            margin-top: 10px;
            color: #fff;
            padding: 6px 14px;
            float: right;
            margin-top: 10px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            background: #e91e2f;
            border-radius: 25px;
        }

        .page:hover {
            background: #ff9800;
        }


        .cut-line {
            width: 30px;
            height: 20px;
            background: rgb(190, 185, 185);
            border-radius: 25px 25px 0 0;
            position: absolute;
            bottom: -20px;
            left: -15px;
        }

        .cut-line-left {
            width: 30px;
            height: 20px;
            background: rgb(190, 185, 185);
            border-radius: 0 0 25px 25px;
            position: absolute;
            top: -20px;
            left: 65px;
        }


</style>