export const state = () => ({
  users: []
})

export const mutations = {
  setUsers(state, users) {
    state.users = users.users
  }
}

export const actions = {
  async getUsers({ commit }) {
    try {
      const usersRes = await this.$axios.$get('/users')
      commit('setUsers', usersRes)
    } catch (e) {
      console.log(e)
    }
  }
}
