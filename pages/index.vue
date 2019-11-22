<template>
  <section class="section">
    <b-table
      :data="data"
      :columns="columns"
      focusable
      selectable
      @click="clicked"
    >
    </b-table>
    <router-link to="create">新規作成</router-link>
  </section>
</template>

<script>
export default {
  data() {
    return {
      data: [],
      columns: [
        {
          field: 'id',
          label: 'ID',
          width: '40',
          numeric: true
        },
        {
          field: 'userName',
          label: 'userName'
        },
        {
          field: 'email',
          label: 'email'
        },
        {
          field: 'createdAt',
          label: 'createdAt'
        },
        {
          field: 'updatedAt',
          label: 'updatedAt'
        }
      ]
    }
  },

  async created() {
    await this.$store.dispatch('getUsers')
    this.data = this.$store.state.users
  },

  methods: {
    clicked(row) {
      this.$router.push({ path: '/edit/' + row.id })
    }
  }
}
</script>
