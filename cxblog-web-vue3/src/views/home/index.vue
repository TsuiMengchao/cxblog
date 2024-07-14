<template>
  <div
    class="main-container container"
    v-loading.fullscreen.lock="fullscreenLoading"
  >
    <div class="main">
      <el-tooltip
        class="box-item"
        effect="dark"
        content="随机视频播放"
        placement="right"
      >
        <div
          @click="drawer = true"
          class="hand-style"
          style="
            color: var(--theme-color);
            position: fixed;
            left: 20px;
            bottom: 50%;
            font-size: 1.5rem;
          "
        >
          <el-icon><DArrowRight /></el-icon>
        </div>
      </el-tooltip>

      <el-drawer title="我是标题" v-model="drawer" :with-header="false">
        <div class="video-container">
          <video style="width: 100%" controls autoplay :src="videoSrc"></video>
        </div>
        <div style="margin-left: 20px; margin-top: 10px">
          <el-button
            type="primary"
            icon="DArrowRight"
            @click="nextVideo"
          ></el-button>
        </div>
      </el-drawer>

      <div class="main-box">
        <div class="bannerBox" @wheel="goWheel">
          <!-- 轮播图 -->
          <el-carousel
            height="150px"
            class="banner"
            arrow="always"
            ref="swiper"
          >
            <el-carousel-item v-for="(item, index) in bannerList" :key="index">
              <router-link class="hand-style" :to="'/article/' + item.id">
                <img
                  class="bannerImg"
                  v-lazy="item.avatar"
                  :key="item.avatar"
                />
                <h3 class="title">{{ item.title }}</h3>
              </router-link>
            </el-carousel-item>
          </el-carousel>
        </div>

        <div class="top-right">
          <SiteInfo />
          <el-card class="soft">
            <a
              :href="defaultSetting.poster1Href"
              target="_blank"
              class="hand-style"
            >
              <img
                v-lazy="defaultSetting.poster1Img"
                :key="defaultSetting.poster1Img"
                alt=""
              />
              <div class="soft-title">{{ defaultSetting.poster1Title }}</div>
              <div class="soft-info">资源推荐</div>
              <div class="overlay"></div>
            </a>
          </el-card>
        </div>
      </div>
      <!-- 热门分类 -->
      <div class="hot_category">
        <el-tabs
          v-model="activeName"
          class="demo-tabs"
          @tab-click="handleTabClick"
        >
          <el-tab-pane
            v-for="(item, index) in categoryList"
            :key="index"
            :name="index + ''"
          >
            <template #label>
              <span class="custom-tabs-label">
                <el-icon style="margin-left: 3px">
                  <component :is="item.icon" />
                </el-icon>
                <span>{{ item.name }}</span>
              </span>
            </template>
          </el-tab-pane>
        </el-tabs>
      </div>

      <div class="sayBox box-shadow">
        <router-link :to="'/say'">
          <a
            class="say-item"
            @mouseleave="start"
            @mouseenter="stop"
            v-for="(item, index) in sayList"
            :key="index"
            v-show="index == currentIndex"
          >
            <svg-icon name="say"></svg-icon>
            <span class="say-content" v-html="item.content"> </span>
          </a>
        </router-link>
      </div>

      <div class="content">
        <!-- 左侧内容 -->
        <div style="width: 100%">
          <div class="articleBox" v-if="articleList.length > 0">
            <el-card
              class="articleItem box-shadow-top wow pulse"
              v-for="(item, index) in articleList"
              :key="index"
            >
              <div class="articleInfo">
                <div class="articleInfo-item">
                  <div>
                    <el-tooltip
                      class="box-item"
                      effect="dark"
                      content="原创文章"
                      placement="top"
                    >
                      <span v-if="item.isOriginal" class="original">
                        <el-icon><Tickets /></el-icon>
                      </span>
                    </el-tooltip>

                    <span v-if="item.isStick" class="top">置顶</span>
                    <router-link :to="'/article/' + item.id">
                      <h3 class="xiahuaxian hand-style">{{ item.title }}</h3>
                    </router-link>
                    <div class="summary">
                      <el-text line-clamp="3" size="large">
                        {{ item.summary }}
                      </el-text>
                    </div>
                  </div>

                  <router-link :to="'/article/' + item.id">
                    <div class="articleImgBox" style="">
                      <img
                        class="articleImg hand-style"
                        v-lazy="item.avatar"
                        :key="item.avatar"
                      />
                    </div>
                  </router-link>
                </div>
              </div>
              <div class="bottumItem">
                <div class="articleUser">
                  <el-avatar
                    class="userAvatar"
                    :src="item.userAvatar"
                  ></el-avatar>
                  <span>{{ item.nickname }}</span>
                </div>

                <div class="tag">
                  <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="文章分类"
                    placement="top"
                  >
                    <el-tag
                      class="hand-style"
                      @click="handleClike(item.categoryId, '/category')"
                    >
                      <i class="el-icon-folder-opened"></i>
                      {{ item.categoryName }}
                    </el-tag>
                  </el-tooltip>
                  <el-tooltip
                    class="box-item"
                    effect="dark"
                    content="文章标签"
                    placement="top"
                    v-for="tag in item.tagList"
                    :key="tag.id"
                  >
                    <el-tag
                      :type="tagStyle[Math.round(Math.random() * 4)]"
                      class="hand-style"
                      @click="handleClike(tag.id, '/tags')"
                    >
                      <i class="el-icon-collection-tag"></i>
                      {{ tag.name }}
                    </el-tag>
                  </el-tooltip>
                </div>

                <div class="articleOhter">
                  <span class="item">
                    <el-icon><View /></el-icon>
                    <span class="name">阅读</span>{{ item.quantity }}
                  </span>
                  <span class="item">
                    <el-icon><ChatLineRound /></el-icon>
                    <span class="name">评论</span>{{ item.commentCount }}
                  </span>
                  <!-- <span class="item">
                                        <span v-if="item.isCollect">
                                            <i style="font-size: 1rem;" class="el-icon-star-on"></i>
                                            <span class="name">收藏</span>{{ item.collectCount }}
                                        </span>
                                        <span v-else>
                                            <i style="font-size: 1rem;" class="el-icon-star-off"></i>
                                            <span class="name">收藏</span>{{ item.collectCount }}
                                        </span>
                                    </span> -->
                  <span class="item">
                    <i
                      style="font-size: 0.8rem"
                      class="iconfont icon-dianzan1"
                    ></i>
                    <span class="name">赞</span>{{ item.likeCount }}
                  </span>
                  <span class="item">
                    <el-icon><Clock /></el-icon>{{ item.formatCreateTime }}
                  </span>
                </div>
              </div>
            </el-card>
            <!-- 分页按钮 -->
            <div>
              <sy-pagination
                :pageNo="pageData.pageNo"
                :pages="pages"
                @changePage="handlePage"
              />
            </div>
          </div>
          <sy-empty v-else message="很抱歉，暂无文章" />
        </div>
        <!-- 右侧内容 -->
        <div class="rightBox">
          <el-card
            class="box-card"
            style="perspective: 1000px; position: relative; height: 120px"
          >
            <div class="front">
              <img
                style="width: 100%"
                v-lazy="defaultSetting.overturnImg"
                :key="defaultSetting.overturnImg"
                alt=""
              />
            </div>
            <div class="back">
              <div style="width: 50%">
                <h2>扫一扫</h2>
                <span style="margin-left: 20px"> 体验小程序 </span>
              </div>
              <img
                v-lazy="defaultSetting.appletImg"
                :key="defaultSetting.appletImg"
                alt=""
              />
            </div>
          </el-card>
          <!-- 推荐文章 -->
          <el-card class="box-card recomArticle" v-if="newArticleList.length">
            <div class="clearfix">
              <span class="card-title">推荐文章</span>
            </div>
            <ul class="recomArticleUl">
              <li v-for="(item, index) in newArticleList" :key="index">
                <div :class="index == 0 ? 'article-item-top1' : 'article-item'">
                  <div class="recomCover">
                    <router-link :to="'/article/' + item.id">
                      <div class="imgBox">
                        <span>{{ index + 1 }}</span>
                        <img
                          class="hand-style"
                          v-lazy="item.avatar"
                          :key="item.avatar"
                        />
                      </div>
                    </router-link>
                  </div>
                  <p class="info">
                    <router-link
                      class="tuijian-title hand-style"
                      :to="'/article/' + item.id"
                    >
                      {{ item.title }}
                    </router-link>

                    <span class="time">{{ item.createTime }}</span>
                  </p>
                </div>
              </li>
            </ul>
          </el-card>

          <!-- 关注我 -->
          <el-card class="box-card guanzhu">
            <div class="clearfix">
              <span class="card-title">关注我</span>
            </div>
            <ul class="guanzhuList">
              <li v-show="isShow(2)">
                <div class="guanzhu-item qq">
                  <svg-icon name="qq" />
                  <a
                    class="hand-style"
                    :href="
                      '//wpa.qq.com/msgrd?v=3&amp;uin=' +
                      webInfo.qqNumber +
                      '&amp;site=qq&amp;menu=yes'
                    "
                    target="_blank"
                  >
                    {{ webInfo.qqNumber }}
                  </a>
                  <span
                    title="点击复制"
                    @click="copy(webInfo.qqNumber)"
                    class="copyBtn name hand-style"
                  >
                    QQ号
                  </span>
                </div>
              </li>
              <li v-show="isShow(6)">
                <div class="guanzhu-item qqgroup">
                  <svg-icon name="qqgroup" />
                  <a class="hand-style" href="javascript:;">
                    {{ webInfo.qqGroup }}
                  </a>
                  <span
                    title="点击复制"
                    @click="copy(webInfo.qqGroup)"
                    class="copyBtn name hand-style"
                  >
                    QQ群
                  </span>
                </div>
              </li>
              <li v-show="isShow(3)">
                <div class="guanzhu-item github">
                  <svg-icon name="github" />
                  <a class="hand-style" :href="webInfo.github" target="_blank">
                    {{ webInfo.github }}
                  </a>
                  <span
                    title="点击复制"
                    @click="copy(webInfo.github)"
                    class="copyBtn name hand-style"
                  >
                    github
                  </span>
                </div>
              </li>
              <li v-show="isShow(4)">
                <div class="guanzhu-item gitee">
                  <svg-icon name="gitee" />
                  <a class="hand-style" :href="webInfo.gitee" target="_blank">
                    {{ webInfo.gitee }}
                  </a>
                  <span
                    title="点击复制"
                    @click="copy(webInfo.gitee)"
                    class="copyBtn name hand-style"
                  >
                    gitee
                  </span>
                </div>
              </li>
              <li v-show="isShow(1)">
                <div class="guanzhu-item email">
                  <svg-icon name="email" />
                  <a
                    class="hand-style"
                    :href="'mailto:' + webInfo.email"
                    target="_blank"
                    title="邮箱"
                  >
                    {{ webInfo.email }}
                  </a>
                  <span
                    title="点击复制"
                    @click="copy(webInfo.email)"
                    class="copyBtn name hand-style"
                  >
                    邮箱
                  </span>
                </div>
              </li>
              <li v-show="isShow(5)">
                <div class="guanzhu-item wechat">
                  <svg-icon name="wechat" />
                  {{ webInfo.wechat }}
                  <span
                    title="点击复制"
                    @click="copy(webInfo.wechat)"
                    class="copyBtn name hand-style"
                  >
                    微信
                  </span>
                </div>
              </li>
            </ul>
          </el-card>

          <!-- 标签墙 -->
          <el-card class="box-card tag_container">
            <div class="clearfix">
              <span class="card-title"> 标签墙</span>
              <router-link :to="'/tags'">
                <a class="more hand-style no-select">更多</a>
              </router-link>
            </div>
            <div class="tagBox">
              <span
                @click="handleClike(item.id, '/tags')"
                :style="{
                  backgroundColor: `${randomColor()}`,
                  fontSize: item.font,
                }"
                class="tag-item hand-style"
                v-for="(item, index) in tagList"
                :key="index"
              >
                {{ item.name }}
              </span>
            </div>
          </el-card>

          <!-- 天气组件 -->
          <el-card class="box-card weather">
            <div class="clearfix">
              <span class="card-title"> 今日天气</span>
            </div>
            <div id="he-plugin-standard"></div>
          </el-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup name="Home">
import WOW from "wow.js";
import "wow.js/css/libs/animate.css";

import Clipboard from "clipboard";
import { listArticle, featchHomeData, listCategory } from "@/api";
import { listSay } from "@/api/say";
import SiteInfo from "@/components/authorInfo/index.vue";
import { useSiteStore } from "@/store/moudel/site.js";
import { ref } from "vue";

const { proxy } = getCurrentInstance();
const defaultSetting = ref(proxy.$setting);
const router = useRouter();
const siteStore = useSiteStore();
const webInfo = ref(siteStore.getWebInfo);
const centerDialogVisible = ref(false);
const drawer = ref(false);
const videoSrc = ref("http://api.yujn.cn/api/zzxjj.php");
const pageData = ref({
  pageNo: 1,
  pageSize: 10,
});
const activeName = ref("0");
const bannerList = ref([]);
const categoryList = ref([
  {
    id: null,
    name: "最新",
    icon: "Notification",
    desc: "create_time",
  },
  {
    id: null,
    name: "最热",
    icon: "HotWater",
    desc: "quantity",
  },
]);
const articleList = ref([]);
const pages = ref(0);
const tagList = ref([]);
const newArticleList = ref([]);
const tagStyle = ref(["success", "info", "warning", "danger"]);
const sayList = ref([]);
const currentIndex = ref(0);
const timer = ref();
const fullscreenLoading = ref(true);
const swiper = ref();
const swiperOpen = ref(true);

onBeforeUnmount(() => {
  clearInterval(timer);
});

//点击分类tab标签
function handleTabClick(tab) {
  let item = categoryList.value[tab.index];
  pageData.value.pageNo = 1;
  pageData.value.categoryId = item.id;
  pageData.value.orderByDescColumn = item.desc;
  listArticle(pageData.value).then((res) => {
    articleList.value = res.rows;
    pages.value = res.data.pages;
  });
}
//获取主页数据
function getHomeData() {
  featchHomeData().then((res) => {
    bannerList.value = res.articles;
    tagList.value = res.tagCloud;
    for (var i = 0; i < tagList.value.length; i++) {
      tagList.value[i].font = Math.floor(Math.random() * 10) + 10 + "px";
    }
    newArticleList.value = res.newArticleList;
  });
}
//获取所有分类
function fetchCategoryList() {
  listCategory().then((res) => {
    categoryList.value.push(...res.data);
  });
}

//要显示的联系方式
function isShow(type) {
  return webInfo.value.showList.indexOf(type) != -1;
}

//获取所有文章
function getArticleList() {
  listArticle(pageData.value)
    .then((res) => {
      articleList.value.push(...res.rows);
      pages.value = res.data.pages;
    })
    .finally(() => (fullscreenLoading.value = false));
}

//随机颜色
function randomColor() {
  var letters = "0123456789ABCDEF";
  var color = "#";
  do {
    for (var i = 0; i < 6; i++) {
      color += letters[Math.floor(Math.random() * 16)];
    }
  } while (color === "#FFFFFF" || color === "#000000");
  return color;
}
//切换视频
function nextVideo() {
  videoSrc.value = videoSrc.value + "?temps=" + new Date().getTime();
}
//复制
function copy(value) {
  const clipboard = new Clipboard(".copyBtn", {
    text: () => value,
  });
  clipboard.on("success", () => {
    clipboard.destroy();
  });
  clipboard.on("error", () => {
    pro$toast.error("复制失败");
    clipboard.destroy();
  });
}
// 分页
function handlePage(val) {
  fullscreenLoading.value = true;
  pageData.value.pageNo = val;
  getArticleList();
}
function handleClike(id, path) {
  router.push({
    path: path,
    query: { id: id },
  });
}
//初始化天气
function insertWeather() {
  window.WIDGET = {
    CONFIG: {
      layout: "2",
      width: 230,
      height: 270,
      background: "2",
      dataColor: "000000",
      borderRadius: "5",
      key: "632bf35b75f643fda4f7154697df9f47",
    },
  };
  const script = document.createElement("script");
  script.src =
    "https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0";
  document.body.appendChild(script);
}

//说说列表
function handleGetSayList() {
  let pageData = {
    pageNo: 1,
    pageSize: 5,
  };
  listSay(pageData).then((res) => {
    sayList.value = res.rows;
    for (var i = 0; i < sayList.value.length; i++) {
      //这里为过滤掉存在视频的说说
      if (sayList.value[i].content.indexOf("<video") > -1) {
        sayList.value.splice(i, 1);
        i = i - 1;
      }
    }
    start();
  });
}

function stop() {
  clearInterval(timer.value);
}
function start() {
  clearInterval(timer.value);
  if (sayList.value.length > 1) {
    timer.value = setInterval(() => {
      currentIndex.value++;
      if (currentIndex.value > sayList.value.length - 1) {
        currentIndex.value = 0;
      }
    }, 3500);
  }
}

function goWheel() {
  if (swiperOpen.value) {
    if (event.deltaY > 0) {
      //data中定义one为true 当one为true时执行
      swiper.value.next(); //以此来控制每次轮播图切换的张数
    }

    if (event.deltaY < 0) {
      swiper.value.prev();
    }
  }

  swiperOpen.value = false;
  setTimeout(() => {
    swiperOpen.value = true;
  }, 1000);
  event.preventDefault();
}
onMounted(() => {
  const wow = new WOW({
    boxClass: "wow", // animated element css class (default is wow)
    animateClass: "animated", // animation css class (default is animated)
    offset: 0, // distance to the element when triggering the animation (default is 0)
    mobile: true, // trigger animations on mobile devices (default is true)
    live: true, // act on asynchronously loaded content (default is true)
    callback: function (box) {
      // the callback is fired every time an animation is started
      // the argument that is passed in is the DOM node being animated
    },
    scrollContainer: null, // optional scroll container selector, otherwise use window
  });
  wow.init();

  getHomeData();
  getArticleList();
  insertWeather();
  fetchCategoryList();
  handleGetSayList();
});
</script>

<style lang="scss" scoped>
.custom-tabs-label {
  display: flex;
  align-items: center;
}

::v-deep(.el-tabs__nav-wrap::after) {
  background-color: var(--background-color);
}

::v-deep(.el-tabs__active-bar) {
  background-color: var(--theme-color);
}

::v-deep(.el-dialog) {
  background-color: rgba(0, 0, 0, 0.5);
  border-radius: 10px;

  .el-dialog__header {
    .el-dialog__title {
      color: #fff;
    }
  }

  .el-dialog__body {
    background-color: rgb(140, 140, 140);
  }

  .conent {
    text-align: center;
  }

  .footer-item {
    color: #fff;
  }
}

.banner {
  position: relative;
  height: 420px;

  ::v-deep(.el-carousel__container) {
    height: 100% !important;
  }

  .title {
    position: absolute;
    height: 50px;
    line-height: 50px;
    text-align: center;
    width: 100%;
    bottom: 50px;
    color: #fff;
    background: rgba(0, 0, 0, 0.3);
    z-index: 1;
  }

  .bannerImg {
    width: 100%;
    height: 100%;
  }
}

.main-container {
  @media screen and (max-width: 1118px) {
    padding-left: 10px;
    padding-right: 10px;

    .top-right,
    .rightBox,
    .articleImg {
      display: none;
    }

    .main {
      width: 100%;

      .bannerBox {
        width: 100%;

        .banner {
          height: 200px;
          border-radius: 5px;
        }
      }

      .articleInfo-item {
        width: 95%;
      }
    }
  }

  @media screen and (min-width: 1119px) {
    .main {
      width: 65%;

      .bannerBox {
        width: 70%;

        ::v-deep(.banner) {
          border-radius: 5px;
        }
      }

      .articleImgBox {
        width: 180px;
        height: 110px;
        overflow: hidden;
        border: 1px solid var(--border-line);
        border-radius: 5px;
        margin-left: auto;

        &:hover .articleImg {
          transform: scale(1.1);
        }

        .articleImg {
          width: 100%;
          height: 100%;
          transition: all 0.5s;
        }
      }

      .top-right {
        display: inline-block;
        width: 30%;
        height: 420px;
        margin-left: 20px;

        .soft {
          margin-top: 20px;
          background-color: #007aff;
          overflow: hidden;
          height: 125px;
          position: relative;

          &:hover .overlay {
            opacity: 0;
          }

          .overlay {
            background: rgba(0, 0, 0, 0.3);
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            opacity: 1;
            width: 100%;
            height: 100%;
            transition: all 0.5s;
          }

          a {
            display: inline-block;
            width: 100%;
            text-decoration: none;
            overflow: hidden;

            img {
              width: 100%;
              height: 100%;
            }

            .soft-title,
            .soft-info {
              display: block;
              padding: 5px;
              text-align: center;
              background: rgba(0, 0, 0, 0.7);
              color: #fff;
            }

            .soft-title {
              position: absolute;
              bottom: 0;
              width: 100%;
            }

            .soft-info {
              position: absolute;
              top: 5px;
              left: 5px;
              font-size: 0.8rem;
            }
          }
        }

        ::v-deep(.el-image) {
          width: 100%;
          height: 47%;

          &:last-child {
            margin-top: 20px;
          }
        }

        ::v-deep(.wh_content_all) {
          background-color: var(--theme-color);
          border-top-left-radius: 10px;
          border-top-right-radius: 10px;
        }
      }

      .rightBox {
        width: 43%;
        margin-left: 20px;

        .box-card {
          font-size: 16px;
          padding: 12px;
          background-color: var(--background-color);
          color: var(--article-color);
          margin-bottom: 15px;

          .card-title {
            padding-left: 40px;

            &::before,
            &::after {
              position: absolute;
              width: 12px;
              height: 12px;
              transform: none;
              background: #fc625d;
              border-radius: 50%;
              top: 4px;
              left: 20px;
              content: "";
            }

            &::after {
              left: 5px;
              background-color: #fdbc40;
            }
          }

          .front,
          .back {
            position: absolute;
            width: 100%;
            transform-style: preserve-3d;
            backface-visibility: hidden;
            transition-duration: 0.5s;
            transition-timing-function: "ease-in";
          }

          .back {
            transform: rotateY(180deg);
            display: flex;
            align-items: center;

            img {
              width: 120px;
              height: 120px;
            }
          }

          &:hover .front,
          &:focus .front {
            transform: rotateY(180deg);
          }

          &:hover .back,
          &:focus .back {
            transform: rotateY(0deg);
          }

          &:hover {
            .clearfix {
              &::before {
                content: "";
                width: 70px;
              }
            }
          }

          .clearfix {
            position: relative;
            margin-bottom: 20px;

            svg {
              width: 22px;
              height: 22px;
              vertical-align: -5px;
              margin-right: 5px;
            }

            &::before {
              content: "";
              width: 25px;
              border: 2px solid #333;
              position: absolute;
              bottom: -10px;
              transition: width 0.5s;
            }
          }
        }

        .recomArticle {
          color: var(--article-color);

          .recomArticleUl {
            display: flex;
            padding: 10px;
            list-style: none;
            flex-wrap: wrap;

            li {
              width: 100%;
              margin-bottom: 20px;

              .imgBox span {
                background-color: #818b95;
              }

              &:first-child {
                .imgBox span {
                  background-color: #f56c6c;
                }
              }

              &:nth-child(2) {
                .imgBox span {
                  background-color: #ffa41b;
                }
              }

              &:nth-child(3) {
                .imgBox span {
                  background-color: #409eff;
                }
              }

              &:last-child {
                margin-bottom: 10px;
              }

              &:hover {
                ::v-deep(.el-image__inner) {
                  transform: scale(1.1);
                }
              }

              .article-item-top1,
              .article-item {
                .recomCover {
                  .imgBox {
                    margin-right: 10px;
                    border-radius: 5px;
                    overflow: hidden;
                    border: 1px solid var(--border-line);
                    position: relative;

                    span {
                      position: absolute;
                      display: inline-block;
                      width: 30px;
                      border-radius: 2px 8px 8px 2px;
                      text-align: right;
                      padding-right: 5px;
                      font-weight: 700;
                      color: #fff;
                      margin-top: 5px;
                      z-index: 50;
                    }

                    img {
                      width: 100%;
                      height: 100%;
                      transition: all 0.5s;
                      margin-right: 10px;
                    }

                    &:hover img {
                      transform: scale(1.1);
                    }
                  }
                }
              }

              .article-item-top1 {
                position: relative;

                .recomCover {
                  //
                  width: 100%;

                  .imgBox {
                    width: 100%;
                    height: 150px;
                  }
                }

                .info {
                  .tuijian-title {
                    text-align: center;
                    width: 100%;
                    position: absolute;
                    bottom: 30px;
                    text-decoration: none;
                    color: #fff;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    display: -webkit-box;
                    -webkit-box-orient: vertical;
                    -webkit-line-clamp: 2;
                    background: rgba(0, 0, 0, 0.3);
                    padding: 5px 0;

                    &:hover {
                      color: var(--theme-color);
                    }
                  }

                  .time {
                    display: none;
                  }
                }
              }

              .article-item {
                height: 100%;
                display: flex;

                .info {
                  display: flex;
                  flex-direction: column;

                  .tuijian-title {
                    text-decoration: none;
                    color: var(--article-color);
                    overflow: hidden;
                    text-overflow: ellipsis;
                    display: -webkit-box;
                    -webkit-box-orient: vertical;
                    -webkit-line-clamp: 2;
                    height: 50%;

                    &:hover {
                      color: var(--theme-color);
                    }
                  }

                  .time {
                    font-size: 0.8rem;
                    color: var(--text-color);
                    margin-top: 10px;
                  }
                }

                .recomCover {
                  .imgBox {
                    width: 120px;
                    height: 75px;
                  }
                }
              }
            }
          }
        }

        .guanzhu {
          .guanzhuList {
            padding: 15px;
            list-style: none;

            .guanzhu-item {
              margin-bottom: 20px;
              height: 40px;
              line-height: 40px;
              font-size: 12px;
              display: flex;
              position: relative;
              border-radius: 3px;
              border: 1px solid #333;

              a {
                text-decoration: none;
                color: var(--text-color);
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                width: 100%;
                flex: 1;

                &:hover {
                  color: var(--theme-color);
                }
              }

              .name {
                position: absolute;
                right: 0;
                width: 60px;
                text-align: center;
                color: #fff;
                transition: width 0.35s;
              }

              &:hover .name {
                width: 80px;
              }

              svg {
                width: 20px;
                height: 20px;
                margin-left: 5px;
                position: relative;
                bottom: -10px;
                margin-right: 10px;
              }
            }

            .github {
              border-color: #606266;

              .name {
                background-color: #606266;
              }
            }

            .gitee {
              border-color: red;

              .name {
                background-color: red;
              }
            }

            .email {
              border-color: #f56c87;

              .name {
                background-color: #f56c87;
              }
            }

            .wechat {
              border-color: #67c23a;

              .name {
                background-color: #67c23a;
              }
            }

            .qq {
              border-color: #409eff;

              .name {
                background-color: #409eff;
              }
            }

            .qqgroup {
              border-color: #ea9518;

              .name {
                background-color: #ea9518;
              }
            }
          }
        }

        .tag_container {
          font-size: 0.9rem;
          background-color: var(--background-color);

          &:hover {
            transition: all 0.3s;
          }

          .clearfix {
            font-size: 16px;

            .more {
              float: right;
              margin-right: 10px;
              font-size: 13px;
              color: var(--text-color);
              text-decoration: none;

              &:hover {
                color: var(--theme-color);
              }
            }
          }

          .tagBox {
            padding-bottom: 10px;
            height: auto;
            margin-top: 10px;
          }
        }

        .weather {
          ::v-deep(#he-plugin-standard) {
            width: 100% !important;
            background-color: var(--background-color) !important;

            span,
            a {
              color: var(--text-color) !important;
            }
          }
        }
      }
    }
  }

  .main {
    margin-top: 80px;

    .video-container {
      position: relative;
      max-width: 92vw;
      max-height: 100vh;
      border-radius: 40px;
      box-shadow: rgba(0, 51, 203, 0.5) 0px 0px 40px;
      overflow: hidden;
    }

    .main-box {
      width: 100%;
      display: flex;
    }

    .hot_category {
      margin-top: 30px;

      ::v-deep(.el-tabs__item:hover span) {
        color: #409eff;
      }
    }

    .sayBox {
      background-color: var(--background-color);
      width: 100%;
      margin-bottom: 15px;
      border-radius: 5px;
      overflow: hidden;

      ::v-deep(a) {
        text-decoration: none;
      }

      .say-item {
        display: flex;
        padding: 10px;
        color: var(--article-color);
        animation: fade-in 0.45s linear 1;
        align-items: center;
        @keyframes fade-in {
          0% {
            transform: translateY(-30px);
          }

          100% {
            transform: translateY(0);
          }
        }

        .say-content {
          display: inline-block;
          width: 100%;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        svg {
          margin-right: 15px;
          width: 22px;
          height: 22px;
          vertical-align: -5px;
          animation: show 1s ease-in-out infinite alternate;
        }

        @keyframes show {
          0% {
            opacity: 1;
          }

          100% {
            opacity: 0.6;
          }
        }
      }
    }

    .content {
      display: flex;

      .articleBox {
        font-size: 1rem;
        width: 100%;

        .articleItem {
          position: relative;
          padding: 10px 5px 10px 15px;
          background-color: var(--background-color);
          margin-bottom: 20px;

          .articleInfo {
            color: var(--article-color);

            .original {
              position: absolute;
              right: 0;
              top: 0;
              width: 0;
              height: 0;
              border-color: transparent #40c9c6;
              /*上下颜色 左右颜色*/
              border-width: 0 40px 40px 0;
              border-style: solid;

              i {
                position: absolute;
                top: 4px;
                right: -37px;
                font-size: 16px;
                color: aquamarine;
              }
            }

            .articleInfo-item {
              display: flex;
              height: 100px;
              justify-content: space-between;

              a {
                color: var(--article-color);
              }

              .top {
                background-image: -webkit-linear-gradient(
                  0deg,
                  #3ca5f6 0,
                  #a86af9 100%
                );
                padding-left: 5px;
                padding-right: 5px;
                display: inline-block;
                border-top-right-radius: 5px;
                border-bottom-left-radius: 5px;
                font-size: 0.9rem;
                margin-right: 5px;
                color: #fff;
              }

              h3 {
                position: relative;
                display: inline-block;
              }

              .summary {
                margin-top: 10px;
              }
            }
          }

          .bottumItem {
            align-items: center;
            display: flex;
            margin-top: 20px;
            flex-wrap: wrap;

            .articleUser {
              line-height: 50px;

              span {
                color: var(--theme-color);
                margin-left: 3px;
              }

              .userAvatar {
                vertical-align: middle;
                border: 1px solid var(--border-line);
                transition: transform 0.5s;

                &:hover {
                  transform: rotate(360deg);
                }
              }
            }

            .tag {
              display: inline-block;
              margin-left: 20px;

              .el-tag {
                margin-right: 8px;
              }
            }

            .articleOhter {
              margin-left: 20px;
              font-size: 0.8rem;
              color: var(--text-color);

              .item {
                margin-right: 10px;
                .el-icon {
                  vertical-align: -2px;
                }
                .name {
                  margin-right: 3px;
                }

                i {
                  margin-right: 3px;
                }
              }
            }
          }
        }
      }
    }
  }
}
</style>
