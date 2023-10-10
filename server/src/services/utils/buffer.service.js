// Essa função transforma um buffer no formato JSON que vem das requisições em buffers válidos interpretados pelo Node
const transformarBufferEmValido = async (objetoBuffer) => {
    try {
        const valoresBuffer = Object.values(objetoBuffer);
        return Buffer.from(valoresBuffer);
    } catch (error) {
        
    }
};

module.exports = {
    transformarBufferEmValido
} 