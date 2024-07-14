

<template>
  <Header />
  <Login />
  <Search />
  <SideTool />
  <SideNavBar />
  <Notice />
   <metainfo></metainfo>
  <router-view style="min-height: 80vh" />

  <Footer />
</template>

<script setup>
import Header from "@/components/layout/Header.vue";
import Footer from "@/components/layout/Footer.vue";
import SideNavBar from "@/components/layout/SideNavBar.vue";
import SideTool from "@/components/layout/SideTool.vue";
import Login from "@/components/model/Login.vue";
import Search from "@/components/model/Search.vue";
import Notice from '@/components/notice/TopNotice.vue'

import { report, getWebSiteInfo, selectUserInfoByToken } from "@/api/index";
import { useSiteStore } from "@/store/moudel/site.js";
import { setToken, getToken } from "@/utils/cookie.js";
import { useUserStore } from "@/store/moudel/user.js";

const { proxy } = getCurrentInstance();
const siteStore = useSiteStore();
const userStore = useUserStore();
onMounted(() => {
  let theme = sessionStorage.getItem("theme");
  if (theme == null) {
    theme = "light";
  }
  document.documentElement.dataset.theme = theme;
});

//监听整个页面的 copy 事件
document.addEventListener("copy", function (e) {
  let clipboardData = e.clipboardData || window.clipboardData;
  if (!clipboardData) return;
  let text = window.getSelection().toString();
  if (text) {
    e.preventDefault();
    clipboardData.setData("text/plain", text);
    proxy.$modal.msgSuccess("复制成功,转载请务必保留原文链接!");
  }
});

document.addEventListener("keydown", (event) => {
  if (event.ctrlKey && event.key === "k") {
    siteStore.setSearchDialogVisible(true);
    event.preventDefault(); // 阻止默认行为
  }
});

function handleReport() {
  report().then((res) => {});
}
function initWebSiteInfo() {
  getWebSiteInfo().then((res) => {
    siteStore.setWebInfo(res.data);
    siteStore.setSiteAccess(res.siteAccess);
    siteStore.setVsitorAccess(res.visitorAccess);
  });
}

function getUserInfo() {
  userStore.setLoginFlag(false);

  let flag = window.location.href.indexOf("token") != -1;
  if (flag) {
    let token = window.location.href.split("token=")[1];
    setToken(token);
  }

  // 从cookie中获取token
  let token = getToken();
  if (token != null) {
    selectUserInfoByToken(token).then((res) => {
      userStore.setUserInfo(res.data);
    });
  }
}

handleReport();
initWebSiteInfo();
getUserInfo();
</script>

<style scoped>
</style>
