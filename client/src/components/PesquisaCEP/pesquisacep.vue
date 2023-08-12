<template>

<div >
  <label class="label">Cep:
    <input v-model="cep" class="input" type="text" id="cep" size="10" maxlength="9" @blur="pesquisarCEP" />
  </label><br />
  <label>Rua:
    <input v-model="logradouro" type="text" id="rua" size="60" />
  </label><br />
  <label>Número:
    <input v-model="numero" type="text"  size="60" />
  </label><br />
  <label>Bairro:
    <input v-model="bairro" type="text" id="bairro" size="40" />
  </label><br />
  <label>Cidade:
    <input v-model="cidade" type="text" id="cidade" size="40" />
  </label><br />
  <label>Estado:
    <input v-model="uf" type="text" id="uf" size="2" />
  </label><br />
</div>


</template>

<script>
export default {
  data() {
    return {
      cep: '',
      logradouro: '',
      bairro: '',
      cidade: '',
      uf: ''
    };
  },
  methods: {
    limparFormulario() {
      this.logradouro = '';
      this.bairro = '';
      this.cidade = '';
      this.uf = '';
    },
    meuCallback(conteudo) {
      if (!("erro" in conteudo)) {
        this.logradouro = conteudo.logradouro;
        this.bairro = conteudo.bairro;
        this.cidade = conteudo.localidade;
        this.uf = conteudo.uf;
      } else {
        this.limparFormulario();
        alert("CEP não encontrado.");
      }
    },
    pesquisarCEP() {
      const cep = this.cep.replace(/\D/g, '');

      if (cep !== "") {
        const validacep = /^[0-9]{8}$/;

        if (validacep.test(cep)) {
          this.limparFormulario();

          const script = document.createElement('script');
          script.src = `https://viacep.com.br/ws/${cep}/json/?callback=meuCallback`;
          document.body.appendChild(script);
          window.meuCallback = this.meuCallback;
        } else {
          this.limparFormulario();
          alert("Formato de CEP inválido.");
        }
      } else {
        this.limparFormulario();
      }
    }
  }
};
</script>

<style scoped>
  label,
  input {
    width: 100%;
    color: #000;
    display: block;
     box-sizing: border-box;
  }


 input {
    border: none;
    padding: 15px 100px;
    border-radius: 25px;
    background: rgba(211, 201, 201, 0.774);
  }

label {
    text-transform: uppercase;
  }

label {
    color: #fff;
    font-size: 16px;
  }
</style>