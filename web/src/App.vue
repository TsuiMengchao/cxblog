<template>
  <div id="app">
    <!-- 头部 -->
    <Header :userInfo=userInfo></Header>
    <!-- 侧边导航栏 -->
    <SideNavBar></SideNavBar>
    <Loading></Loading>
    <Notice></Notice>
    <router-view :key="$route.fullPath" />

    <!-- 登录模态框 -->
    <Login></Login>
    <SearchModle></SearchModle>
    <!-- 侧边栏 -->
    <Sidebar></Sidebar>

    <!-- 底部 -->
    <Footer></Footer>
  </div>
</template>

<script>
import Header from '@/components/layout/Header.vue'
import Footer from '@/components/layout/Footer.vue'
import SideNavBar from "@/components/layout/SideNavBar.vue";
import Sidebar from '@/components/layout/Sidebar.vue'
import Loading from '@/components/loading/loading.vue'
import Login from '@/components/model/Login.vue'
import SearchModle from '@/components/model/Search.vue'
import Notice from '@/view/notice/topNotice.vue'
import { report, getWebSiteInfo, selectUserInfoByToken } from '@/api'
import { setSkin, getSkin, getToken, setToken } from '@/utils/cookieUtil'

export default {
  name: 'App',
  components: {
    Header,
    Footer,
    Sidebar,
    Login,
    SideNavBar,
    SearchModle,
    Loading,
    Notice,
  },
  data() {
    return {
      userInfo: this.$store.state.userInfo,
    }
  },
  created() {
    this.getUserInfo()
    this.initWebSiteInfo()
    this.report()
    var that = this

    //监听整个页面的 copy 事件
    document.addEventListener('copy', function (e) {
      let clipboardData = e.clipboardData || window.clipboardData;
      if (!clipboardData) return;
      let text = window.getSelection().toString();
      if (text) {
        e.preventDefault();
        clipboardData.setData('text/plain', text)
        that.$toast.success("复制成功,转载请务必保留原文链接!")
      }
    })

  },

  methods: {
    initWebSiteInfo() {
      getWebSiteInfo().then(res => {
        this.$store.commit("setWebSiteInfo", res.data)
        this.$store.state.siteAccess = res.extra.siteAccess
        this.$store.state.visitorAccess = res.extra.visitorAccess
      })
    },
    report() {
      report().then(res => {
      });
    },
    getUserInfo() {
      let flag = window.location.href.indexOf("token") != -1
      if (flag) {
        let token = window.location.href.split("token=")[1]
        setToken(token)
      }

      // 从cookie中获取token
      let token = getToken()
      if (token != null) {
        selectUserInfoByToken(token).then(res => {
          this.userInfo = res.data
          this.$store.commit("setUserInfo", res.data)
        })
      }
    },
  },

  mounted() {
    let theme = sessionStorage.getItem("theme")
    if (theme == null) {
      theme = "light"
    }
    document.documentElement.dataset.theme = theme
  },

}
</script>

<style lang="scss" scoped>
#app {
  background: var(--body-color);
}
</style>
