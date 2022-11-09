<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="10" md="6" lg="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-toolbar-title>Login</v-toolbar-title>
        </v-toolbar>
        <v-card-text>
          <v-form>
            <v-text-field
                label="Login"
                name="login"
                prepend-icon="mdi-account"
                type="text"
                v-model="username"
                placeholder=" "
                @keyup.enter="doLogin"
                autofocus
            ></v-text-field>

            <v-text-field
                id="password"
                label="Password"
                name="password"
                prepend-icon="mdi-lock"
                type="password"
                v-model="password"
                placeholder=" "
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="primary">Login</v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>

export default {
  name: "Login",
  data() {
    return {
      username: '',
      password: ''
    };
  },
  mounted() {
  },
  methods: {
  }

};
</script>

<style scoped></style>
