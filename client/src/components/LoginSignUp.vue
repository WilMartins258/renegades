<template>
	<form action="#" @submit.prevent="submit" class="sign-up-htm">
		<div class="group">
			<label for="sign-up-name" class="label">Nome</label>
			<input id="sign-up-name" type="text" class="input" v-model="Nome" :class="{ 'error': !isNomeValido }">
			<span v-if="!isNomeValido" class="error-message">{{ nomeErro }}</span>
		</div>

		<div class="group">
			<label for="sign-up-user" class="label">E-mail</label>
			<input id="sign-up-user" type="text" class="input" v-model="Email" :class="{ 'error': !isEmailValido }">
			<span v-if="!isEmailValido" class="error-message">{{ emailErro }}</span>
		</div>

		<div class="group">
			<label for="sign-up-pass1" class="label">Senha</label>
			<input id="sign-up-pass1" type="password" class="input" data-type="password" v-model="Senha1"
				:class="{ 'error': !isSenhaValida }">
			<span v-if="!isSenhaValida" class="error-message">{{ senhaErro }}</span>
		</div>

		<div class="group">
			<label for="sign-up-pass" class="label">Confirme sua senha</label>
			<input id="sign-up-pass" type="password" class="input" data-type="password" v-model="Senha2"
				:class="{ 'error': !isSenhasIguais }">
			<span v-if="!isSenhasIguais" class="error-message">{{ senhasIguaisErro }}</span>
		</div>
		<div class="group">
			<input type="submit" class="button" value="Cadastrar">
		</div>
		<div class="hr"></div>
		<div class="foot-lnk">
			<label for="tab-1">Já é Membro?</label>
		</div>
	</form>
</template>

<script>
export default {
	data() {
		return {
			Nome: '',
			Email: '',
			Senha1: '',
			Senha2: '',
			isNomeValido: true,
			isEmailValido: true,
			isSenhaValida: true,
			isSenhasIguais: true,
			nomeErro: '',
			emailErro: '',
			senhaErro: '',
			senhasIguaisErro: ''
		}
	},


	methods: {
		submit() {
			if (this.validarCampos()) {
				this.$emit('do-sign-up', { ...this.$data });
				this.ocultarMensagemErro();
			}
		},
		validarCampos() {
			this.isNomeValido = this.validarNome();
			this.isEmailValido = this.validarEmail();
			this.isSenhaValida = this.validarSenha();
			this.isSenhasIguais = this.validarSenhasIguais();


			if (!this.isNomeValido) {
				this.nomeErro = 'O nome é obrigatório e deve ter pelo menos 5 caracteres.';
			} else {
				this.nomeErro = '';
			}

			if (!this.isEmailValido) {
				this.emailErro = 'O e-mail não é válido.';
			} else {
				this.emailErro = '';
			}

			if (!this.isSenhaValida) {
				this.senhaErro = 'A senha deve ter pelo menos 6 caracteres.';
			} else {
				this.senhaErro = '';
			}

			if (!this.isSenhasIguais) {
				this.senhasIguaisErro = 'As senhas não coincidem.';
			} else {
				this.senhasIguaisErro = '';
			}

			this.mostrarMensagemErro = !(
			this.isNomeValido &&
			this.isEmailValido &&
			this.isSenhaValida &&
			this.isSenhasIguais
			);	

			return this.isNomeValido && this.isEmailValido && this.isSenhaValida && this.isSenhasIguais;

			
		},
		
		validarNome() {
			return this.Nome.trim() !== '' && this.Nome.length >= 5;
		},
		validarEmail() {
			// Regex para validar o formato de e-mail
			const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			return emailRegex.test(this.Email);
		},
		validarSenha() {
			return this.Senha1.length >= 6; // Verifica se a senha tem pelo menos 6 caracteres
		},
		validarSenhasIguais() {
			return this.Senha1 === this.Senha2;
		},
		
		
	},
	ocultarMensagemErro() {
	setTimeout(() => {
		this.mostrarMensagemErro = false;
	}, 5000);
}
}
</script>

<style>
	.error-message {
	color: red;
	font-size: 12px;
	}
</style>
