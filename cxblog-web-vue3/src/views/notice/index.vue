<template>
  <div class="sysnotice container" v-loading.fullscreen.lock="loading">
    <div class="notice-container">
      <div class="rigth-toolbar">
        <div class="rigth-top">
          <div class="top-title"> 消息中心 </div>

          <el-tabs
            v-model="activeName"
            class="demo-tabs"
            @tab-click="handleTabClick"
          >
            <el-tab-pane
              v-for="(item, index) in leftIems"
              :name="index"
              :key="index"
            >
              <template #label>
                <span class="custom-tabs-label">
                  <el-icon style="margin-right:3px">
                    <component :is="item.icon" />
                  </el-icon>
                  <span>{{item.name}}</span>
                </span>
              </template>
            </el-tab-pane>
          </el-tabs>
        </div>

        <div v-if="noticeList.length" class="box" :key="refreshkey">
          <div class="item-top">
            <div class="item-count">共{{ noticeList.length }}条内容</div>
            <span class="clearAllBtn hand-style" @click="clearMessage(null)">
              <el-icon><Delete /></el-icon> 清空所有消息
            </span>
          </div>
          <div>
            <div
              class="rigth-bottom"
              v-for="(item, index) in noticeList"
              :key="index"
            >
              <div class="user-info">
                <img
                  v-if="item.noticeType"
                  class="avatar"
                  :src="item.fromUserAvatar"
                  alt=""
                />
                <img
                  v-else
                  class="avatar"
                  :src="siteStore.getWebInfo.logo"
                  alt=""
                />
                <span class="nickname" v-if="item.noticeType">{{
                  item.fromUserNickname
                }}</span>
                <span class="nickname" v-else>系统</span>
                <span class="user-item" v-if="item.noticeType">
                  <i class="el-icon-location"></i> IP属地:{{
                    splitIpAddress(item.ipSource)
                  }}
                </span>
                <span class="user-item">
                  <i class="el-icon-time"></i> {{ item.createTimeStr }}
                </span>
                <span class="user-item" v-if="item.commentMark == 1">
                  <i class="el-icon-link"></i> 在文章
                  <router-link :to="'/article/' + item.articleId">
                    <span class="title hand-style">
                      {{ item.articleTitle }}
                    </span>
                  </router-link>
                  中，回复了你的评论
                </span>
                <span class="user-item" v-if="item.commentMark == 2">
                  <i class="el-icon-link"></i>
                  评论了你的文章:
                  <router-link :to="'/article/' + item.articleId">
                    <span class="title hand-style">
                      {{ item.articleTitle }}
                    </span>
                  </router-link>
                </span>
                <span
                  class="clearBtn hand-style"
                  @click="clearMessage(item.id, index)"
                >
                  <el-icon><Delete /></el-icon>
                </span>
              </div>
              <div class="content-box">
                <div
                  class="imContentItem"
                  v-if="item.noticeType <= 1"
                  v-html="item.content"
                ></div>

                <div v-if="item.noticeType == 2">关注了你</div>
                <div v-if="item.noticeType == 3">
                  点赞了你的文章
                  <router-link :to="'/article/' + item.articleId">
                    <span class="title hand-style"
                      >" {{ item.articleTitle }} "</span
                    >
                  </router-link>
                </div>
                <div v-if="item.noticeType == 4">
                  收藏了你的文章
                  <router-link :to="'/article/' + item.articleId">
                    <span class="title hand-style"
                      >" {{ item.articleTitle }} "
                    </span>
                  </router-link>
                </div>
              </div>
            </div>
          </div>
          <!-- 分页按钮 -->
          <sy-pagination
            :pageNo="pageData.pageNo"
            :pages="pages"
            @changePage="handlePage"
          />
        </div>

        <div class="empty-box" v-else>
          <sy-empty message="暂未新通知哦" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup name='notice'>
import { getMessageNotice, deleteMessage } from "@/api/im";
import { useSiteStore } from "@/store/moudel/site.js";
import { ElMessageBox } from "element-plus";

const { proxy } = getCurrentInstance();
const siteStore = useSiteStore();
const route = useRoute();
const pageData = ref({
  pageNo: 1,
  pageSize: 10,
  type: route.query.type ? route.query.type : 0,
});
const pages = ref(0);
const refreshkey = ref(0);
const leftIems = ref([
  {
    name: "系统通知",
    icon: "Bell",
  },
  {
    name: "文章评论",
    icon: "ChatDotRound",
  },
  {
    name: "用户关注",
    icon: "UserFilled",
  },
  {
    name: "文章点赞",
    icon: "Pointer",
  },
  {
    name: "文章收藏",
    icon: "Star",
  },
]);
const title = ref("系统");
const noticeList = ref([]);
const leftIemRef = ref();
const activeName = ref(route.query.type ? Number(route.query.type) : 0);
const loading = ref(true);

//分页
function handlePage(val) {
  pageData.value.pageNo = val;
  getList();
}
function handleTabClick(tab, event) {
  pageData.value.type = tab.index;
  pageData.value.pageNo = 1;
  noticeList.value = [];
  getList();
}
//删除消息
function clearMessage(id, index) {
  ElMessageBox.confirm("此操作将永久删除消息, 是否继续?", "提示", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      let params = {
        id: id,
        type: pageData.value.type,
      };
      deleteMessage(params)
        .then((res) => {
          if (index != null) {
            noticeList.value.splice(index, 1);
          } else {
            noticeList.value = [];
          }
          proxy.$modal.msgSuccess("删除成功");
        })
        .catch((err) => {});
    })
    .catch(() => {
      proxy.$modal.msg("Delete canceled");
    });
}
function handleArticleClick(id) {
  router.push({ path: "articleInfo", query: { articleId: id } });
}
//截取地址
function splitIpAddress(address) {
  return address.split("|")[1];
}

function getList() {
  loading.value = true;
  getMessageNotice(pageData.value)
    .then((res) => {
      noticeList.value.push(...res.rows);
      pages.value = res.data.pages;
      loading.value = false;
    })
    .catch((err) => {
      loading.value = false;
    });
}

title.value = leftIems.value[pageData.value.type].name;
getList();
</script>

<style lang='scss' scoped>
::v-deep(.el-tabs__nav-wrap::after) {
  background-color: unset !important;
}
.el-icon {
  vertical-align: -2px;
}
@media screen and (max-width: 1118px) {
  .sysnotice {
    padding: 5px;

    .notice-container {
      margin-top: 60px;
      width: 100%;

      .avatar {
        width: 30px;
        height: 30px;
      }
    }
  }
}

@media screen and (min-width: 1119px) {
  .sysnotice {
    .notice-container {
      margin-top: 80px;
      width: 60%;

      .avatar {
        width: 50px;
        height: 50px;
      }
    }
  }
}

.sysnotice {
  .notice-container {
    padding: 20px;
    display: flex;
    border-radius: 5px;
    color: var(--article-color);

    .clearBtn {
      float: right;
    }

    .rigth-toolbar {
      padding: 20px;
      margin-left: 10px;
      width: 100%;
      background-color: var(--background-color);
      border-radius: 5px;

      .rigth-top {
        padding-bottom: 5px;

        .top-title {
          font-weight: 700;
          margin-bottom: 15px;
          font-size: 1.1rem;
        }
      }

      .box {
        padding-right: 15px;
        .item-top {
          display: flex;
          justify-content: space-between;
          margin-bottom: 20px;
          color: var(--theme-color);
          .item-count {
            color: #a1a1a1;
          }
        }
      }

      .rigth-bottom {
        margin-top: 10px;
        border-bottom: 2px dashed var(--border-line);

        &:last-child {
          border-bottom: 0;
        }

        .user-info {
          position: relative;

          .avatar {
            vertical-align: middle;
            border: 1px solid var(--border-line);
            margin-right: 5px;
            border-radius: 50%;
          }

          .nickname {
            font-weight: 600;
            color: var(--theme-color);
          }

          .user-item {
            margin-left: 10px;
            color: var(--text-color);
            font-size: 0.8rem;

            a {
              text-decoration: none;
            }
          }

          .clearBtn {
            line-height: 50px;
          }
        }

        .title {
          font-weight: 600;
          font-style: italic;

          &:hover {
            color: var(--theme-color);
          }
        }

        .content-box {
          margin-left: 50px;
          margin-top: 20px;

          padding-bottom: 20px;
          color: var(--text-color);

          ::v-deep(a) {
            text-decoration: none;
          }
        }
      }
    }
  }
}
</style>
