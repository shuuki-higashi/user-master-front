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

    <b-button @click="createUser">作成</b-button>
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

  methods: {
    async createUser() {
      await this.$store.dispatch('createUser', {
        username: this.username,
        password: this.password,
        email: this.email
      })
      this.$router.push('/')
    }
  }
}
</script>
