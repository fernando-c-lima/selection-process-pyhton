<script setup>
import './assets/styles.css';
</script>

<template>
  <div class="container">
    <h1>Busca de Operadoras</h1>
    <input v-model="query" @keyup.enter="buscar" placeholder="Digite sua pesquisa..." />
    <button @click="buscar">Buscar</button>

    <div v-if="resultados.length">
      <h2>Resultados:</h2>
      <ul>
  <li v-for="(item, index) in resultados" :key="index">
    <div v-for="(value, key) in item" :key="key">
      <strong>{{ key }}:</strong> {{ value }}<br>
    </div>
  </li>
</ul>

    </div>
    <p v-if="erro" class="erro">{{ erro }}</p>

  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      query: "",
      resultados: [],
      erro: "",
    };
  },
  methods: {
    async buscar() {
      this.erro = "";
      this.resultados = [];

      if (!this.query.trim()) {
        this.erro = "Por favor, digite um termo para buscar.";
        return;
      }

     try {
  const response = await axios.get(`http://127.0.0.1:5000/search?q=${this.query}`);
  this.resultados = response.data;
} catch (error) {
  this.erro = "Erro ao buscar os dados: " + error.message;
}
    },
  },
};
</script>
