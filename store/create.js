export const state = () => ({
  users: [],
  test: 'test'
})

export const mutations = {
  setUsers(state, users) {
    state.users = users.users
  }
}

export const actions = {
  async createUser({ username, password, email }) {
    try {
      await this.$axios.$post('/users', {
        username,
        password,
        email
      })
    } catch (e) {
      console.log(e)
    }
  }
}
