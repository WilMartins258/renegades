<template>
    <div class="main-container">
        <ListaUsuarios />
    </div>
</template>

<script>
import ListaUsuarios from "../../components/Adm/ListaUsuarios.vue";

    export default{
        name: "UsuariosCadastrados",
        components:{
            ListaUsuarios
        }
    }
</script>