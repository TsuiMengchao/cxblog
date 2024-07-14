<!-- 公告栏组件 -->
<template>
  <div class="message" ref="msgBox" id="message" v-if="showNotice">
    <marquee
      behavior="scroll"
      direction="left"
      ref="noticeRef"
      scrollamount="6"
      onmouseover="stop()"
      onmouseout="start()"
    >
      <span class="msg" ref="scrollMsg">
        <span class="title">
          <svg-icon name="topNotice"></svg-icon>
          公告 :
        </span>
        <span class="content" v-html="siteStore.getWebInfo.bulletin"></span>
        <span class="closeBtn hand-style " @click="closeMsg">
          关闭 <el-icon><CloseBold /></el-icon>
        </span>
      </span>
    </marquee>
  </div>
</template>

<script setup name='NoticeBar'>
import { useSiteStore } from "@/store/moudel/site.js";

const siteStore = useSiteStore();
const webInfo = ref(siteStore.getWebInfo) ;
const showNotice = ref(siteStore.getWebInfo.showBulletin == 1);
const noticeRef = ref();

function closeMsg() {
  var message = document.getElementById("message");
  message.style.opacity = 0;
  setTimeout(function () {
    message.style.display = "none";
  }, 500); 
}
function stop() {
  clearInterval(noticeRef.value.mysetInterval);
}
function start() {
  noticeRef.value.run();
}


</script>
<style scoped lang='scss'>
.message {
  width: 100%;
  overflow: hidden;
  position: relative;
  height: 30px;
  line-height: 30px;
  color: var(--text-color1);
  top: 60px;
  transition: all 0.5s linear;

  .msg {
    line-height: 30px;
    font-size: 14px;
    font-weight: 700;
    // position: absolute;

    .title {
      margin-right: 15px;

      svg {
        width: 20px;
        height: 20px;
        vertical-align: -5px;
      }
    }

    .content {
      ::v-deep(a) {
        text-decoration: none;
        color: red;
      }
    }

    .closeBtn {
      margin-left: 15px;
      font-weight: 400;
      &:hover{
        color: red;
      }
      i{
        vertical-align: -3px;
      }
    }
  }
}
</style>


