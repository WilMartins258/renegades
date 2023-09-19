<template>
    <div class="main-container">
        <h1>Quem Somos!!</h1>

        <fieldset>
            <legend>Introdução</legend>
            <br>
            <p>Bem-vindo ao nosso projeto de graduação! Somos uma equipe de estudantes universitários da área de tecnologia. Nossa jornada acadêmica nos conduziu a este projeto e estamos entusiasmados em compartilhar nossa visão e conquistas com você.</p>
            <br>
        </fieldset>

        <fieldset>
            <legend>Equipe Renegades:</legend>
            <br>
            <ul>
                <li><span class="typing-effect">Julio Cesar de Castro</span></li><br>
                <li><span class="typing-effect">Lucas Maximiano dos Santos</span></li><br>
                <li><span class="typing-effect">Willian Martins</span></li><br>
            </ul>
        </fieldset>

        <fieldset>
            <legend>Nossa Missão:</legend>
            <br>
            <p>Nosso objetivo é apoiar pequenos estabelecimentos gastronômicos e fortalecer os laços com a comunidade. Nossa plataforma simplifica a busca por esses locais próximos à sua localização, proporcionando uma experiência gastronômica excepcional. Nossa visão é promover conexões sólidas entre os pequenos estabelecimentos locais e a comunidade, criando oportunidades para o crescimento dos negócios locais e proporcionando uma experiência enriquecedora para os usuários.</p>
            <br>
        </fieldset>

        <fieldset>
            <legend>Nossa Experiência:</legend>
            <br>
            <p>Ao longo de nossa jornada acadêmica, adquirimos conhecimentos em linguagens de programação, desenvolvimento web, bancos de dados, engenharia de software e gestão de projetos, entre outros. Essas habilidades nos capacitaram a enfrentar os desafios deste projeto com confiança e determinação.</p>
            <br>
        </fieldset>

        <fieldset>
            <legend>Conclusão:</legend>
            <br>
            <p>Agradecemos por visitar nosso site e por seu interesse em nosso projeto de graduação.</p>
            <br>
        </fieldset>

    </div>
</template>

<script>
    export default{
        name: "Sobre",
    }
</script>

<style scoped>
    h1{
        color: #fff;
    }

    fieldset {
        border: 2px solid #ff9800;
        border-radius: 20px;
        padding: 10px;
        margin-bottom: 20px;
        background-color: rgba(255, 255, 255, 0.678); 
        box-shadow: 4px 4px 4px #e91e2f, 4px 4px 4px ;
    }

    legend {
        font-weight: bold;
        color: #f50000;
        font-size: 25px;
    }

    ul {
        list-style: none;
        padding: 0; 
        font-weight: bold;
        font-size: 23px;
    }
    p {
        text-indent: 20px; 
        text-align: justify;
        font-size: 20px;
    }
</style>
