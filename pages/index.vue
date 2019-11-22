<template>
  <section class="section">
    <b-table
      :data="users"
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
      users: [],
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
    try {
      const usersRes = await this.$axios.$get('/users')
      this.users = usersRes.users
    } catch (e) {
      this.$buefy.dialog.alert('ユーザを取得できませんでした')
    }
  },

  methods: {
    clicked(row) {
      this.$router.push({ path: '/edit/' + row.id })
    }
  }
}
</script>
