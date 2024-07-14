<template>
  <header :class="headerClass">
    <div id="pre" :style="{ width: widthPre + '%' }"></div>
    <nav>
      <div class="logo">
        <div class="logoBox">
          <router-link :to="'/'" class="hand-style">
            <el-image
              class="img"
              style="
                width: 50px;
                border-radius: 50%;
                height: 50px;
                border: 1px solid var(--border-line);
              "
              :src="siteStore.getWebInfo.logo"
            >
            </el-image>
            <span class="name">{{ siteStore.getWebInfo.name }}</span>
          </router-link>
        </div>
        <!-- 手机端导航栏 -->
        <span v-if="isMobile" style="position: absolute; left: 10px">
          <a @click="openDrawer" style="font-size: 20px">
            <i class="iconfont icon-menu_normal" style="font-size: 1.5rem" />
          </a>
        </span>
        <!-- 手机端搜索栏 -->
        <span v-if="isMobile" style="position: absolute; right: 10px">
          <a @click="handleOpenSearchDialog" style="font-size: 20px">
            <i class="iconfont icon-search" style="font-size: 1.5rem" />
          </a>
        </span>
      </div>

      <ul class="starlist">
        <li :class="path === '/' ? 'active' : ''">
          <span>
            <router-link :to="'/'" class="hand-style">
              <svg-icon name="home"></svg-icon> 首页
            </router-link>
          </span>
        </li>

        <li
          :class="
            path === '/archive' || path === '/categorys' || path === '/tag'
              ? 'active'
              : ''
          "
        >
          <el-dropdown>
            <span class="el-dropdown-link hand-style">
              <svg-icon name="archive"></svg-icon> 文章归档
              <el-icon class="el-icon--right">
                <arrow-down />
              </el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <router-link
                  style="text-decoration: none; color: #71777c"
                  :to="'/archive'"
                >
                  <el-dropdown-item>
                    <el-icon>
                      <Wallet />
                    </el-icon>
                    归档
                  </el-dropdown-item>
                </router-link>
                <router-link
                  style="text-decoration: none; color: #71777c"
                  :to="'/category'"
                >
                  <el-dropdown-item>
                    <el-icon>
                      <DocumentCopy />
                    </el-icon>
                    分类
                  </el-dropdown-item>
                </router-link>

                <router-link
                  style="text-decoration: none; color: #71777c"
                  :to="'/tags'"
                >
                  <el-dropdown-item>
                    <el-icon>
                      <PictureRounded />
                    </el-icon>
                    标签
                  </el-dropdown-item>
                </router-link>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </li>

        <li :class="path === '/say' ? 'active' : ''">
          <span>
            <router-link :to="'/say'" class="hand-style">
              <svg-icon name="say"></svg-icon> 说说
            </router-link>
          </span>
        </li>

        <li :class="path === '/software' ? 'active' : ''">
          <span>
            <router-link :to="'/software'" class="hand-style">
              <svg-icon name="navication"></svg-icon> 开源软件
            </router-link>
          </span>
        </li>

        <li :class="path === '/hot' ? 'active' : ''">
          <span>
            <router-link :to="'/hot'" class="hand-style">
              <svg-icon name="hot2"></svg-icon> 热搜
            </router-link>
          </span>
        </li>
        <li :class="path === '/message' ? 'active' : ''">
          <span>
            <router-link :to="'/message'" class="hand-style">
              <svg-icon name="message"></svg-icon> 留言板
            </router-link>
          </span>
        </li>
        <li :class="path === '/link' ? 'active' : ''">
          <span>
            <router-link :to="'/link'" class="hand-style">
              <svg-icon name="friendLink"></svg-icon> 友情链接
            </router-link>
          </span>
        </li>
        <li :class="path === '/about' ? 'active' : ''">
          <el-dropdown>
            <span class="el-dropdown-link hand-style">
              <svg-icon name="about" mr="5"></svg-icon> 关于本站
              <el-icon class="el-icon--right">
                <arrow-down />
              </el-icon>
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <router-link
                  style="text-decoration: none; color: #71777c"
                  :to="'/about'"
                >
                  <el-dropdown-item>
                    <el-icon>
                      <Monitor />
                    </el-icon>
                    关于本站
                  </el-dropdown-item>
                </router-link>

                <a
                  style="text-decoration: none; color: #71777c"
                  href="https://gitee.com/tsuimegchao/cxblog-cloud"
                  target="_blank"
                >
                  <el-dropdown-item>
                    <i class="iconfont icon-zitidaima"></i>网站源码
                  </el-dropdown-item>
                </a>

                <a
                  style="text-decoration: none; color: #71777c"
                  :href="adminUrl"
                  target="_blank"
                >
                  <el-dropdown-item>
                    <el-icon>
                      <Tools />
                    </el-icon>
                    后台管理
                  </el-dropdown-item>
                </a>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </li>
      </ul>

      <!-- 搜索框 -->
      <div class="searchBox" v-if="!showSearch">
        <div class="search_ico">
          <div class="hand-style" @click="handleOpenSearchDialog">
            <i class="iconfont icon-search"></i>
            搜索文章...
            <span> Ctrl+K </span>
          </div>
        </div>
      </div>
      <!-- 发布文章按钮 -->
      <div class="articleBtn" v-if="showUser">

        <el-dropdown trigger="hover">
              <span class="el-dropdown-link">
                  <button type="button" class="sendBtn">
                      <el-icon :size="20"><Edit /></el-icon> 创作
                  </button>
              </span>
          <template #dropdown>
          <el-dropdown-menu>

            <router-link style="text-decoration: none;color: #71777c;" :to="'/newposts'">
              <el-dropdown-item>
                <svg-icon name="article"
                          style="width: 20px;height: 20px;vertical-align: -5px;"></svg-icon> 发布文章
              </el-dropdown-item>
            </router-link>
            <router-link style="text-decoration: none;color: #71777c;" :to="'/newSays'">
              <el-dropdown-item>
                <svg-icon name="say"
                          style="width: 20px;height: 20px;vertical-align: -5px;"></svg-icon> 发布说说
              </el-dropdown-item>
            </router-link>

            <router-link style="text-decoration: none;color: #71777c;" :to="'/forum'">
              <el-dropdown-item>
                <svg-icon name="talk"
                          style="width: 20px;height: 20px;vertical-align: -5px;"></svg-icon> 发布讨论
              </el-dropdown-item>
            </router-link>
          </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>

      <div class="noticeBtn" v-if="showUser">
        <el-dropdown>
          <span class="el-dropdown-link hand-style"  @click="handleClickNotice(null)">
            <svg-icon name="notice"></svg-icon>
            <div v-if="topBageShow()" class="notice-bage topBage"></div>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item
                v-for="(item, index) in noticeList"
                :key="index"
                @click="handleClickNotice(index)"
              >
                {{ item }}
                <span v-if="validata(index)" class="notice-item-bage"></span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
      <div class="userInfo" v-if="showUser">
        <el-dropdown>
          <span class="el-dropdown-link hand-style">
            <el-avatar
              v-if="!userInfoTemp"
              :size="45"
              :src="defaultSetting.touristAvatar"
              alt=""
            />
            <el-avatar v-else :size="40" :src="userInfoTemp.avatar" />
          </span>
          <template #dropdown>
            <el-dropdown-menu v-if="userInfoTemp">
              <router-link
                style="text-decoration: none; color: #71777c"
                :to="'/user'"
              >
                <el-dropdown-item>
                  <el-icon><User /></el-icon> 个人中心
                </el-dropdown-item>
              </router-link>
              <a
                style="text-decoration: none; color: #71777c"
                @click="handleLogout"
              >
                <el-dropdown-item>
                  <el-icon><Position /></el-icon> 退出登录
                </el-dropdown-item>
              </a>
            </el-dropdown-menu>
            <el-dropdown-menu v-else>
              <div class="loginTip" style="padding: 10px; font-size: 0.9rem">
                <p>登录网站，获取以下权益</p>
                <div style="margin-top: 10px">
                  <span>
                    <el-icon><ChatLineRound /></el-icon> 参与互动评论
                  </span>

                  <span style="margin-left: 10px">
                    <el-icon><Document /></el-icon> 发表优质文章
                  </span>
                </div>
                <el-button
                  @click="handleLogin()"
                  style="display: block; margin: 10px auto 0"
                  type="success"
                  size="small"
                  >立即登录
                </el-button>
              </div>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </nav>
  </header>
</template>
<script setup name="Header">
import { removeToken } from "@/utils/cookie.js";
import { logout } from "@/api";
import { useSiteStore } from "@/store/moudel/site.js";
import { useUserStore } from "@/store/moudel/user.js";
import { storeToRefs } from "pinia";

const { proxy } = getCurrentInstance();
const defaultSetting = ref(proxy.$setting);
const route = useRoute();
const router = useRouter();
const siteStore = useSiteStore();
const userStore = useUserStore();
let { webInfo,systemNotice } = storeToRefs(siteStore);
let widthPre = ref("");
const user = ref({});
const style = ref();
let path = ref("/");
let isMobile = ref(false);
let showSearch = ref(false);
let showUser = ref(true);
const windowWidth = ref(window.innerWidth);
let headerClass = ref("header");
const noticeList = ref(["系统通知", "评论", "私信"]);
const adminUrl = ref(import.meta.env.VITE_APP_ADMIN_API);
// const props = defineProps({
//   userInfo: {
//     type: Object,
//     default: null,
//   },
// });
const userInfo = ref(userStore.getUserInfo);

//控制登录框显示的方法
const userInfoTemp = computed({
  get() {
    userInfo.value = userStore.getUserInfo;
    return userStore.getUserInfo;
  },
  set(value) {
    userInfo.value = value;
    userStore.setUserInfo(value);
  },
});

watch(windowWidth, (newX) => {
  isMobile.value = newX < 1119;
  showSearch.value = newX < 1500;
  showUser.value = newX > 1350;
});

// 监听路由变化
watch(
  () => route.path,
  (newPath, oldPath) => {
    path.value = newPath;
  },
  { immediate: false }
);

onMounted(() => {
  isMobile.value = window.innerWidth < 1119;
});

window.addEventListener(
  "resize",
  () => {
    windowWidth.value = window.innerWidth; // 宽
  },
  true
);
window.addEventListener("scroll", scrollFn, false);

//打开搜索框
function handleOpenSearchDialog() {
  siteStore.setSearchDialogVisible(true);
}

function handleClickNotice(index) {
  if (index === noticeList.value.length - 1) {
    router.push({ path: "/chat" });
    return;
  }
  router.push({ path: "/msg", query: { type: index } });
}

//显示徽标
function topBageShow() {
  if (!systemNotice.value) {
    return false;
  }
  return (
    systemNotice.value.system > 0 ||
    systemNotice.value.comment > 0 ||
    systemNotice.value.private > 0
  );
}

function validata(index) {

  if (!systemNotice.value) {
    return false;
  }
  switch (index) {
    case 0:
      return systemNotice.value.system > 0;
    case 1:
      return systemNotice.value.comment > 0;
    case 2:
      return systemNotice.value.private > 0;
    default:
      return false;
  }
}

//滚动
function scrollFn() {
  // 页面滚动距顶部距离
  let scrollTop =
    window.pageYOffset ||
    document.documentElement.scrollTop ||
    document.body.scrollTop;
  let scroll = scrollTop - this.i;
  this.i = scrollTop;

  // 鼠标向上滚动
  // if (scroll < 0) {
  //   headerClass = "header slideDown";
  // } else {
  //   headerClass = "header slideUp";
  // }
  let page = document.body.scrollHeight;
  let client = document.documentElement.clientHeight;
  let comend = page - client;
  let scrTop = document.documentElement.scrollTop;
  widthPre.value = Math.round((scrTop / comend) * 10000) / 100;
}

//登录
function handleLogin() {
  userStore.setLoginFlag(true);
}

//退出
function handleLogout() {
  //如果在个人中心则跳回上一页
  if (path.value === "/user") {
    route.go(-1);
  }
  logout()
    .then((res) => {
      removeToken();
      location.reload();
      userStore.setUserInfo(null);
    })
    .catch((err) => {
      console.log(err);
    });
}

//打开登录框
function openDrawer() {
  siteStore.setNavBarDialogVisible(true);
}
</script>

<style lang="scss" scoped>
::v-deep(.el-dropdown-link svg) {
  margin-right: 5px !important;
}
.notice-bage ,.notice-item-bage{
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background-color: red;
  display: inline-block;

}
.notice-bage{
  position: absolute;
  top: -5px;
  right: 0;
}

#pre {
  position: fixed;
  top: 0;
  height: 2px;
  background-image: -webkit-linear-gradient(0deg, #3ca5f6 0, #a86af9 100%);
}

@media screen and (max-width: 1118px) {
  .header {
    position: fixed;
    top: 0;
    width: 100%;
    line-height: 60px;
    z-index: 99;
    background-color: var(--header-back-color);

    a {
      text-decoration: none;
    }

    nav {
      width: 100%;
      margin: auto;
      overflow: hidden;
      max-width: 1500px;

      .logo {
        font-size: 22px;
        font-weight: 700;
        width: 100%;
        position: relative;
        display: flex;
        color: var(--text-color);

        .logoBox {
          height: 60px;
          display: flex;
          align-items: center;
          position: relative;
          margin: 0 auto;
        }

        .img {
          width: 80px;
          height: 40px;
          vertical-align: middle;
          margin-top: -6px;
        }

        .name {
          margin-left: 10px !important;
          color: var(--theme-color) !important;
          font-family: "Lucida Calligraphy", cursive, serif, sans-serif;
        }
      }

      .starlist {
        display: none;
      }

      .searchBox,
      .articleBtn,
      .starlist,
      .noticeBtn,
      .userInfo {
        display: none;
      }
    }
  }
}

@media screen and (min-width: 1119px) {
  /*针对宽度小于等于767px的屏幕设备，定义如下样式*/
  .slideDown {
    transition: transform 0.5s ease-out;
    transform: translateY(0);
  }

  .slideUp {
    transition: transform 0.5s ease-out;
    transform: translateY(-100px);
  }

  .header {
    position: fixed;
    top: 0;
    width: 100%;
    line-height: 60px;
    z-index: 99;
    background-color: var(--header-back-color);
    backdrop-filter: blur(25px);
    box-shadow: 0 1px 40px -8px rgba(0, 0, 0, 0.5);

    a {
      text-decoration: none;
    }

    nav {
      width: 100%;
      margin: auto;
      overflow: hidden;
      max-width: 1500px;

      .logo {
        float: left;
        font-size: 22px;
        font-weight: 700;

        .img {
          vertical-align: middle;
          margin-top: -6px;
        }

        .name {
          margin-left: 10px !important;
          color: var(--theme-color) !important;
        }
      }

      .starlist {
        display: block;
        float: left;
        margin-left: 30px;
        overflow: hidden;
        max-width: 1500px;

        li {
          float: left;
          display: block;
          font-size: 14px;
          padding: 0 15px;
          position: relative;

          // &:hover::before {
          //     content: "";
          //     position: absolute;
          //     top: 0;
          //     left: 0;
          //     right: 0;
          //     bottom: 0;
          //     width: 60%;
          //     height: 4px;
          //     border-bottom-left-radius: 15px;
          //     border-bottom-right-radius: 15px;
          //     background-color: var(--theme-color);
          //     margin: 0 auto;
          //     text-align: center;
          //     animation: fade-in 0.3s linear 1;
          // }

          @keyframes fade-in {
            0% {
              transform: scale(0);
            }

            100% {
              transform: scale(1);
            }
          }

          svg {
            width: 18px;
            height: 18px;
            vertical-align: -3px;
          }

          i {
            font-weight: 700;
          }

          a {
            color: #71777c;

            &:hover {
              color: var(--theme-color);
            }
          }
        }

        .active {
          // &::before {
          //   content: "";
          //   position: absolute;
          //   top: 0;
          //   left: 0;
          //   right: 0;
          //   bottom: 0;
          //   width: 60%;
          //   height: 4px;
          //   border-bottom-left-radius: 15px;
          //   border-bottom-right-radius: 15px;
          //   background-color: var(--theme-color);
          //   margin: 0 auto;
          //   text-align: center;
          // }

          a,
          span {
            color: var(--theme-color) !important;
            font-weight: 700;
          }
        }
      }

      .searchBox {
        position: absolute;
        right: 260px;
        top: 0;
        display: flex;
        -ms-flex-direction: column;
        flex-direction: column;

        .search_ico {
          position: absolute;
          right: 5px;
          top: 0;
          padding: 0;
          margin: 0;
          line-height: 60px;

          div {
            width: 180px;
            border: 1px solid var(--border-line);
            height: 35px;
            line-height: 35px;
            margin-top: 13px;
            font-size: 15px;
            border-radius: 5px;
            color: #82848a;

            .iconfont {
              font-weight: 700;
              margin: 0 5px;
            }

            span {
              border: 1px solid var(--border-line);
              border-radius: 3px;
              padding: 2px 2px;
              margin-left: 15px;
              background-color: var(--background-color);
            }
          }
        }
      }

      .articleBtn {
        position: absolute;
        right: 150px;
        top: 0;
        ::v-deep(.el-dropdown) {
          right: 0;
          top: 14px;
        }

        .sendBtn {
          align-items: center;
          display: flex;
          background: linear-gradient(135deg, #60e464 10%, #5cb85b 100%);
          border-radius: 50px;
          padding: 5px 10px 5px 10px;
          border: none;
          color: #fff;
        }
      }

      .noticeBtn {
        position: absolute;
        right: 110px;
        top: 0;
        ::v-deep(.el-dropdown) {
          right: 0;
          top: 20px;
        }
        svg {
          width: 20px;
          height: 20px;
        }

        i {
          font-size: 1.5rem;
          color: var(--article-color);
        }
      }

      .userInfo {
        position: absolute;
        right: 50px;
        top: 0;

        ::v-deep(.el-dropdown) {
          right: 0;
          top: 8px;
        }

        img {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          border: 1px solid var(--border-line);
          position: absolute;
        }
      }
    }
  }
}
</style>
