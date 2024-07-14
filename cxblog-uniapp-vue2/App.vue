<script>
	import Vue from 'vue'
	import store from './store/index.js'
	import updateCustomBarInfo from './tuniao-ui/libs/function/updateCustomBarInfo.js'
	export default {
		onLaunch: function() {
		   updateCustomBarInfo().then((res) => {
				store.commit('$tStore', {
				  name: 'vuex_status_bar_height',
				  value: res.statusBarHeight
				})
				store.commit('$tStore', {
				  name: 'vuex_custom_bar_height',
				  value: res.customBarHeight
				})
			})
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style lang="scss">
  /* 注意要写在第一行，同时给style标签加入lang="scss"属性 */
  @import './tuniao-ui/index.scss';
  @import './tuniao-ui/iconfont.css';

</style>

