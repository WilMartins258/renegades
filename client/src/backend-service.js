import axios from "axios";

// Ao mater o localhost:PORTA vai direcionar as requisições para o ambiente local
const baseURL = "http://localhost:3001/";

// Ao comentar a linha acima e descomentar a linha abaixo trocando "MEU_IP_PUBLICO" pelo IP desejado irá direcionar as requisições para este IP
// const baseURL = "http://MEU_IP_PUBLICO:3001/";

const api = axios.create({
  baseURL
});

export default api;
