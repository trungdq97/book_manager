<template>
<v-row justify="center">
  <v-col cols="12">
 <v-data-table
    :headers="headers"
    :items="users"
    class="elevation-4"
    :search="search"
  >
    <template v-slot:item.role="{ item }">
      <v-card-text v-if="item.role === 1">Manager</v-card-text>
      <v-card-text v-else>User</v-card-text>
    </template>
   <template v-slot:item.department_id="{ item }">
      <v-card-text v-if="item.department_id === 1">DIVISION 1</v-card-text>
      <v-card-text v-else>DIVISION 2</v-card-text>
    </template>

    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Users</v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
         <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
      <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="attrs"
              v-on="on"
            >+</v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.username"  label="User Name" autofocus required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.role"  label="Role" required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.email" label="Email" required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.password" label="Password" required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.department_id" label="Department" required></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
              <v-btn color="blue darken-1" text >Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-icon
        small
        class="mr-2"
        @click="editItem(item)"
      >
        mdi-pencil
      </v-icon>
      <v-icon
        small
      >
        mdi-delete
      </v-icon>
    </template>
  </v-data-table>
  </v-col>
</v-row>

</template>

<script>

export default {
  name: "Project",
  data: () => ({
    dialog: false,
    search: '',
    editedIndex: -1,
    headers: [
      { text: 'ID', align: 'start', value: 'id'},
      { text: 'User Name', value: 'username' },
      { text: 'Role', value: 'role' },
      { text: 'Email', value: 'email' },
      { text: 'Password', value: 'password' },
      { text: 'Department', value: 'department_id' },
      { text: 'Date', value: 'created_at' },
      { text: 'Actions', value: 'actions' }
    ],
    editedItem: {
      username: "",
      role: 1,
      email: "",
      password: "",
      department_id: null
    },
    defaultItem: {
      username: "",
      role: 1,
      email: "",
      password: "",
      department_id: null
    },
    users: [
      {
        id: "B0001",
        username: "Đào Quang Trung",
        role: 1,
        email: "trungdq@miichisoft.com",
        password: "aA@12345",
        department_id: 1,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: "B0002",
        username: "Hoàng Văn Tuấn",
        role: 1,
        email: "tuanhv@miichisoft.com",
        password: "aA@12345",
        department_id: 1,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: "B0003",
        username: "Khương Văn Thạo",
        role: 1,
        email: "thaokv@miichisoft.net",
        password: "aA@12345",
        department_id: 1,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: "B0004",
        username: "Phạm Ngọc Huy",
        role: 2,
        email: "huypn@miichisoft.com",
        password: "aA@12345",
        department_id: 2,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: "B0005",
        username: "Dương Ngọc Thúy",
        role: 2,
        email: "thuydn@miichisoft.com",
        password: "aA@12345",
        department_id: 1,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      }
    ],
  }),

  computed: {
    formTitle () {
      return this.editedIndex === -1 ? 'New User' : 'Edit User'
    },
  },

  watch: {
    dialog (val) {
      val || this.close()
    }
  },

  methods: {

    editItem (item) {
      this.editedIndex = this.users.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialog = true
      console.log(111, this.editedIndex, this.editedItem, this.dialog);
    },

    close () {
      this.dialog = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },
  }
};
</script>

<style scoped></style>
