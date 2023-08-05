<template>
    
    <div class="login-wrap">
	    <div class="login-html">
		    <input id="tab-1" type="radio" value="LoginIn" v-model="navigation" @change="navigate" 
                name="tab" class="sign-in" checked><label for="tab-1" class="tab">Entrar</label>
		    <input id="tab-2" type="radio" value="LoginUp" v-model="navigation" @change="navigate" 
                name="tab" class="sign-up"><label for="tab-2" class="tab">Inscreva-se</label>
		    <div class="login-form">
                <LoginSignIn v-if="navigation === 'LoginIn'" @do-sign-in="doSignIn" ref="login"/>
                <LoginSignUp v-else @do-sign-up="doSignUp" ref="login" @redirect-to-login="redirectToLogin"/>
		    </div>
	    </div>
    </div>

</template>

<script>
    import LoginSignIn from './LoginSignIn.vue'
    import LoginSignUp from './LoginSignUp.vue'

    export default {
        name: "LoginUser",
        components: {
            LoginSignIn,
            LoginSignUp,
        },
        data() {
            return {
                navigation: 'LoginIn'    
            }
        },

        methods: {
            navigate() {
                
            },
            // substituir pelo envio de informações para o BD
            doSignIn(obj) {
                // teste de saída 
                window.console.log(obj)
            },
            doSignUp(obj) {
                // teste de saída 
                window.console.log(obj)
            },
            
        }
    }

</script>


