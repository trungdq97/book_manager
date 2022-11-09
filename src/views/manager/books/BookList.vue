<template>
<v-row justify="center">
  <v-col cols="12">
 <v-data-table
    :headers="headers"
    :items="books"
    class="elevation-4"
    :search="search"
  >
    <template v-slot:item.type="{ item }">
          <v-icon v-if="item.type" color="green">mdi-check-circle</v-icon>
           <v-icon v-else color="red">mdi-close-circle</v-icon>
    </template>
    <template v-slot:item.status="{ item }">
          <v-icon v-if="item.status" color="green">mdi-check-circle</v-icon>
           <v-icon v-else color="red">mdi-close-circle</v-icon>
    </template>

    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Booking</v-toolbar-title>
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
                    <v-text-field v-model="editedItem.book_id"  label="ID" autofocus required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.book_name"  label="Book Name" required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.author" label="Author" required></v-text-field>
                  </v-col>
                  <v-col cols="6" md="6">
                    <v-checkbox v-model="editedItem.type" label="Type" ></v-checkbox>
                  </v-col>
                  <v-col cols="6" md="6">
                    <v-checkbox v-model="editedItem.status" label="Status" ></v-checkbox>
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
      { text: 'ID', align: 'start', value: 'book_id'},
      { text: 'Book Name', value: 'book_name' },
      { text: 'Author', value: 'author' },
      { text: 'Type', value: 'type' },
      { text: 'Status', value: 'status' },
      { text: 'Date', value: 'created_at' },
      { text: 'Actions', value: 'actions' }
    ],
    editedItem: {
      book_id: "",
      book_name: "",
      author: "",
      type: true,
      status: true
    },
    defaultItem: {
      book_id: "",
      book_name: "",
      author: "",
      type: true,
      status: true
    },
    books: [
      {
        id: 1,
        book_id: "GJ0001",
        book_name: "Trí tuệ do thái",
        author: "Eran Katz",
        type: true,
        status: true,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: 2,
        book_id: "GJ0002",
        book_name: "Hiệu ứng lan truyền",
        author: "Jonah berger",
        type: true,
        status: true,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: 3,
        book_id: "GJ0003",
        book_name: "Được việc",
        author: "Dương Trọng Tấn",
        type: true,
        status: true,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: 4,
        book_id: "GJ0004",
        book_name: "Đúng việc",
        author: "Giản Tư Trung",
        type: true,
        status: true,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      },
      {
        id: 5,
        book_id: "GJ0005",
        book_name: "Nghĩ thiện",
        author: "Inamori Kazuo",
        type: true,
        status: true,
        created_at: "2021-02-22T04:20:19.000Z",
        updated_at: "2022-11-08T10:09:27.000Z",
      }
    ],
  }),

  computed: {
    formTitle () {
      return this.editedIndex === -1 ? 'New Book' : 'Edit Book'
    },
  },

  watch: {
    dialog (val) {
      val || this.close()
    }
  },

  methods: {

    editItem (item) {
      this.editedIndex = this.books.indexOf(item)
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
