<template>
	<form action="#" @submit.prevent="submit" class="sign-in-htm">
		<div class="group">
			<label for="sign-in-user" class="label">Email</label>
			<input id="sign-in-user" type="text" class="input" v-model="Email">
			<span v-if="!validarEmail" class="error">O e-mail é inválido</span>
		</div>
		<div class="group">
			<label for="sign-in-pass" class="label">Senha</label>
			<input id="sign-in-pass" type="password" class="input" data-type="password" v-model="Senha">
			<span v-if="!validarSenha" class="error">A senha é obrigatória</span>
		</div>
		<!--<div class="group">
			<input id="check" type="checkbox" class="check" v-model="keepSignIn">
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
import api from './../services/backend-service.js';

export default {
	data() {
		return {
			Email: '',
			Senha: '',
			keepSignIn: true,
			validarEmail: true,
			validarSenha: true,
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

				console.log('loginInfo', loginInfo);

				if (loginInfo.email && loginInfo.senha) {
					const login = await api.post("/login", loginInfo);
					console.log('login:: ', login);

					if (login.data.login) {
						sessionStorage.setItem('idUsuario', login.data.id);
						sessionStorage.setItem('nomeUsuario', login.data.nome);
						sessionStorage.setItem('tipoUsuario', login.data.tipoUsuario);
						sessionStorage.setItem('fotoperfil', login.data.fotoperfil);


						// A partir daqui precisamos verificar para onde vamos direcionar o usuário após login concluído
					}
				} else {
					console.log('Exibir mensagem para o usuário preencher os campos de e-mail e senha');
				}
			} catch (error) {
				console.error('ERRO:: ', error);
				console.log('error.response.data', error.response.data);
			}
		},
	},
}
</script>

<style>
.error {
	color: red;
	font-size: 12px;
}
</style>
