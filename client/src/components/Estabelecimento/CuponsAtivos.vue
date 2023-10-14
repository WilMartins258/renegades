<template>
    <link href="https://fonts.googleapis.com/css?family=Cabin|Indie+Flower|Inknut+Antiqua|Lora|Ravi+Prakash" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"  />
    
    <div class="container">
    <div class="item" v-for="cupom in cupons" :key="cupom.codigo">
      <div class="right-codigo">
        <h5 >Código</h5>
        <h2 class="codigo">{{ cupom.codigo }}</h2>
        <span class="up-border"></span>
        <span class="down-border"></span>
      </div>
      
      <div class="item-left">
        <p class="event">{{ cupom.nome }}</p>
        <p class="categoria">{{ cupom.categoria.join(', ') }}</p>
        <h2 class="title">{{ cupom.descricao }}</h2>
        
        <div class="sce">
          <div class="icon">
            <i class="fa fa-table"></i>
          </div>
          <p>Promoção Ativa: <br> 
            de {{ cupom.dtInicio }} a {{ cupom.dtFim }}</p>
        </div>
        <div class="fix"></div>
        <div class="loc">
          <div class="icon">
            <i class="fa fa-map-marker"></i>
          </div>
          <p>{{ cupom.endereco }}</p>
        </div>
        <div class="fix"></div>
        <button class="page">Acessar a Página</button>
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


div.container {
  max-width: 1450px;
  margin: 0 auto;
  overflow: hidden
}

.container .item {
  width: 48%;
  padding: 0 20px;
  background: #fff;
  overflow: hidden;
  margin: 10px
  
}
.container .right-codigo, .container .item-left {
  float: left;
  padding: 20px 
}
.container .right-codigo {
  padding: 79px 50px;
  margin-right: 20px;
  width: 25%;
  position: relative;
  height: 286px
}
.container .right-codigo .up-border, .container .right-codigo .down-border {
    padding: 14px 15px;
    background-color: rgba(0,0,0,0.5);;
    border-radius: 50%;
    position: absolute
}
.container .right-codigo .up-border {
  top: -8px;
  right: -35px;
}
.container .right-codigo .down-border {
  bottom: -13px;
  right: -35px;
}
.container .right-codigo .codigo {
  font-size:40px;
  text-align: center;
  color: #111
}
.container .right-codigo .day, .container .item-left .event {
  color: #555;
  font-size: 25px;
  margin-bottom: 9px;
}

.categoria{
    color: #555;
  font-size: 17px;

}
.container .right-codigo .day {
  text-align: center;
  font-size: 25px;
}
.container .item-left {
  width: 71%;
  padding: 34px 0px 19px 46px;
  border-left: 3px dotted #999;
} 
.container .item-left .title {
  color: #111;
  font-size: 34px;
  margin-bottom: 12px
}
.container .item-left .sce {
  margin-top: 5px;
  display: block
}
.container .item-left .sce .icon, .container .item-left .sce p,
.container .item-left .loc .icon, .container .item-left .loc p{
    float: left;
    word-spacing: 5px;
    letter-spacing: 1px;
    color: #888;
    margin-bottom: 10px;
}
.container .item-left .sce .icon, .container .item-left .loc .icon {
  margin-right: 10px;
  font-size: 20px;
  color: #666
}

.container .item-left .loc {
    display: block
}

.fix {clear: both}
.container .item .page{
    color: #fff;
    padding: 6px 14px;
    float: right;
    margin-top: 10px;
    font-size: 18px;
    border: none;
    cursor: pointer
}
.container .item .page {
    background: #777
}


</style>