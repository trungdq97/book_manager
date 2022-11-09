<template>
    <div>
      <!-- navbar -->
      <Navbar
        v-model="drawer"
        :isAuth="isAuth"
        :drawer="drawer"
      />

      <!-- header -->
      <Header
        :isAuth="isAuth"
        @drawer="drawer = !drawer"
      />

      <!-- main -->
      <v-main>
        <v-container fluid>
          <router-view />
        </v-container>
      </v-main>

      <!-- footer -->
      <Footer />
    </div>
</template>

<script>
  import Navbar from "./navbar/Navbar";
  import Header from "./header/Header";
  import Footer from "./footer/Footer";


  export default {
    name: "ManagerLayout",
    components: {
      Navbar,
      Header,
      Footer,
    },
    data() {
      return {
        "isAuth": true,
        drawer: true
      };
    },
  }
</script>

<style scoped>

</style>
