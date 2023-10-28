<template>
	<form action="#" @submit.prevent="submit" class="sign-in-htm">
		<ComponentMessage v-if="mostrarMensagem" :title="tituloMsg" :message="mensagemPUser" @close="fecharMensagem" />
		<div class="group">
			<label for="sign-in-user" class="label">Email 
				<InfoPopup>	<span class="popup">Insira o seu endereço de email.</span>
				</InfoPopup>
			</label>
			
			<input id="sign-in-user" type="text" class="input" v-model="Email">
			<span v-if="!validarEmail" class="error">O e-mail é inválido</span>
		</div>
		<div class="group">
			<label for="sign-in-pass" class="label">Senha
				<InfoPopup>	<span class="popup">Insira a senha informada no momento do cadastro.</span></InfoPopup>
			</label>
			<input id="sign-in-pass" type="password" class="input" data-type="password" v-model="Senha">
			<span v-if="!validarSenha" class="error">A senha é obrigatória</span>
		</div>
		<!--<div class="group">
			<input id="check" type="checkbox" class="check" v-model="lembrarUser">
			<label for="check"><span class="icon"></span> Mantenha-me conectado</label>
		</div>-->
		<div class="group">
			<input type="submit" class="button" value="Entrar">
			<!-- onclick={handleLogin} -->
		</div>
		<div class="hr"></div>
		<div class="foot-lnk">
			<a href="#forgot">Esqueceu sua senha?</a>
		</div>
	</form>
</template>

<script>
import api from './../services/backend.service.js';
import InfoPopup from './InfoPopup.vue';
import ComponentMessage from './Message.vue';
export default {
	components: {
		InfoPopup,
		ComponentMessage
  },
	data() {
		return {
			Email: '',
			Senha: '',
			//lembrarUser: true,
			validarEmail: true,
			validarSenha: true,
			mostrarMensagem: false,
			tituloMsg: "",
			mensagemPUser: "",
		}
	},
	methods: {
		validarCampos() {
			this.validarEmail = this.validarFormatoEmail(this.Email);
			this.validarSenha = this.Senha !== '';
			return this.validarEmail && this.validarSenha;
		},
		validarFormatoEmail(email) {
			const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			return re.test(email);
		},
		async submit() {
			try {
				if (this.validarCampos()) {
					this.$emit('do-sign-in', { ...this.$data });
				}

				const email = document.getElementById('sign-in-user');
				const senha = document.getElementById('sign-in-pass');

				const loginInfo = {
					email: email.value,
					senha: senha.value
				};

				if (loginInfo.email && loginInfo.senha) {
					const login = await api.post("/login", loginInfo);

					if (login.data.login) {
						sessionStorage.setItem('idUsuario', login.data.id);
						sessionStorage.setItem('nomeUsuario', login.data.nome);
						sessionStorage.setItem('tipoUsuario', login.data.tipoUsuario);
						sessionStorage.setItem('idEstabelecimento', login.data.idEstabelecimento);
						sessionStorage.setItem('atualizarHome', 1);

						this.$router.push({ name: 'home', query: {  logged: 'true' }});
					}
				}
			} catch (error) {
				this.mostrarmensagemError(error.response.data.msg);
			}
		},
		limparCampos() {
			this.Email = '';
			this.Senha = '';
			this.validarEmail = true;
			this.validarSenha = true;
		},
		mostrarmensagemPUser(msg) {
			this.tituloMsg = "Seja Bem Vindo!"
			this.mensagemPUser = msg
			this.mostrarMensagem = true;
		},

		mostrarmensagemError(msg) {
			this.tituloMsg = "Erro"
			this.mensagemPUser = msg
			this.mostrarMensagem = true;
		},
			
		fecharMensagem() {
			this.mostrarMensagem = false;
		},
	},
}
</script>

<style>
.error {
	color: orange;
	font-size: 15px;
}

.popup{
	font-size: 9px; 
}
</style>
