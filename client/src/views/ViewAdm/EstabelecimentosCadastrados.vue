<template>
    <div class="main-container">
        <ListaEstabelecimento />
    </div>
</template>

<script>
import ListaEstabelecimento from "../../components/Adm/ListaEstabelecimento.vue";

    export default{
        name: "EstebelecimentosCadastrados",
        components:{
            ListaEstabelecimento
        }
    }
</script>