import Vue from 'vue'
import App from './App'

import request from './utils/request.js'
Vue.prototype.$H = request;

// 挂载Vuex
import store from './store';  
Vue.prototype.$store = store;

// config配置文件
import config from './utils/config.js';  
Vue.prototype.$c = config;

// 公共方法
import fun from './utils/function.js';  
Vue.prototype.$f = fun;

import uView from "uview-ui";
Vue.use(uView);

Vue.config.productionTip = false

App.mpType = 'app'

const app = new Vue({
	store,
	...App
})
app.$mount()
