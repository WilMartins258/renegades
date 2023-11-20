<template>
	<form action="#" @submit.prevent="submit" class="sign-up-htm" autocomplete="off" >
		<div class="group">
			<ComponentMessage v-if="mostrarMensagem" :title="tituloMsg" :message="mensagemPUser" @close="fecharMensagem" />
			<label for="sign-up-name" class="label">Nome
				<InfoPopup>	<span class="popup">Digite o seu nome completo no campo</span></InfoPopup>
			</label>
			<input id="sign-up-name" type="text" class="input" v-model="Nome" :class="{ 'error': !isNomeValido }">
			<span v-if="!isNomeValido" class="error-message">{{ nomeErro }}</span>
		</div>

		<div class="group">
			<label for="sign-up-user" class="label">E-mail
				<InfoPopup>	<span class="popup">Insira o seu endereço de email.</span></InfoPopup>
			</label>
			<input id="sign-up-user" type="text" class="input" v-model="Email" :class="{ 'error': !isEmailValido }">
			<span v-if="!isEmailValido" class="error-message">{{ emailErro }}</span>
		</div>

		<div class="group">
			<label for="sign-up-pass1" class="label">Senha
				<InfoPopup>	<span class="popup">Evite usar informações pessoais óbvias, como seu nome, data de nascimento ou sequências numéricas simples, como "123456.".</span></InfoPopup>
			</label>
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
			<label for="tab-1" @click="chamaLogin">Já é Membro?</label>
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
		ComponentMessage,
  },
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
			senhasIguaisErro: '',
			mostrarMensagem: false,
			tituloMsg: '',
			mensagemPUser: '',
		}
	},
	methods: {
		async submit() {
			if (this.validarCampos()) {
				this.$emit('do-sign-up', { ...this.$data });
				this.ocultarMensagemErro();
				try {
					const informacoesDoUsuario = {
						nome: this.Nome,
						email: this.Email,
						senha: this.Senha1
					};
					const usuarioCriado = await api.post('/usuario', informacoesDoUsuario);

					sessionStorage.setItem('idUsuario', usuarioCriado.data.id);
					sessionStorage.setItem('nomeUsuario', usuarioCriado.data.nome);
					sessionStorage.setItem('tipoUsuario', usuarioCriado.data.tipoUsuario);
					this.mostrarmensagemPUser();
					
				} catch (error) {
					this.mostrarmensagemError(error.response.data.msg);
				}
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
		ocultarMensagemErro() {
			setTimeout(() => {
				this.mostrarMensagemErro = false;
			}, 5000);
		},
		limparCampos() {
			this.Nome = '';
			this.Email = '';
			this.Senha1 = '';
			this.Senha2 = '';
			this.isNomeValido = true;
			this.isEmailValido = true;
			this.isSenhaValida = true;
			this.isSenhasIguais = true;
			this.nomeErro = '';
			this.emailErro = '';
			this.senhaErro = '';
			this.senhasIguaisErro = '';
		},
		chamaLogin() {
        window.location.reload();
    },
    mostrarmensagemPUser() {
		this.tituloMsg = "Seja Bem Vindo!";
		this.mensagemPUser = "Seu cadastro foi concluído com êxito. Agora, estamos redirecionando você para a página inicial.";
		this.mostrarMensagem = true;
    },

	mostrarmensagemError(msg) {
		this.tituloMsg = "Erro"
		this.mensagemPUser = msg
		this.mostrarMensagem = true;
    },
	
    fecharMensagem() {
      this.mostrarMensagem = false;
	  if(sessionStorage.getItem('idUsuario')){
			sessionStorage.setItem('atualizarHome', 1);
			this.$router.push({ name: 'home', query: {  logged: 'true' }});
		}
	  
    },
	},
}
</script>

<style>
.error-message {
	color: orange;
	font-size: 15px;
}

.popup{
	font-size: 9px; 
}
</style>
