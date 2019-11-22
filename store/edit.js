export const state = () => ({
  user: null
})

export const mutations = {
  setUser(state, user) {
    state.user = user.user
  }
}

export const actions = {
  async getUser({ commit }, id) {
    try {
      const userRes = await this.$axios.$get('/users/' + id)
      commit('setUser', userRes)
    } catch (e) {
      console.log(e)
    }
  }
}
