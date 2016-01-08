import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)


import Application from './Application.vue'
import Home from './pages/Home.vue'
import About from './pages/About.vue'
import Header from './components/Header.vue'
Vue.component('component-header', Header)


const App = Vue.extend(Application)

const router = new VueRouter({
  history: true,
  saveScrollPosition: true,
  abstract: true
})

router.map({
  '/': { component: Home },
  '/about': { component: About }
})

// router.afterEach(function (transition) {
//   console.log('Successfully navigated to: ' + transition.to.path)
// })

router.start(App, '#app')