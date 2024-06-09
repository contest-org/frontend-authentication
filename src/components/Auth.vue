<script setup>
const redirectToYandex = () => {
  const clientId = import.meta.env.VITE_APP_CLIENT_ID;
  const redirectUri = import.meta.env.VITE_APP_REDIRECT_URI;
  window.location.href = `https://oauth.yandex.ru/authorize?response_type=token&client_id=${clientId}&redirect_uri=${redirectUri}`;
}
</script>

<template>
  <div>
    <button @click="redirectToYandex">Войти через Яндекс ID</button>
  </div>
</template>

<style scoped>
button {
  background-color: #43D19B;
  color: #FFFFFF;
  :focus {
    border: none;
  }
}
</style>
