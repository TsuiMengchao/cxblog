<template>
  <div>
    <el-drawer
      class="nav"
      direction="ltr"
      :with-header="false"
      v-model="dialogVisible"
      :show-close="false"
    >
      <!-- 内容 -->
      <div class="warpper">
        <!-- 博主介绍 -->
        <div class="blogger-info">
          <el-avatar :src="siteStore.getWebInfo.authorAvatar"></el-avatar>
        </div>

        <hr />
        <!-- 页面导航 -->
        <div class="menu-container">
          <div class="menus-item">
            <a @click="handleClike('/')">
              <el-icon><House /></el-icon>首页
            </a>
          </div>
          <div class="menus-item">
            <a @click="handleClike('/archive')">
              <el-icon><Folder /></el-icon>归档
            </a>
          </div>

          <div class="menus-item">
            <a @click="handleClike('/category')">
              <el-icon><Film /></el-icon>分类
            </a>
          </div>
          <div class="menus-item">
            <a @click="handleClike('/tags')">
              <el-icon><DocumentRemove /></el-icon>标签
            </a>
          </div>
          <div class="menus-item">
            <a @click="handleClike('/message')">
              <el-icon><Message /></el-icon>留言
            </a>
          </div>
          <div class="menus-item">
            <a @click="handleClike('/say')">
              <el-icon><ChatLineRound /></el-icon>说说
            </a>
          </div>
          <div class="menus-item">
            <a @click="handleClike('/link')">
              <el-icon><Link /></el-icon>友链
            </a>
          </div>
          <div class="menus-item">
            <a @click="handleClike('/about')">
              <el-icon><InfoFilled /></el-icon>关于
            </a>
          </div>

          <div class="menus-item" v-if="!isLogin">
            <a @click="openLogin"><el-icon><User /></el-icon>登录 </a>
          </div>
          <div v-else>
            <div class="menus-item">
              <a @click="handleClike('/user')"
                ><el-icon><User /></el-icon>个人中心
              </a>
            </div>
            <div class="menus-item">
              <a @click="handleLogout"
                ><el-icon><CircleClose /></el-icon>退出</a
              >
            </div>
          </div>
        </div>
      </div>
    </el-drawer>
  </div>
</template>

<script setup name='SideNavBar'>
import { logout } from "@/api";
import { removeToken, getToken } from "@/utils/cookie";
import { useSiteStore } from "@/store/moudel/site.js";
import { useUserStore } from "@/store/moudel/user.js";

const router = useRouter();
const route = useRoute();
const siteStore = useSiteStore();
const userStore = useUserStore();
const { proxy } = getCurrentInstance();

//控制框显示的方法
const dialogVisible = computed({
  get() {
    return siteStore.getNavBarDialogVisible;
  },
  set(value) {
    siteStore.setNavBarDialogVisible(value);
  },
});

function handleClike(val) {
  siteStore.setNavBarDialogVisible(false);
  router.push({ path: val });
}
function close() {
  siteStore.setNavBarDialogVisible(false);
}
function openLogin() {
  userStore.setLoginFlag(true);
}
function handleLogout() {
  //如果在个人中心则跳回上一页
  if (route.path === "/user") {
    router.go(-1);
  }
  logout()
    .then((res) => {
      removeToken();
      location.reload();
      proxy.$modal.msgSuccess("注销成功");
    })
    .catch((err) => {
      console.log(err);
    });
}
</script>

<style lang="scss" scoped>
::v-deep(.el-drawer) {
  width: 55% !important;
}

a {
  color: var(--text-color);
}

.nav {
  .warpper {
    font-weight: 700;
    font-size: 1.2rem;
    background-color: var(--background-color);

    .blogger-info {
      padding: 10px 30px 0;
      text-align: center;
      z-index: 99;

      ::v-deep(.el-avatar) {
        width: 80px;
        height: 80px;
      }
    }

    .blog-info-wrapper {
      display: flex;
      align-items: center;
      padding: 12px 10px 0;

      .blog-info-data {
        flex: 1;
        line-height: 2;
        text-align: center;

        a {
          text-decoration: none;
        }
      }
    }

    hr {
      border: 2px dashed #d2ebfd;
      margin: 20px 0;
    }

    .menu-container {
      padding: 0 10px 40px;
      overflow: scroll;

      .menus-item {
        a {
          padding: 6px 30px;
          display: block;
          line-height: 2;
          text-decoration: none;
        }

        i {
          margin-right: 1rem;
        }
      }
    }
  }
}

@keyframes sidebarItem {
  0% {
    transform: translateX(200px);
  }

  100% {
    transform: translateX(0);
  }
}
</style>
