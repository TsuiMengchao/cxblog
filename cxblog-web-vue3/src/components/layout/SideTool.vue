<template>
  <div class="toolbar1" :style="{ right: right }">
    <el-tooltip class="item" effect="dark" content="聊天室" placement="left">
      <a
        href="javascript:void(0)"
        @click="handleGoIm"
        class="toolbar_item chat hand-style"
      >
        <el-icon>
          <ChatDotSquare />
        </el-icon>
      </a>
    </el-tooltip>

    <el-popover placement="left" trigger="hover" :width="220">
      <template #reference>
        <a
          href="javascript:void(0)"
          @click="handleGoIm"
          class="toolbar_item chat hand-style"
        >
          <i class="iconfont icon-bg-qrCode"></i>
        </a>
      </template>
      <el-tabs
        v-model="activeName"
        type="card"
        class="demo-tabs"
      >
        <el-tab-pane label="公众号" name="first">
          <el-image :src="defaultSetting.wxOpenImg">
          </el-image>
        </el-tab-pane>
        <el-tab-pane label="小程序" name="second">
          <el-image :src="defaultSetting.appletImg">
          </el-image>
        </el-tab-pane>
      </el-tabs>
    </el-popover>

    <el-tooltip
      class="item"
      effect="dark"
      :content="theme && theme == 'dark' ? '切换浅色主题' : '切换深色主题'"
      placement="left"
    >
      <a
        href="javascript:void(0)"
        class="toolbar_item hand-style"
        @click="chageTheme"
      >
        <i
          class="iconfont icon-taiyang theme"
          id="light"
          :style="theme == 'dark' ? '' : 'transform: translateX(30px)'"
        ></i>
        <i
          class="iconfont icon-yueliang theme"
          id="dark"
          :style="
            !theme || theme == 'light' ? '' : 'transform: translateX(-30px)'
          "
        ></i>
      </a>
    </el-tooltip>

    <el-tooltip class="item" effect="dark" content="回到顶部" placement="left">
      <a
        href="javascript:void(0)"
        title="回到顶部"
        class="toolbar_item back2top hand-style"
        @click="backTop()"
        @mouseenter="handleMouseEnter"
        @mouseleave="handleMouseLeave"
      >
        <span
          style="font-size: 1rem"
          v-if="percentage < 100 && showPercentage"
          >{{ percentage + "%" }}</span
        >
        <i v-else class="iconfont icon-shangjiantou"></i>
      </a>
    </el-tooltip>
  </div>
</template>

<script setup>
import { useUserStore } from "@/store/moudel/user.js";

const router = useRouter()
const { proxy } = getCurrentInstance();
const userStore = useUserStore();
const theme = ref(sessionStorage.getItem("theme"));
const show = ref(false);
const right = ref("-80px");
const percentage = ref(0);
const showPercentage = ref(true);
const style = ref(
  sessionStorage.getItem("theme") ? "" : "transform: translateX(-30px)"
);
const defaultSetting = ref(proxy.$setting);
const activeName = ref("first");

onMounted(() => {
  window.addEventListener("scroll", toTop, true);
});

function chageTheme() {
  theme.value = sessionStorage.getItem("theme");
  let val = "";
  if (!theme.value || theme.value == "light") {
    //浅色模式
    val = "dark";
    document.getElementById("dark").style.transform = "translateX(0)";
    document.getElementById("light").style.transform = "translateX(30px)";
  } else {
    val = "light";
    document.getElementById("light").style.transform = "translateX(0)";
    document.getElementById("dark").style.transform = "translateX(-30px)";
  }
  theme.value = val;
  sessionStorage.setItem("theme", val);
  document.documentElement.dataset.theme = val;
}

function handleMouseEnter() {
  showPercentage.value = false;
}
function handleMouseLeave() {
  showPercentage.value = true;
}

function backTop() {
  var timer = setInterval(function () {
    let osTop = document.documentElement.scrollTop || document.body.scrollTop;
    let ispeed = Math.floor(-osTop / 5);
    document.documentElement.scrollTop = document.body.scrollTop =
      osTop + ispeed;
    // isTop = true;
    if (osTop === 0) {
      clearInterval(timer);
    }
  }, 30);
}

function toTop() {
  let scrollTop = document.documentElement.scrollTop;
  var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
  var totalHeight = document.documentElement.scrollHeight;
  var viewportHeight =
    window.innerHeight || document.documentElement.clientHeight;
  var percent = (scrollPosition / (totalHeight - viewportHeight)) * 100;
  percentage.value = Math.round(percent);
  let scroll = scrollTop - proxy.i;
  proxy.i = scrollTop;
  if (scrollTop <= 150) {
    right.value = "-80px";
  }
  if (scroll > 0) {
    right.value = "20px";
  }
}

function handleGoIm() {
  if (!userStore.getUserInfo) {
    userStore.setLoginFlag(true);
    return;
  }
  router.push({ path: "/chat" });
}
</script>

<style lang="scss" scoped>
.toolbar1 {
  position: fixed;
  bottom: 130px;
  z-index: 99;
  transition: all 0.8s;

  .toolbar_item {
    text-decoration: none;
    margin-bottom: 10px;
    overflow: hidden;
    position: relative;
    background-color: var(--theme-color);
    width: 40px;
    height: 40px;
    border-radius: 50%;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.12);

    .theme {
      position: absolute;
      left: 12px;
      top: 12px;
      transition: all 0.5s;
    }
  }
}
.el-tab-pane {
  text-align: center;
}
.el-image {
  max-width: 150px;
  height: 150px;
}
</style>