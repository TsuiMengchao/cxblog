<template>
  <div>
    <!-- banner -->
    <div
      class="message-banner"
      style="
        background: url('https://cxblog.qiniu.zhaohaoyue.love/web/1642481294001.png') center
          center / cover no-repeat;
      "
    >
      <!-- 弹幕输入框 -->
      <div class="message-container">
        <h1 class="message-title">留言板</h1>
        <div class="message-input-wrapper">
          <el-input
            class="input"
            v-model="content"
            placeholder="说点什么吧"
            @keyup.enter="addToList"
            @focus="show = true"
          ></el-input>
          <el-button
            style="opacity: 0.6; padding: 20px 20px"
            class="ml-3"
            round
            @click="addToList"
            v-show="show"
            szie="large"
            >发送</el-button
          >
        </div>
      </div>
      <!-- 弹幕列表 -->
      <div class="barrage-container">
        <vue-danmaku
        class="danmaku"
          :danmus="barrageList"
          style="height: 100%; width: 100%"
          useSlot
          :speeds="150"
          :channels="15"
        >
          <template v-slot:dm="{ danmu }">
            <span class="barrage-items">
              <img
                :src="danmu.avatar"
                width="30"
                height="30"
                style="border-radius: 50%"
              />
              {{ danmu.nickname }}:{{ danmu.content }}</span
            >
          </template>
        </vue-danmaku>
      </div>
    </div>
  </div>
</template>

<script setup name='Message'>
import vueDanmaku from "vue3-danmaku";
import { listMessage, addMessage } from "@/api/message";
import { useUserStore } from "@/store/moudel/user.js";
import { useSiteStore } from "@/store/moudel/site.js";

const userStore = useUserStore();
const siteStore = useSiteStore();
const { proxy } = getCurrentInstance();
const show = ref(false);
const content = ref("");
const count = ref(null);
const timer = ref(null);
const barrageList = ref([]);
const user = ref(userStore.getUserInfo);

function addToList() {
  if (count.value) {
    proxy.$modal.msgWarning("30秒后才能再次留言");
    return;
  }
  if (content.value.trim() === "") {
    proxy.$modal.msgWarning("留言不能为空");
    return;
  }
  var message = {
    avatar: user.value ? user.value.avatar : siteStore.getWebInfo.touristAvatar,
    status: 1,
    nickname: user.value ? user.value.nickname : "游客",
    content: content.value,
    time: Math.floor(Math.random() * (21 - 10) + 10),
  };
  content.value = "";
  addMessage(message)
    .then((res) => {
      barrageList.value.push(message);
      proxy.$modal.msgSuccess("留言成功");
    })
    .catch((err) => {});
  const TIME_COUNT = 30;
  if (!timer.value) {
    count.value = TIME_COUNT;
    timer.value = setInterval(() => {
      if (count.value > 0 && count.value <= 30) {
        count.value--;
      } else {
        clearInterval(timer.value);
        timer.value = null;
      }
    }, 1000);
  }
}
function getMessage() {
  listMessage().then((res) => {
    barrageList.value = res.data;
  });
}

onMounted(() => {
  getMessage();
});
</script>

<style lang="scss" scoped>
::v-deep(.el-input__wrapper) {
  border-radius: 50px !important;
  opacity: 0.6 !important;
}

.message-banner {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #49b1f5;
  animation: header-effect 1s;

  .message-container {
    position: absolute;
    width: 360px;
    top: 35%;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 5;
    margin: 0 auto;
    color: #fff;

    .message-title {
      color: #eee;
      animation: title-scale 1s;
    }

    .message-input-wrapper {
      display: flex;
      justify-content: center;
      height: 2.5rem;
      margin-top: 2rem;

      .ml-3 {
        animation: left-in 1s ease;

        @keyframes left-in {
          0% {
            transform: translateY(-500%);
          }

          100% {
            transform: translateX(0);
          }
        }
      }
    }
  }

  .barrage-container {
    position: absolute;
    top: 80px;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 700px;
    .danmaku{
      height: 100%;
      width: 100%;
    }
    .barrage-items {
      background: #000;
      border-radius: 100px;
      color: #fff;
      padding: 5px 10px 5px 5px;
      align-items: center;
      display: flex;
      margin-top: 10px;
    }
  }
}
</style>
