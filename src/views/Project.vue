<template>
<v-row justify="center">
  <v-col cols="12">
 <v-data-table
    :headers="headers"
    :items="projects"
    class="elevation-4"
    :search="search"
  >
    <template v-slot:item.activeLogtimeReport="{ item }">
          <v-icon v-if="item.activeLogtimeReport" color="green">mdi-check-circle</v-icon>
           <v-icon v-else color="red">mdi-close-circle</v-icon>
    </template>
    <template v-slot:item.activeQualityReport="{ item }">
          <v-icon v-if="item.activeQualityReport" color="green">mdi-check-circle</v-icon>
           <v-icon v-else color="red">mdi-close-circle</v-icon>
    </template>
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Projects</v-toolbar-title>
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
            >New Project</v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.name"  label="Project Name" autofocus required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.identify"  label="Identify" required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.rocket" label="Rocket Channel" required></v-text-field>
                  </v-col>
                   <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.cron"  label="Cron" required></v-text-field>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-menu
                      v-model="datePickerMenu"
                      :close-on-content-click="false"
                      :nudge-right="40"
                      transition="scale-transition"
                      offset-y
                      min-width="auto"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-model="editedItem.betaRelease"
                          label="Beta Release"
                          readonly
                          clearable
                          v-bind="attrs"
                          v-on="on"
                        ></v-text-field>
                      </template>
                      <v-date-picker
                        v-model="editedItem.betaRelease"
                        @input="datePickerMenu = false"
                      ></v-date-picker>
                    </v-menu>
                  </v-col>
                  <v-col cols="12" md="12">
                    <v-text-field v-model="editedItem.allowBugNum"  label="Allow bug" required type="number"></v-text-field>
                  </v-col>
                  <v-col cols="6" md="6">
                    <v-checkbox v-model="editedItem.activeLogtimeReport" label="Report logtime" ></v-checkbox>
                  </v-col>
                  <v-col cols="6" md="6">
                    <v-checkbox v-model="editedItem.activeQualityReport" label="Report quality" ></v-checkbox>
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
    datePickerMenu: false,
    headers: [
      {
        text: 'Project Name',
        align: 'start',
        value: 'name'
      },
      { text: 'Identify', value: 'identify' },
      { text: 'Rocket Channel', value: 'rocket' },
      { text: 'Cron', value: 'cron', sortable: false },
      { text: 'Beta Release', value: 'betaRelease', sortable: false },
      { text: 'Allow Bug', value: 'allowBugNum', sortable: false },
      { text: 'Logtime Report', value: 'activeLogtimeReport', sortable: false },
      { text: 'Quality Report', value: 'activeQualityReport', sortable: false },
      { text: 'Actions', value: 'actions', sortable: false }
    ],
    editedIndex: -1,
    editedItem: {
      id: '',
      name: '',
      identify: '',
      rocket: '',
      cron: '',
      betaRelease: null,
      allowBugNum: 0,
      activeLogtimeReport: false,
      activeQualityReport: false
    },
    defaultItem: {
      name: '',
      identify: '',
      rocket: '',
      cron: '',
      allowBugNum: 0,
      betaRelease: null,
      activeLogtimeReport: false,
      activeQualityReport: false
    },
    projects: [
      {
        activeLogtimeReport: true,
        activeQualityReport: true,
        allowBugNum: 131,
        betaRelease: "2022-09-30T00:00:00.000Z",
        createdAt: "2021-02-22T04:20:19.000Z",
        cron: "0 0 19 * * 1-5",
        id: 3,
        identify: "pho-pb-me049",
        name: "Photoruction",
        rocket: "proj_ME049",
        updatedAt: "2022-11-08T10:09:27.000Z",
      },
      {
        activeLogtimeReport: true,
        activeQualityReport: true,
        allowBugNum: 115,
        betaRelease: "2022-10-07T00:00:00.000Z",
        createdAt: "2022-06-21T10:43:00.000Z",
        cron: "0 0 19 * * 1-5",
        id: 4,
        identify: "alu-pb-me045",
        name: "Alumni",
        rocket: "proj_ME045",
        updatedAt: "2022-11-08T10:09:43.000Z",
      },
      {
        activeLogtimeReport: true,
        activeQualityReport: false,
        allowBugNum: 180,
        betaRelease: null,
        createdAt: "2022-09-12T10:43:16.000Z",
        cron: "0 0 21 * * 1-5",
        id: 5,
        identify: "novel-labo-2022",
        name: "Novel",
        rocket: "proj_novelwork_kintone_report",
        updatedAt: "2022-11-08T08:20:59.000Z",
      }
    ]
  }),

  computed: {
    formTitle () {
      return this.editedIndex === -1 ? 'New Project' : 'Edit Project'
    },
  },

  watch: {
    dialog (val) {
      val || this.close()
    }
  },

  methods: {

    editItem (item) {
      this.editedIndex = this.projects.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialog = true
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
