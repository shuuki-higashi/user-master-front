<template>
  <section class="section">
    <b-field label="Username">
      <b-input v-model="username" maxlength="30"></b-input>
    </b-field>

    <b-field label="Password">
      <b-input v-model="password" type="password" password-reveal></b-input>
    </b-field>

    <b-field label="Email">
      <b-input v-model="email" type="email" maxlength="30"></b-input>
    </b-field>

    <b-button @click="editUser(id, username, password, email)">編集</b-button>
    <b-button type="is-danger" @click="deleteUser(id)">削除</b-button>
  </section>
</template>

<script>
export default {
  data() {
    return {
      id: null,
      username: null,
      password: null,
      email: null
    }
  },

  async created() {
    try {
      const userRes = await this.$axios.$get('/users/' + this.$route.params.id)
      this.id = userRes.user.id
      this.username = userRes.user.userName
      this.password = userRes.user.password
      this.email = userRes.user.email
    } catch (e) {
      this.$buefy.dialog.alert('ユーザを取得できませんでした')
    }
  },

  methods: {
    async editUser(vid, vusername, vpassword, vemail) {
      try {
        await this.$axios.$patch('/users/' + vid, {
          userName: vusername,
          password: vpassword,
          email: vemail
        })
        this.$router.push('/')
      } catch (e) {
        this.$buefy.dialog.alert('編集できませんでした')
      }
    },

    async deleteUser(vid) {
      try {
        await this.$axios.$delete('/users/' + vid)
        this.$router.push('/')
      } catch (e) {
        this.$buefy.dialog.alert('削除できませんでした')
      }
    }
  }
}
</script>
