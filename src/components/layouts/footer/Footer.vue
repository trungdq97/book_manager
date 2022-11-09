<template>
  <v-footer app>
      <span>Copyright © {{ year }} GWANG JUN GROUP. All Rights Reserved.
      </span>
  </v-footer>
</template>

<script>
export default {
  name: 'Footer',
  data() {
    return {
      year: new Date().getFullYear()
    };
  },
}
</script>

<style scoped>

</style>
