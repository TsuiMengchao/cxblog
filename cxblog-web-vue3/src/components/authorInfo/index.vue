<template>
  <el-card class="box">
    <img :src="defaultSetting.avatarBg" alt="" />
    <div class="user">
      <div class="avatar_wrapper">
        <img :src="webInfo.authorAvatar" alt="" class="userAvatar" />
        <img class="guajian" :src="defaultSetting.avatarGaoda" alt="" />
      </div>
      <a class="username">
        {{ webInfo.author }}
        <el-tooltip
          class="box-item"
          effect="dark"
          content="博主"
          placement="right"
        >
          <svg-icon name="bozhu"></svg-icon>
        </el-tooltip>
      </a>
      <span class="desc" :title="webInfo.authorInfo">
        {{ webInfo.authorInfo }}
      </span>

      <div class="lianxi">
        <a class="hand-style" v-show="isShow(3)" :href="webInfo.github">
          <svg-icon name="github" />
        </a>
        <a
          v-show="isShow(4)"
          class="gitee hand-style"
          :href="webInfo.gitee"
          target="_blank"
          title="Gitee"
          rel="noopener noreferrer nofollow"
        >
          <svg-icon name="gitee" />
        </a>
        <a
          v-show="isShow(2)"
          class="qq hand-style"
          :href="
            '//wpa.qq.com/msgrd?v=3&amp;uin=' +
            webInfo.qqNumber +
            '&amp;site=qq&amp;menu=yes'
          "
          target="_blank"
          title="QQ"
          rel="noopener noreferrer nofollow"
        >
          <svg-icon name="qq" />
        </a>
        <a
          v-show="isShow(1)"
          class="email hand-style"
          :href="'mailto:' + webInfo.email"
          target="_blank"
          title="邮箱"
          rel="noopener noreferrer nofollow"
        >
          <svg-icon name="email" />
        </a>
        <a
          class="weibo hand-style"
          href="https://weibo.com/u/5747542477"
          target="_blank"
          title="微博"
          rel="noopener noreferrer nofollow"
        >
          <svg-icon name="weibo" />
        </a>
        <a
          class="zhihu hand-style"
          href="https://www.zhihu.com/people/he-he-85-83-34"
          target="_blank"
          title="知乎"
          rel="noopener noreferrer nofollow"
        >
          <svg-icon name="zhihu" />
        </a>
      </div>
      <!-- 收藏本站 -->
      <div class="collect">
        <el-button class="btn" @click="handleCollect">加入书签</el-button>
      </div>
    </div>
  </el-card>
</template>
<script setup name="site">
import { useSiteStore } from "@/store/moudel/site.js";

const { proxy } = getCurrentInstance();
const defaultSetting = ref(proxy.$setting);
const siteStore = useSiteStore();
const webInfo = ref(siteStore.getWebInfo);

function isShow(type) {
  return webInfo.value.showList.indexOf(type) != -1;
}
function handleClike(val) {
  window.location.href = val;
}
function handleCollect() {
   proxy.$modal.msgSuccess("按CTRL+ D 键将本页加入书签!");
}
</script>
<style lang="scss" scoped>
.box {
  height: auto;
  background-color: var(--background-color);
  position: relative;

  &::before {
    content: "";
    position: absolute;
    top: 95px;
    left: 0;
    width: 100%;
    height: 30px;
    z-index: 2;
    background: linear-gradient(to bottom, rgba(255, 255, 255, 0), #fff);
  }

  img {
    width: 100%;
    height: 120px;
    object-fit: cover;
    position: absolute;
    top: 0;
  }

  .user {
    padding: 45px 15px 15px;
    display: flex;
    align-items: center;
    position: relative;
    flex-direction: column;

    .avatar_wrapper {
      position: relative;
      width: 75px;
      height: 75px;
      margin-bottom: 12px;

      .userAvatar {
        width: 70px;
        height: 70px;
        border-radius: 50%;
        display: block;
        overflow: hidden;
        padding: 5px;
        -o-object-fit: cover;
        object-fit: cover;
        transition: transform 0.5s;
        z-index: 20;

        &:hover {
          transform: rotate(360deg);
        }
      }

      .guajian {
        z-index: 10;
        position: absolute;
        top: -20px;
        right: -3px;
      }
    }

    .username {
      color: var(--theme-color);
      display: block;
      font-size: 16px;
      font-weight: 500;
      margin-bottom: 5px;
      margin-top: 8px;

      svg {
        width: 18px;
        height: 18px;
        vertical-align: -3px;
      }
    }

    .desc {
      font-size: 14px;
      color: var(--text-color);
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      width: 100%;
      text-align: center;
      background: radial-gradient(
        circle at 49.86% 48.37%,
        #0090ff 0,
        #0089ff 3.33%,
        #3a82ff 6.67%,
        #717aff 10%,
        #9371fb 13.33%,
        #ae67ef 16.67%,
        #c45de1 20%,
        #d652d2 23.33%,
        #e448c2 26.67%,
        #ef3eb0 30%,
        #f7369e 33.33%,
        #fd318c 36.67%,
        #ff317a 40%,
        #ff3569 43.33%,
        #fd3d57 46.67%,
        #f94646 50%,
        #f35035 53.33%,
        #ea5a22 56.67%,
        #e16308 60%,
        #d56d00 63.33%,
        #c97500 66.67%,
        #bb7d00 70%,
        #ac8300 73.33%,
        #9d8900 76.67%,
        #8c8f00 80%,
        #7a9300 83.33%,
        #669700 86.67%,
        #4f9b00 90%,
        #309e0e 93.33%,
        #00a029 96.67%,
        #00a23d 100%
      );
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .collect {
      margin-top: 8px;
      width: 100%;

      .btn {
        background-color: transparent;
        border-radius: 5px;
        border: 2px solid var(--theme-color);
        color: var(--theme-color);
        padding: 10px 20px;
        font-weight: 700;
        position: relative;
        transition: all 1s;
        z-index: 1;
        overflow: hidden;
        height: 30px;
        width: 100%;
        line-height: 8px;

        &:hover {
          color: white;

          &::before {
            width: 180%;
          }
        }

        &::before {
          content: "";
          height: 100%;
          position: absolute;
          left: -30px;
          top: 0;
          background-color: var(--theme-color);
          transform: skewX(45deg);
          width: 0%;
          transition: all 1s;
          z-index: -1;
        }
      }
    }

    .lianxi {
      border-top: 1px solid var(--border-line);
      justify-content: space-around;
      padding-top: 10px;
      text-align: center;
      align-items: center;
      font-size: 14px;
      display: flex;
      margin-top: 6px;

      a {
        display: inline-block;
        margin: 0 10px;
        transition: all 0.5s;

        &:hover {
          transform: scale(1.2);
        }

        svg {
          width: 18px;
          height: 18px;
        }
      }
    }
  }
}

@keyframes img {
  0% {
    -webkit-transform: rotate(0deg);
  }

  50% {
    -webkit-transform: rotate(180deg);
  }

  100% {
    -webkit-transform: rotate(360deg);
  }
}
</style>