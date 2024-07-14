<template>
  <footer v-if="!showFooter" class="footer_container">
    <div class="content">
      <div class="site">
        <h2>{{webInfo.name ? webInfo.name:"辰雪博客"}}</h2>
        <div class="site-p">
          <p>Dean【热衷于互联网的发展】</p>

          <p>
            {{webInfo.copyright}}
            <a href="https://gitee.com/tsuimegchao/cxblog-cloud" target="_blank">{{
              webInfo.name
            }}</a>
            <a
              href="https://beian.miit.gov.cn/"
              target="_blank"
              style="margin-left: 10px"
              >{{ webInfo.recordNum }}</a
            >
          </p>
          <div class="run_time">
            <svg-icon name="shandian"></svg-icon>
            <span
              >风风雨雨 <strong>{{ day }}</strong> 天
              <strong>{{ hours }}</strong> 时 <strong>{{ minute }}</strong> 分
              <strong>{{ second }}</strong>
              秒</span
            >
          </div>
        </div>
      </div>

      <div class="site-girl">
        <div class="girl">
          <i class="thumb"></i>
        </div>
        <div class="girl-info">
          <h4>绿水本无忧，因风皱面</h4>
          <h4>青山原不老，为雪白头</h4>
        </div>
      </div>

      <div class="site-fav">
        <a class="btn-orange hand-style">Ctrl+D收藏本站</a>
      </div>

      <div class="site-number no-select">
        <span class="site_pv">
          <i class="iconfont icon-fangwenliang"></i>
          访问量
          <em class="pv_num">
            {{ siteStore.getSiteAccess }}
          </em>
        </span>

        <span class="site_uv">
          <i class="el-icon-user-solid"></i>
          访客量
          <em class="uv_num">
            {{ siteStore.getVsitorAccess }}
          </em>
        </span>
      </div>
    </div>
  </footer>
</template>
<script setup name="footer">
import { useSiteStore } from "@/store/moudel/site.js";

const siteStore = useSiteStore();
const webInfo = ref(siteStore.getWebInfo);
const route = useRoute();
const day = ref("");
const hours = ref("");
const minute = ref("");
const second = ref("");
const nowYear = ref(new Date().getFullYear());
const showFooter = ref(false);

// 监听路由变化
watch(
  () => route.path,
  (newVal, oldPath) => {
    if (newVal === "/message" || newVal === "/chat" || newVal === "/newposts") {
      showFooter.value = true;
    } else {
      showFooter.value = false;
    }
  },
  { immediate: false }
);

var timer = setInterval(runTime, 1000);
function runTime() {
  var timeold = new Date().getTime() - new Date(webInfo.value.releaseTime).getTime();
  var msPerDay = 24 * 60 * 60 * 1000;
  var daysold = Math.floor(timeold / msPerDay);
  var time = new Date();
  day.value = daysold;
  hours.value = time.getHours();
  minute.value = time.getMinutes();
  second.value = time.getSeconds();
}
</script>

<style lang="scss" scoped>

.footer_container {
  padding: 15px 20px;
  position: relative;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: var(--footer-background-color);
  background-position: 100% 0;
  margin-top: 50px;
  &:hover {
    .content .site-girl .girl {
      left: -130px;
    }
    .content .site-girl .girl::after {
      opacity: 1;
    }
  }
  .content {
    overflow: visible;
    padding-top: 36px;
    max-width: 1320px;
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;

    .site {
      font-size: 14px;
      color: var(--text-color);
      display: inline-block;
      width: auto;

      p {
        margin: 10px 0;
      }

      a {
        text-decoration: none;
        color: var(--text-color);

        &:hover {
          color: var(--theme-color);
        }
      }

      .run_time {
        height: 20px;
        align-items: center;

        svg {
          width: 19px;
          height: 19px;
          vertical-align: -4px;
          animation: yb 1s linear infinite;
        }

        span {
          line-height: 20px;
          font-size: 14px;
          padding-left: 5px;

          strong {
            color: var(--theme-color);
          }
        }
      }
    }

    @media screen and (max-width: 1118px) {
      .site-girl, .site-fav{
        display: none;
      }
  }
  @media screen and (min-width: 1119px) {
    .site-girl {
      position: absolute;
      bottom: 0;
      left: 50%;

      .girl {
        position: absolute;
        bottom: 0;
        left: -200px;
        width: 350px;
        transition: all 0.3s;

        &:after {
          position: absolute;
          top: 40%;
          right: 100%;
          display: block;
          color: #a7a7a7;
          content: "好久不见";
          font-size: 20px;
          opacity: 0;
          transition: all 0.2s;
          transition: all 0.3s;
        }
      }

      .thumb {
        display: block;
        padding-top: 60%;
        background-image: url(https://cxblog.qiniu.zhaohaoyue.love/web/cyxy.png);
      }
      .girl-info {
        margin-bottom: 55px;
        margin-left: 150px;
      }
    }

    .site-fav {
      float: right;
      display: block;
      padding-top: 40px;

      .btn-orange {
        padding: 0 2em;
        color: #fff;
        font-size: 1pc;
        display: block;
        outline: 0;
        border: none;
        border-radius: 3px;
        background: #746afc;
        text-align: center;
        line-height: 3.4;
        text-decoration: none;
      }
    }
  }




    .site-number {
      margin-top: 10px;
      i {
        display: inline-block;
        font-size: 12px;
      }

      .site_pv,
      .site_uv,
      .online_user {
        position: relative;
        display: inline-block;
        margin-right: 4px;
        height: 24px;
        padding-left: 10px;
        line-height: 24px;
        overflow: hidden;
        font-size: 12px;
        font-weight: 700;
        color: var(--background-color);
        background: var(--text-color1);
        border-radius: 5px;
      }

      .pv_num,
      .uv_num,
      .online_num {
        display: inline-block;
        font-size: 12px;
        padding: 0 15px;
      }

      .pv_num {
        background: linear-gradient(0deg, #d0339b, #d03336);
      }

      .uv_num {
        background: linear-gradient(0deg, #e2c63a, #f58044);
      }
    }
  }
}
</style>
