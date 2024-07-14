<template>
  <div class="user-main container">
    <div class="user-warpper">
      <div class="userBox">
        <div class="backgroupImg">
          <img v-lazy="user.bjCover" :key="user.bjCover" />

          <el-row class="top-btn">
            <el-col :span="6">
              <div class="grid-content ep-bg-purple">
                <a @click="switchTab(0)" class="topBtnItem hand-style">
                  <div>{{ count.article }}</div>
                  文章
                </a>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="grid-content ep-bg-purple-light">
                <a @click="switchTab(1)" class="topBtnItem hand-style">
                  <div>{{ count.collect }}</div>
                  收藏
                </a>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="grid-content ep-bg-purple">
                <a class="topBtnItem hand-style">
                  <div>{{ count.followed }}</div>
                  关注
                </a>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="grid-content ep-bg-purple">
                <a class="topBtnItem hand-style">
                  <div>0</div>
                  勋章
                </a>
              </div>
            </el-col>
          </el-row>

          <div class="more hand-style">
            <div class="menu">
              <ul>
                <li @click="handleUpdateInfoBefor">
                  <svg-icon name="edit"></svg-icon> 修改资料
                </li>
                <li @click="loadMoreData">
                  <svg-icon name="xiangqing"></svg-icon> 更多资料
                </li>
                <li>
                  <el-upload
                    class="avatar-uploader"
                    :show-file-list="false"
                    name="filedatas"
                    :action="uploadPictureHost"
                    :http-request="uploadBjCoverFile"
                    :before-upload="openLoading"
                    multiple
                  >
                    <svg-icon name="photo"></svg-icon> 修改封面
                  </el-upload>
                </li>
                <li @click="feedbackDialogTableVisible = true">
                  <svg-icon name="feedback"></svg-icon> 添加反馈
                </li>
              </ul>
            </div>
            <el-icon><More /></el-icon>
          </div>
        </div>
        <div class="user-item sy-display-flex-center">
          <div class="toolbar">
            <img class="cover" :src="user.avatar" alt="" />
          </div>
          <div class="userInfo">
            <div class="nickname">
              昵称：<span>{{ user.nickname }}</span>
              <el-tooltip
                class="item"
                effect="dark"
                content="LV1"
                placement="top"
              >
                <span>
                  <svg-icon name="level1"></svg-icon>
                </span>
              </el-tooltip>
            </div>
            <div class="desc">
              个人简介：{{
                user.intro ? user.intro : "这家伙很懒，什么都没有写..."
              }}
            </div>
          </div>
          <div class="sign">
            <button
              :class="
                !isTodaySign
                  ? 'signBtn hand-style'
                  : 'disabledSignBtn hand-style'
              "
              :disabled="isTodaySign"
              @click="handleSign"
            >
              <svg-icon name="sign1"></svg-icon>
              <span>{{ isTodaySign ? "今天已签到" : "立即签到" }}</span>
            </button>
          </div>
        </div>
      </div>
      <div class="bottom-box">
        <div class="title">
          <ul>
            <li
              ref="btnRef"
              :class="index == 0 ? 'active hand-style' : 'hand-style '"
              @click="switchTab(index)"
              v-for="(item, index) in btnList"
              :key="index"
            >
              <span class="item-title sy-display-flex-center">
                <el-icon style="margin-right: 3px">
                  <component :is="item.icon" />
                </el-icon>
                {{ item.name }}
              </span>
            </li>
          </ul>
        </div>

        <div class="articleBox" v-if="dataList.length">
          <div class="articleItem">
            <div
              class="article"
              @mouseleave="item.showOpeBotton = false"
              @mouseenter="item.showOpeBotton = true"
              v-for="(item, index) in dataList"
              :key="index"
            >
              <router-link :to="'/article/' + item.id">
                <div class="article-cover hand-style">
                  <img v-lazy="item.avatar" :key="item.avatar" />
                </div>
              </router-link>

              <div class="article-info">
                <div>
                  <router-link :to="'/article/' + item.id">
                    <div class="article-title xiahuaxian">
                      {{ item.title }}
                    </div>
                  </router-link>

                  <div>
                    <el-text line-clamp="2">
                      {{ item.summary }}
                    </el-text>
                  </div>
                </div>

                <div class="article-bottom sy-display-flex-center">
                  <div class="article-desc-tag sy-display-flex-center">
                    <span class="time">
                      发布博客 {{ item.formatCreateTime }}
                    </span>

                    <el-tag
                      class="hand-style"
                      @click="handleClike(item.categoryId, '/category')"
                    >
                      <el-icon><FolderOpened /></el-icon>
                      {{ item.categoryName }}
                    </el-tag>

                    <el-tag
                      class="hand-style"
                      :type="tagStyle[Math.round(Math.random() * 4)]"
                      @click="handleClike(tag.id, '/tags')"
                      v-for="(tag, index) in item.tagList"
                      :key="index"
                    >
                      <el-icon><CollectionTag /></el-icon>
                      {{ tag.name }}</el-tag
                    >
                  </div>

                  <div class="opeBotton" v-if="item.showOpeBotton">
                    <div v-if="pageData.index == 0">
                      <el-button
                        type="primary"
                        link
                        @click="handleUpdateArticle(item.id)"
                        >修改</el-button
                      >
                      <el-button
                        type="danger"
                        link
                        @click="handleDeleteArticle(index, item.id)"
                        >删除</el-button
                      >
                    </div>

                    <el-button
                      v-if="pageData.index == 1"
                      type="danger"
                      link
                      @click="handleCanCollect(index, item.id)"
                      >取消收藏</el-button
                    >
                  </div>
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
        <div v-else>
          <sy-empty />
        </div>
      </div>
    </div>
    <el-dialog
      title="个人信息"
      center
      v-model="dialogTableVisible"
      :lock-scroll="false"
      :close-on-click-modal="false"
    >
      <div style="">
        <div class="dialogItem item">
          <span> 昵称：{{ form.nickname }} </span>
          <span> 简介：{{ form.intro }} </span>
        </div>

        <div class="dialogItem item">
          <span> 邮箱： {{ form.email }} </span>
          <span> 性别： 保密 </span>
        </div>
        <div class="dialogItem item">
          <span> 地址： {{ form.address }} </span>
          <span> 个人网站： {{ form.webSite }} </span>
        </div>
        <div class="item">注册时间：{{ form.registerTime }}</div>
        <div class="item">最后登录：{{ form.lastLoginTime }}</div>
      </div>
    </el-dialog>

    <!-- 修改资料弹出框 -->
    <el-dialog
      title="修改资料"
      center
      v-model="editDialogTableVisible"
      :lock-scroll="false"
      :close-on-click-modal="false"
    >
      <el-form label-position="left" label-width="60px" :model="form">
        <el-form-item label="头像：">
          <el-upload
            class="avatar-uploader"
            :show-file-list="false"
            name="filedatas"
            :action="uploadPictureHost"
            :http-request="uploadSectionFile"
            :before-upload="openLoading"
            multiple
          >
            <img v-if="form.avatar" :src="form.avatar" class="imgAvatar" />
            <el-icon v-else><Plus /></el-icon>
          </el-upload>
        </el-form-item>
        <el-form-item label="昵称：">
          <el-input v-model="form.nickname"></el-input>
        </el-form-item>
        <el-form-item label="简介：">
          <el-input v-model="form.intro"></el-input>
        </el-form-item>
        <el-form-item label="站点：">
          <el-input v-model="form.webSite"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button type="primary" @click="doUpdateUserInfo">提交</el-button>
      </template>
    </el-dialog>

    <!-- 添加反馈弹出框 -->
    <el-dialog
      title="添加反馈"
      center
      v-model="feedbackDialogTableVisible"
      :lock-scroll="false"
      :close-on-click-modal="false"
    >
      <el-form
        label-position="left"
        label-width="100px"
        :model="form"
        :rules="rules"
        ref="feedbackFormRef"
      >
        <el-form-item label="反馈类型:" prop="type">
          <el-radio v-model="form.type" label="1">需求</el-radio>
          <el-radio v-model="form.type" label="2">缺陷</el-radio>
        </el-form-item>
        <el-form-item label="反馈标题:" prop="title">
          <el-input v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="详细内容：" prop="content">
          <el-input v-model="form.content"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button type="primary" @click="doAddFeedback">提交</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import {
  updateUserInfo,
  getUserInfo,
  upload,
  getArticleByUserId,
  deleteMyArticle,
  addFeedback,
  getUserCount,
} from "@/api";
import { cancelCollect, getCollect } from "@/api/collect";
import { sign, validateTodayIsSign } from "@/api/sign";
import { useUserStore } from "@/store/moudel/user.js";
import { ElMessageBox } from "element-plus";

const { proxy } = getCurrentInstance();
const router = useRouter();
const userStore = useUserStore();
const user = ref(userStore.getUserInfo);
const uploadPictureHost = ref(
  import.meta.env.Vite_APP_BASE_API + "/file/upload"
);
const dataList = ref([]);
const pageData = ref({
  pageNo: 1,
  pageSize: 10,
  index: 0,
});
const pages = ref(0);
const statusList = ref(["下架", "上架", "待审核", "草稿"]);
const statusStyle = ref(["#F56C6C", "#67C23A", "#909399", "#E6A23C"]);
const form = ref({});
const files = ref({});
const dialogTableVisible = ref(false);
const editDialogTableVisible = ref(false);
const feedbackDialogTableVisible = ref(false);
const tagStyle = ref(["success", "warning", "danger", "info"]);
const btnList = ref([
  {
    icon: "Document",
    name: "文章",
  },
  {
    icon: "Star",
    name: "收藏",
  },
]);
const today = ref(
  new Date().getFullYear() +
    "-" +
    (new Date().getMonth() + 1 < 10
      ? "0" + (new Date().getMonth() + 1)
      : new Date().getMonth() + 1) +
    "-" +
    (new Date().getDate() < 10
      ? "0" + new Date().getDate()
      : new Date().getDate())
);
const isTodaySign = ref(false);
const rules = ref({
  title: [{ required: true, message: "请输入反馈标题", trigger: "blur" }],
  type: [{ required: true, message: "请选择反馈类型", trigger: "blur" }],
  content: [{ required: true, message: "请输入反馈详细内容", trigger: "blur" }],
});
const count = ref({
  article: 0,
  collect: 0,
  followed: 0,
});
const loading = ref(false);
const btnRef = ref();
const feedbackFormRef = ref();

//获取用户的文章、粉丝等数据
function getCount() {
  getUserCount().then((res) => {
    let obj = {
      article: res.articleCount,
      collect: res.collectCount,
      followed: res.followedCount,
    };
    count.value = obj;
  });
}

//添加反馈
function doAddFeedback() {
  feedbackFormRef.value.validate((valid) => {
    if (valid) {
      addFeedback(form.value).then((res) => {
        proxy.$modal.msgSuccess("反馈成功");
        feedbackDialogTableVisible.value = false;
        form.value = {};
      });
    } else {
      console.log("error submit!!");
      return false;
    }
  });
}

//校验今天是否签到
function handleValidateTodayIsSign() {
  validateTodayIsSign().then((res) => {
    if (res.data != null) {
      isTodaySign.value = true;
    }
  });
}
//签到
function handleSign() {
  sign(today.value).then((res) => {
    isTodaySign.value = true;
    proxy.$modal.msgSuccess("签到成功");
  });
}

//更新store的用户信息
function updateStoreUser() {
  userStore.setUserInfo(user);
}

//修改用户信息
function doUpdateUserInfo() {
  updateUserInfo(form.value).then((res) => {
    user.value = form.value;
    proxy.$modal.msgSuccess("修改成功");
    updateStoreUser();
    editDialogTableVisible.value = false;
  });
}
//跳转分类或标签
function handleClike(id, path) {
  router.push({ path: path, query: { id: id } });
}

//修改用户信息
function handleUpdateInfoBefor() {
  handleGetUserInfo();
  editDialogTableVisible.value = true;
}

//加载更多资料
function loadMoreData() {
  handleGetUserInfo();
  dialogTableVisible.value = true;
}

//获取用户信息
function handleGetUserInfo() {
  getUserInfo().then((res) => {
    form.value = res.data;
  });
}
//更新文章
function handleUpdateArticle(id) {
  router.push({ path: "/newposts", query: { id: id } });
}

//取消收藏文章
function handleCanCollect(index, id) {
  ElMessageBox.confirm("确认取消收藏该文章吗？", "提示", {
    lockScroll: false,
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then((_) => {
      cancelCollect(id).then((res) => {
        dataList.value.splice(index, 1);
        proxy.$modal.msgSuccess("取消成功");
      });
    })
    .catch((_) => {
      proxy.$modal.msg("取消操作");
    });
}

//删除文章
function handleDeleteArticle(index, id) {
  ElMessageBox.confirm("确认删除该文章吗?", "提示", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      deleteMyArticle(id).then((res) => {
        dataList.value.splice(index, 1);
        proxy.$modal.msgSuccess("删除成功");
      });
    })
    .catch(() => {
      proxy.$modal.msg("取消操作");
    });
}
function handlePage() {
  pageData.value.pageNo++;
  loadBefore();
}
//顶部统计切换点击
function switchTab(index) {
  if (pageData.value.index == index) {
    return;
  }
  for (var i = 0; i < btnRef.value.length; i++) {
    btnRef.value[i].className = "hand-style";
  }
  btnRef.value[index].className = "active";
  dataList.value = [];
  pageData.value.pageNo = 1;
  pageData.value.index = index;
  loadBefore();
}

//切换按钮之前的操作
function loadBefore() {
  switch (pageData.value.index) {
    case 0:
      selectAricleList();
      break;
    case 1:
      selectCollectionList();
      break;
    default:
      selectAricleList();
      break;
  }
}

//获取所有文章
function selectAricleList(type) {
  openLoading();
  if (type) {
    pageData.value.type = type;
  }
  getArticleByUserId(pageData.value)
    .then((res) => {
      dataList.value.push(...res.rows);
      pages.value = res.data.pages;
      closeLoading();
    })
    .catch((err) => {
      closeLoading();
    });
}

//收藏列表
function selectCollectionList() {
  getCollect(pageData.value).then((res) => {
    dataList.value.push(...res.rows);
    pages.value = res.data.pages;
  });
}

//修改背景图
function uploadBjCoverFile(param) {
  files.value = param.file;
  // FormData 对象
  var formData = new FormData();
  // 文件对象
  formData.append("file", files.value);
  formData.append("path", "avatar.cover");
  upload(formData)
    .then((res) => {
      let obj = {
        id: user.value.id,
        bjCover: res.data.url,
      };
      updateUserInfo(obj)
        .then((ress) => {
          user.value.bjCover = res.data;
          updateStoreUser();
          proxy.$modal.msgSuccess("修改成功");
          closeLoading();
        })
        .catch((err) => {
          closeLoading();
        });
    })
    .catch((err) => {
      closeLoading();
    });
}

//上传文件
function uploadSectionFile(param) {
  files.value = param.file;
  // FormData 对象
  var formData = new FormData();
  // 文件对象
  formData.append("file", files.value);
  formData.append("path", "avatar");
  upload(formData)
    .then((res) => {
      form.value.avatar = res.data.url;
      closeLoading();
    })
    .catch((err) => {
      closeLoading();
    });
}
//打开加载框
function openLoading() {
  loading.value = true;
}
//关闭加载框
function closeLoading() {
  loading.value = false;
}
selectAricleList();
handleValidateTodayIsSign();
getCount();
</script>

<style lang='scss' scoped>
.imgAvatar {
  width: 80px;
  height: 80px;
}

::v-deep(.el-dialog) {
  .el-dialog__body {
    padding: 10px 20px;
  }

  .item {
    margin-bottom: 10px;
  }

  .dialogItem {
    display: flex;

    span {
      width: 50%;
    }
  }
}

.user-main {
  @media screen and (max-width: 1118px) {
    padding: 10px;

    ::v-deep(.el-dialog) {
      .dialogItem {
        display: flex;

        span {
          width: 50%;
        }
      }
    }

    .backgroupImg img {
      height: 200px;
    }

    .user-item .toolbar {
      margin-left: 20px;
      width: 100px;
    }

    .sign {
      display: none;
    }

    .user-warpper {
      width: 100%;
    }

    .article-cover {
      display: none;
    }
    .article-desc-tag {
      width: 100%;
          flex-wrap: wrap;
    }
  }

  @media screen and (min-width: 1119px) {
    ::v-deep(.el-dialog) {
      width: 30%;
      border-radius: 10px;

      .dialogItem {
        display: flex;

        span {
          width: 50%;
        }
      }
    }

    .backgroupImg img {
      height: 400px;
    }

    .user-item .toolbar {
      margin-left: 50px;
      width: 150px;
    }

    .user-warpper {
      width: 60%;
    }

    .article-cover {
      width: 200px;
      height: 120px;
      overflow: hidden;

      img {
        height: 100%;
        width: 100%;
        transition: all 0.5s;
      }

      &:hover {
        img {
          transform: scale(1.1);
        }
      }
    }

    .sign {
      position: absolute;
      right: 50px;
      padding: 5px;
      border-radius: 5px;

      .signBtn,
      .disabledSignBtn {
        border: none;

        color: var(--text-color);
        background-color: var(--background-color);
      }

      .signBtn {
        &:hover {
          color: var(--theme-color);
        }
      }

      .disabledSignBtn {
        cursor: no-drop;
      }

      svg {
        width: 20px;
        height: 20px;
        vertical-align: -4px;
        margin-right: 5px;
      }
    }
    .article-desc-tag {
      width: 70%;
    }
  }

  .user-warpper {
    display: flex;
    flex-direction: column;
    margin-top: 80px;
  }

  .userBox {
    background-color: var(--background-color);

    .backgroupImg {
      position: relative;
      width: 100%;

      .top-btn {
        width: 100%;
        position: absolute;
        top: 0;
        display: flex;
        background: linear-gradient(
          90deg,
          rgba(220, 233, 242, 0.5),
          rgba(255, 255, 255, 0.5),
          rgba(220, 233, 242, 0.4)
        );
        text-align: center;
      }

      img {
        width: 100%;
      }

      .more {
        position: absolute;
        right: 20px;
        bottom: 10px;

        font-size: 20px;
        background-color: #90939987;
        border-color: #909399;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        text-align: center;
        color: #fff;

        i {
          margin-top: 5px;
        }

        .menu {
          background-color: var(--background-color);
          color: var(--text-color);
          padding: 10px 0;
          border-radius: 5px;
          font-size: 0.9rem;
          text-align: center;
          position: absolute;
          right: -15px;
          bottom: 30px;
          display: none;
          animation: fade-in 0.3s linear 1;
          width: 120px;

          @keyframes fade-in {
            0% {
              transform: scale(0);
            }

            100% {
              transform: scale(1);
            }
          }

          ul {
            list-style: none;
          }

          li {
            padding: 5px;
            transition: transform 0.35s !important;

            &:hover {
              color: var(--theme-color);
              transform: translateX(6px);
            }

            svg {
              width: 20px;
              height: 20px;
              vertical-align: -5px;
            }
          }
        }

        &:hover {
          background-color: #909399;

          .menu {
            display: block;
          }
        }
      }
    }

    .user-item {
      height: 80px;
      margin-bottom: 20px;
      position: relative;

      .toolbar {
        padding: 5px;
        background-color: var(--background-color);
        border-radius: 5px;
        margin-top: -80px;
      }

      .cover {
        object-fit: cover;
        width: 100%;
        height: 100%;
      }

      .userInfo {
        margin: 20px;
        color: var(--article-color);
        font-style: italic;

        .nickname {
          margin-bottom: 10px;

          svg {
            width: 35px;
            height: 35px;
            vertical-align: -12px;
          }

          span {
            margin-right: 5px;
            font-weight: 700;
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
        }

        .desc {
          font-size: 0.9rem;
        }
      }
    }
  }

  .bottom-box {
    border-radius: 10px;
    margin-top: 20px;
    min-height: 500px;

    .title {
      padding: 10px;

      ul {
        display: flex;
        list-style: none;

        li {
          margin-right: 20px;
          color: var(--text-color);

          &:hover {
            color: var(--theme-color);
          }

          .item-title {
            margin-right: 5px;
          }
        }

        .active {
          color: var(--theme-color);
          font-weight: 700;
          font-style: italic;
        }
      }

      border-bottom: 1px solid var(--border-line);
    }

    .btnBox {
      padding: 10px;

      .btn {
        display: inline-block;
        margin-right: 10px;
        background-color: rgba(136, 136, 136, 0.1);
        padding: 6px;
        border-radius: 5px;
        font-size: 0.9rem;
        color: var(--text-color);

        &:hover {
          background-color: var(--theme-color);
          color: #fff;
        }
      }
    }

    .articleBox {
      height: 100%;
      padding-top: 10px;

      .article {
        display: flex;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        margin-left: 10px;
        background-color: var(--background-color);
        overflow: hidden;
        .status {
          padding: 2px 30px;
          width: 80px;
          position: absolute;
          right: -50px;
          top: 5px;
          opacity: 0.8;
          transform: rotate(45deg);
          color: #fff;
          text-align: center;
        }

        .articleBtn {
          position: absolute;
          right: 0;
          display: none;
        }

        &:hover {
          .articleBtn {
            display: block;
          }

          background-color: #9093994a;
        }

        .article-info {
          margin-left: 20px;
          width: 70%;
          position: relative;
          display: flex;
          justify-content: space-between;
          flex-direction: column;
          flex: 1;

          a {
            text-decoration: none;
            color: var(--article-color);
          }

          .article-title {
            font-size: 1.1rem;
            font-weight: 600;
            -webkit-line-clamp: 1;
            margin-bottom: 10px;
            width: fit-content;
            &:hover {
              color: var(--theme-color);
            }
          }

          .article-title,
          .article-desc {
            display: -webkit-box;
            -webkit-box-orient: vertical;

            overflow: hidden;
            text-overflow: ellipsis;
          }

          .article-desc {
            -webkit-line-clamp: 3;
            margin-bottom: 10px;
            margin-top: 5px;
            color: var(--text-color);
            min-height: 60px;
          }

          .article-bottom {
            justify-content: space-between;

            .article-desc-tag {
              .time {
                margin-right: 15px;
                color: #555666;
                i {
                  vertical-align: -2px;
                }
              }
              .el-tag {
                margin-right: 5px;
              }
            }
          }

          .article-user {
            margin-top: 10px;

            .nickname {
              color: var(--theme-color);
            }

            .item {
              padding: 0 5px;
              color: var(--text-color);

              i {
                margin-right: 5px;
              }
            }
          }
        }
      }
    }
  }
}
</style>
