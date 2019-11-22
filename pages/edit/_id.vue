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

    <b-button @click="createUser(username, password, email)">編集</b-button>
  </section>
</template>

<script>
export default {
  data() {
    return {
      username: null,
      password: null,
      email: null
    }
  },

  async created() {
    await this.$store.dispatch('edit/getUser', this.$route.params.id)
    this.$data.username = this.$store.state.edit.user.userName
    this.$data.password = this.$store.state.edit.user.password
    this.$data.email = this.$store.state.edit.user.email
  },

  methods: {
    async createUser(vusername, vpassword, vemail) {
      try {
        await this.$axios.$post('/users', {
          userName: vusername,
          password: vpassword,
          email: vemail
        })
        this.$router.push('/')
      } catch (e) {
        this.$buefy.dialog.alert('追加できませんでした')
      }
    }
  }
}
</script>
