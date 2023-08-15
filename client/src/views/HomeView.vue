<template>
  <div class="main-container">
    <div>
    <div v-if="currentStep === 1">
      <!-- Seção 1: Endereço -->
      <h2>Seção 1: Endereço</h2>
      <!-- Inputs do endereço -->
      <input v-model="address.street" placeholder="Rua">
      <input v-model="address.city" placeholder="Cidade">
      <button @click="nextStep">Próximo</button>
    </div>

    <div v-else-if="currentStep === 2">
      <!-- Seção 2: Contatos -->
      <h2>Seção 2: Contatos</h2>
      <!-- Inputs de contatos -->
      <input v-model="contacts.email" placeholder="Email">
      <input v-model="contacts.phone" placeholder="Telefone">
      <button @click="prevStep">Anterior</button>
      <button @click="nextStep">Próximo</button>
    </div>

    <div v-else-if="currentStep === 3">
      <!-- Seção 3: Dados Pessoais -->
      <h2>Seção 3: Dados Pessoais</h2>
      <!-- Inputs de dados pessoais -->
      <input v-model="personalData.name" placeholder="Nome">
      <input v-model="personalData.age" placeholder="Idade">
      <button @click="prevStep">Anterior</button>
      <button @click="nextStep">Próximo</button>
    </div>

    <div v-else>
      <!-- Seção 4: Definido -->
      <h2>Seção 4: Definido</h2>
      <!-- Conteúdo da seção 4 -->
      <button @click="prevStep">Anterior</button>
      <button @click="saveForm">Salvar</button>
      <button @click="cancelForm">Cancelar</button>
    </div>
  </div>
  </div>
</template>

<script>
  export default {
  data() {
    return {
      currentStep: 1,
      address: {
        street: '',
        city: ''
      },
      contacts: {
        email: '',
        phone: ''
      },
      personalData: {
        name: '',
        age: ''
      }
    };
  },
  methods: {
    nextStep() {
      if (this.currentStep < 4) {
        this.currentStep++;
      }
    },
    prevStep() {
      if (this.currentStep > 1) {
        this.currentStep--;
      }
    },
    saveForm() {
      // Lógica para salvar os dados do formulário
    },
    cancelForm() {
      // Lógica para cancelar o formulário
    }
  }
};
</script>

<style scoped>
h1{
  color: #fff;
}

</style>