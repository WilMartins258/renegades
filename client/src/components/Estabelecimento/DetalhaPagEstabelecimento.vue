<template>

<header>
        <h1>Nome do Estabelecimento</h1>
        <p>Pizzaria</p>
        <img src="imagem_do_estabelecimento.jpg" alt="Imagem do Estabelecimento">
        <div class="icons">
            <span class="favorite-icon">Favoritar</span>
            <span class="share-icon">Compartilhar</span>
        </div>
    </header>

    <section class="description">
        <h2>Descrição do Estabelecimento</h2>
        <p>Coloque aqui a descrição do estabelecimento.</p>
    </section>

    <section class="chef-recommendations">
        <!-- Quadros de recomendações do chef -->
        <div class="recommendation">
            <h3>Prato Principal 1</h3>
            <p>Descrição do prato principal 1.</p>
            <img src="imagem_prato1.jpg" alt="Imagem do Prato Principal 1">
        </div>
        <div class="recommendation">
            <h3>Prato Principal 2</h3>
            <p>Descrição do prato principal 2.</p>
            <img src="imagem_prato2.jpg" alt="Imagem do Prato Principal 2">
        </div>
        <div class="recommendation">
            <h3>Prato Principal 3</h3>
            <p>Descrição do prato principal 3.</p>
            <img src="imagem_prato3.jpg" alt="Imagem do Prato Principal 3">
        </div>
    </section>

    <section class="additional-info">
        <!-- Quadros de informações adicionais -->
        <div class="info">
            <h3>O que oferecemos</h3>
            <p>Estacionamento, área kids, etc.</p>
        </div>
        <div class="info">
            <h3>Forma de Contato e Redes Sociais</h3>
            <p>Email: exemplo@example.com<br>Telefone: (XX) XXXX-XXXX<br>Redes Sociais: <a href="#">Facebook</a>, <a href="#">Instagram</a></p>
        </div>
        <div class="info">
            <h3>Horário de Atendimento</h3>
            <p>Segunda a Sexta: 10:00 - 22:00<br>Sábado e Domingo: 12:00 - 23:00</p>
        </div>
    </section>
    
<section class="address-info">
    <div class="address">
    <h2>Endereço</h2>
    <p>Insira aqui o endereço do estabelecimento.</p>
    </div>
    <div class="address">
    <!-- Espaço para exibir o mapa (substitua a URL pelo código do mapa real) -->
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.349676015265!2dSUA-LONGITUDE!3dSUA-LATITUDE!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zSsKwMTcnMzcuNSJTIDQwwrAyMSc1LjciRQ!5e0!3m2!1spt-BR!2sbr!4v1618986094141!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</section>

	
    <section class="user-rating">
        <h2>Avalie</h2>
        <form>
            <label for="rating">Avaliação:</label>
            <input type="number" id="rating" name="rating" min="1" max="5" step="1">
            <br>
            <label for="user-review">Digite sua avaliação:</label>
            <textarea id="user-review" name="user-review" rows="4" cols="50"></textarea>
            <br>
            <input type="submit" value="Validar">
        </form>
    </section>

</template>

<script>
export default {
    name: "DetalhaPagEstabelecimento",

}

</script>

<style scoped>
/* Estilos gerais */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

header {
    text-align: center;
    background-color: #333;
    color: #fff;
    padding: 20px;
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
    
}

/* Estilos das recomendações do chef */
.chef-recommendations {
    display: flex;
    justify-content: space-between;
    padding: 20px;
}

.recommendation {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: rgba(255, 255, 255, 0.788); 
    margin: 0 10px;
    text-align: center;
}


/* Estilos das informações adicionais */
.additional-info {
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
}

.address-info{
    display: flex;
    justify-content: space-between;
    padding: 20px;
}
.address{
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: rgba(255, 255, 255, 0.788); 
    margin: 0 10px;
}


/* Estilos da seção de avaliação do usuário */
.user-rating {
    padding: 20px;
    background-color: #f0f0f0;
    text-align: center;
}

/* Estilos para os botões */
input[type="submit"] {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
}

/* Estilos para links */
a {
    color: #333;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}


</style>