<template>
  <div class="foreground">
    <Logo />
    <Auth />
  </div>

  <div class="full-screen-background" :style="{ backgroundImage: 'url(' + backgroundImage + ')' }"></div>
</template>

<script setup>
import Logo from './components/Logo.vue';
import Auth from './components/Auth.vue';
import { ref, onMounted, onBeforeUnmount } from "vue";

const backgroundImage = ref('');

const checkScreenWidth = () => {
  const screenWidth = window.innerWidth;

  if (screenWidth >= 768) {
    backgroundImage.value = './public/desktop.jpeg';
  } else {
    backgroundImage.value = './public/mobile.jpg';
  }
};

onMounted(() => {
  checkScreenWidth();
  window.addEventListener('resize', checkScreenWidth);
});

onBeforeUnmount(() => {
  window.removeEventListener('resize', checkScreenWidth);
});
</script>

<style scoped>
.foreground {
  position: relative;
  z-index: 10;
}

.full-screen-background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  z-index: 1;
}
</style>
