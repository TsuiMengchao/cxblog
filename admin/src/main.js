import Vue from 'vue'

import Cookies from 'js-cookie'

import 'normalize.css/normalize.css'

import Element from 'element-ui'

// 数据字典
import dict from './components/Dict'

// 权限指令
import checkPer from '@/utils/permission'
import './assets/styles/element-variables.scss'

// global css
// 自定义表格工具组件
import RightToolbar from '@/components/RightToolbar'
import './assets/styles/index.scss'

import App from './App'
import store from './store'
import router from './router/routers'

import './assets/icons' // icon
import './router/index' // permission control

// region new
import Clipboard from 'clipboard'
Vue.prototype.Clipboard = Clipboard
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
import VueParticles from 'vue-particles'
import tagCloud from '@/utils/tag-cloud'
Vue.use(tagCloud)
Vue.component('RightToolbar', RightToolbar)
Vue.use(VueParticles)
Vue.use(mavonEditor)
import CodeEditor from 'bin-code-editor'
Vue.use(CodeEditor)
// endregion

Vue.use(checkPer)
Vue.use(dict)
Vue.use(Element, {
  size: Cookies.get('size') || 'small' // set element-ui default size
})

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
