<template>
  <v-navigation-drawer app clipped v-if="isAuth && drawer">
    <v-list dense>
      <v-list-item
          v-for="(item, index) in items"
          :key="index"
          link
          :to="item.link">
        <v-list-item-action>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: 'Navbar',
  props: {
    isAuth: {
      type: Boolean,
      default: () => false
    },
    drawer: {
      type: Boolean,
      default: () => true
    }
  },
  data() {
    return {
      items: [
        {
          link: "books",
          icon: "mdi-view-dashboard",
          title: "Books"
        },
        {
          link: "users",
          icon: "mdi-account",
          title: "Users"
        },
        {
          link: "#",
          icon: "mdi-cog",
          title: "Settings"
        },
        {
          link: "#",
          icon: "mdi-exit-to-app",
          title: "Logout"
        }
      ]
    };
  },
}
</script>
