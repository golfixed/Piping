import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: () => ({
        selected_line: '',
        selected_cml: '',
        selected_tp: '',
    }),
    mutations: {
        GET_ITEM_ID: (state, payload) => {
            state.selected_line = payload;
        },
        GET_ITEM_CML: (state, payload) => {
            state.selected_cml = payload;
        },
        GET_ITEM_TP: (state, payload) => {
            state.selected_tp = payload;
        },
    },
    actions: {},
    modules: {}
})