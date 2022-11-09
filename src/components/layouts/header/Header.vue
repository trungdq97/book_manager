<template>
  <v-app-bar app clipped-left>
    <v-app-bar-nav-icon
      v-if="isAuth"
      @click.stop="$emit('drawer', !drawer)"
    ></v-app-bar-nav-icon>
    <v-toolbar-title>Book Manager</v-toolbar-title>
  </v-app-bar>
</template>

<script>
export default {
  name: 'Header',
  emits: ["drawer"],
  props: {
    isAuth: {
      type: Boolean,
      default: () => false
    }
  },
  data() {
    return {
      drawer: null
    };
  },
}
</script>
