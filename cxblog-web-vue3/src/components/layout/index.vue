<template>
  <div>
    <!-- 内容 -->
    <transition name="moveCartoon">
      <router-view />
    </transition>
  </div>
</template>

<script setup>
import { getNewSystemNotice } from "@/api/im";
import { setToken, getToken } from "@/utils/cookie.js";
import { useSiteStore } from "@/store/moudel/site.js";

const siteStore = useSiteStore();

// 组件内前置守卫，在路由进入组件之前调用
onBeforeRouteUpdate((to, from, next) => {
  if (getToken()) {
    getNewSystemNotice().then((res) => {
      siteStore.setSystemNotice(res.data);
    });
  }
  next();
});
</script>

<style lang="scss" setup scoped>
/* 类名要对应回 name 的属性值 */
.moveCartoon-enter-active {
  animation: move 0.2s;
}

.moveCartoon-leave-active {
  animation: move 0.2s reverse;
}

@keyframes move {
  from {
    transform: translateX(-100%);
  }

  to {
    transform: translate(0);
  }
}
</style>
