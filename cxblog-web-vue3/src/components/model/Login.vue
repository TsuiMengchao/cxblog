<template>
  <div>
    <el-dialog
      :lock-scroll="false"
      :close-on-click-modal="false"
      class="dialog"
      center
      :title="title"
      v-model="dialogFormVisible"
    >
      <!-- 账号登录 -->
      <div v-if="index === 1">
        <el-form :model="form" :rules="rules" ref="formRef">
          <el-form-item label="用户名" :label-width="formLabelWidth" prop="用户名">
            <el-input
              v-model="form.username"
              placeholder="请输入账号/邮箱/手机号"
              @keyup.enter="handkeyEnter"
            />
          </el-form-item>
          <el-form-item
            label="密码"
            :label-width="formLabelWidth"
            prop="password"
          >
            <el-input
              placeholder="请输入密码"
              v-model="form.password"
              autocomplete="off"
              @keyup.enter="handkeyEnter"
              show-password
            ></el-input>
          </el-form-item>
        </el-form>
        <el-button type="success" class="loginBtn" @click="login" round
          >登录</el-button
        >

        <div class="regitstBtn">
          <a class="regist hand-style" @click="handleChangeLoginMethod(2)"
            >账号注册</a
          >
          <a class="forget hand-style" @click="handleChangeLoginMethod(3)"
            >忘记密码</a
          >
        </div>

        <div>
          <div class="social-login-title">社交账号登录</div>
          <div class="social-login-wrapper">
            <a
              class="hand-style"
              v-show="isShow(2)"
              @click="openAuthLogin('qq')"
            >
              <svg-icon name="qq" />
            </a>

            <a
              class="hand-style"
              v-show="isShow(4)"
              @click="openAuthLogin('gitee')"
            >
              <svg-icon name="gitee" />
            </a>
            <a
              class="hand-style"
              v-show="isShow(3)"
              @click="openAuthLogin('weibo')"
            >
              <svg-icon name="weibo" />
            </a>
            <a
              class="hand-style"
              v-show="isShow(5)"
              @click="handleChangeLoginMethod(4)"
            >
              <svg-icon name="wechat" />
            </a>
            <a
              class="hand-style"
              v-show="isShow(6)"
              @click="openAuthLogin('github')"
            >
              <svg-icon name="github" />
            </a>
          </div>
        </div>
      </div>

      <!-- 邮箱注册 -->
      <div v-if="index == 2">
        <el-form
          :model="form"
          :rules="rules"
          ref="formRef"
          label-position="left"
        >
          <el-form-item label="邮箱" :label-width="formLabelWidth" prop="email">
            <el-input
              class="input"
              placeholder="请输入邮箱"
              v-model="form.email"
              autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item
            label="昵称"
            :label-width="formLabelWidth"
            prop="username"
          >
            <el-input
              class="input"
              placeholder="请输入用户名（唯一ID）"
              v-model="form.username"
              autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item
            label="密码"
            :label-width="formLabelWidth"
            prop="password"
          >
            <el-input
              class="input"
              placeholder="请输入密码"
              v-model="form.password"
              autocomplete="off"
              show-password
            ></el-input>
          </el-form-item>
          <el-form-item
            label="验证码"
            :label-width="formLabelWidth"
            prop="code"
          >
            <div style="display: flex">
              <el-input
                class="input"
                placeholder="请输入验证码"
                v-model="form.code"
                autocomplete="off"
              ></el-input>
              <a
                v-if="showSendBtnFlag"
                class="send hand-style"
                @click="handleSendEmailCode"
                >发送</a
              >
              <a v-else class="send hand-style">{{ countdown }}s</a>
            </div>
          </el-form-item>
        </el-form>

        <el-button
          type="danger"
          class="loginBtn hand-style"
          @click="register"
          round
          >注册</el-button
        >

        <div class="goLoginBtn">
          已有账号，<a @click="handleChangeLoginMethod(1)" class="hand-style"
            >去登录</a>
          <a @click="handleChangeLoginMethod(5)" class="hand-style" style="float: right"
        >手机号注册</a>
        </div>
      </div>

      <!-- 手机号注册 -->
      <div v-if="index == 5">
        <el-form
            :model="form"
            :rules="rules"
            ref="formRef"
            label-position="left"
        >
          <el-form-item label="手机号" :label-width="formLabelWidth" prop="phone">
            <el-input
                class="input"
                placeholder="请输入手机号"
                v-model="form.phone"
                autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item
              label="昵称"
              :label-width="formLabelWidth"
              prop="username"
          >
            <el-input
                class="input"
                placeholder="请输入用户名（唯一ID）"
                v-model="form.username"
                autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item
              label="密码"
              :label-width="formLabelWidth"
              prop="password"
          >
            <el-input
                class="input"
                placeholder="请输入密码"
                v-model="form.password"
                autocomplete="off"
                show-password
            ></el-input>
          </el-form-item>
          <el-form-item
              label="验证码"
              :label-width="formLabelWidth"
              prop="code"
          >
            <div style="display: flex">
              <el-input
                  class="input"
                  placeholder="请输入验证码"
                  v-model="form.code"
                  autocomplete="off"
              ></el-input>
              <a
                  v-if="showSendBtnFlag"
                  class="send hand-style"
                  @click="handleSendPhoneCode"
              >发送</a
              >
              <a v-else class="send hand-style">{{ countdown }}s</a>
            </div>
          </el-form-item>
        </el-form>

        <el-button
            type="danger"
            class="loginBtn hand-style"
            @click="register"
            round
        >注册</el-button
        >

        <div class="goLoginBtn">
          已有账号，<a @click="handleChangeLoginMethod(1)" class="hand-style"
        >去登录</a>
          <a @click="handleChangeLoginMethod(2)" class="hand-style" style="float: right"
          >邮箱注册</a>
        </div>
      </div>

      <div v-if="index == 3">
        <el-form
          :model="form"
          :rules="rules"
          ref="formRef"
          label-position="left"
        >
          <el-form-item label="邮箱" :label-width="formLabelWidth" prop="email">
            <el-input
              class="input"
              placeholder="请输入邮箱"
              v-model="form.email"
              autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item
            label="新密码"
            :label-width="formLabelWidth"
            prop="password"
          >
            <el-input
              class="input"
              placeholder="请输入密码"
              v-model="form.password"
              autocomplete="off"
              show-password
            ></el-input>
          </el-form-item>
          <el-form-item
            label="验证码"
            :label-width="formLabelWidth"
            prop="code"
          >
            <div style="display: flex">
              <el-input
                class="input"
                placeholder="请输入验证码"
                v-model="form.code"
                autocomplete="off"
              ></el-input>
              <a
                v-if="showSendBtnFlag"
                class="send hand-style"
                @click="handleSendEmailCode"
                >发送</a
              >
              <a v-else class="send">{{ countdown }}s</a>
            </div>
          </el-form-item>
        </el-form>

        <el-button
          type="primary"
          class="loginBtn hand-style"
          @click="handleForgetPassword"
          round
          >修改</el-button
        >

        <div class="goLoginBtn">
          已有账号，<a @click="handleChangeLoginMethod(1)" class="hand-style"
            >去登录</a
          >
        </div>
      </div>

      <div v-if="index == 4">
        <el-image class="wxImg" src="https://cxblog.qiniu.zhaohaoyue.love/web/wechatQr.jpg">
          <template #placeholder>
            <div class="image-slot">加载中<span class="dot">...</span></div>
          </template>
        </el-image>
        <div style="text-align: center">
          <p>扫码关注公众号，回复验证码完成登录</p>
          <p>
            登录验证码：
            <span style="color: red; margin-right: 5px">{{
              wechatLoginCode
            }}</span>
            <el-icon
              style="vertical-align: -3px"
              @click="handleGetWecahtLoginCode()"
              class="el-icon-refresh hand-style"
              ><Refresh
            /></el-icon>
          </p>
        </div>
        <div style="text-align: center; margin-top: 20px">
          <el-button @click="handleChangeLoginMethod(1)">返回登录</el-button>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup name="LoginModel">
import {
  emailLogin,
  wxIsLogin,
  openAuthUrl,
  getWechatLoginCode,
  sendEmailCode,
  emailRegister,
  forgetPassword,
} from "@/api";
import { setUrl, setToken } from "@/utils/cookie.js";
import { useUserStore } from "@/store/moudel/user.js";
import { useSiteStore } from "@/store/moudel/site.js";
import { storeToRefs } from "pinia";

const { proxy } = getCurrentInstance();
const siteStore = useSiteStore();
const userStore = useUserStore();
let { webInfo } = storeToRefs(siteStore);

const code = ref(null);
const timer = ref(null);
const index = ref(1);
const wechatLoginFlag = ref(false);
const title = ref("账号密码登录");
const showSendBtnFlag = ref(true);
const formLabelWidth = ref("80px");
const wechatLoginCode = ref(null);
const countdown = ref(60);

const formRef = ref(null);
const form = ref({
  username: null,
  password: null
});
const rules = {
  username: [{ required: true, message: "请输入账号", trigger: "blur" }],
  password: [{ required: true, message: "请输入密码", trigger: "blur" }],
  code: [{ required: true, message: "请输入验证码", trigger: "blur" }],
};

//控制登录框显示的方法
const dialogFormVisible = computed({
  get() {
    index.value = 1;
    return userStore.getLoginFlag;
  },
  set(value) {
    // 清除 timer，如果存在的话
    if (timer.value) {
      clearInterval(timer.value);
    }
    // 更新 Vuex 中的状态
    userStore.setLoginFlag(value);
  },
});

//切换显示注册 登录 忘记密码页面
function handleChangeLoginMethod(condition) {
  form.value = {};
  if (condition == 1) {
    clearInterval(timer.value);
    title.value = "账号密码登录";
  } else if (condition == 2) {
    title.value = "邮箱注册";
  } else if (condition == 3) {
    title.value = "忘记密码";
  } else if (condition == 4) {
    handleGetWecahtLoginCode();
    title.value = "微信扫码登录";
  } else if (condition == 5) {
    title.value = "手机号注册";
  }
  index.value = condition;
}
//忘记密码
function handleForgetPassword() {
  formRef.value.validate((valid) => {
    if (valid) {
      forgetPassword(form.value).then((res) => {
        proxy.$modal.msgSuccess("修改成功");
        index.value = 1;
      });
    } else {
      console.log("error submit!!");
      return false;
    }
  });
}
//注册
function register() {
  formRef.value.validate((valid) => {
    if (valid) {
      form.value.nickname = "辰雪博客网页用户"
      emailRegister(form.value).then((res) => {
        proxy.$modal.msgSuccess("注册成功");
        index.value = 1;
      });
    } else {
      console.log("error submit!!");
      return false;
    }
  });
}
//发送邮箱验证码
function handleSendEmailCode() {
  if (!form.value.email) {
    proxy.$modal.msgWarning("请输入邮箱");
    return;
  }
  sendEmailCode(form.value.email).then((res) => {
    timer.value = setInterval(() => {
      if (countdown.value > 0) {
        showSendBtnFlag.value = false;
        countdown.value--;
      } else {
        showSendBtnFlag.value = true;
        clearInterval(timer.value);
        timer.value = null;
        countdown.value = 60;
      }
    }, 1000);
    proxy.$modal.msgSuccess("验证码发送成功");
  });
}

//发送手机号验证码
function handleSendPhoneCode() {
  if (!form.value.phone) {
    proxy.$modal.msgWarning("请输入手机号");
    return;
  }
  proxy.$modal.msgError("该功能尚未开发")
}

function close() {
  clearInterval(timer.value);
  userStore.setLoginFlag(false);
  wechatLoginFlag.value = false;
}
//获取微信登录验证码
function handleGetWecahtLoginCode() {
  getWechatLoginCode().then((res) => {
    wechatLoginCode.value = res.data;
    proxy.$modal.msgSuccess("验证码获取成功");
    countdown.value = 60;
    timer.value = setInterval(() => {
      if (countdown.value > 0) {
        countdown.value--;
        // 轮询判断用户是否已经登录
        wxIsLogin(wechatLoginCode.value).then((res) => {
          setToken(res.data.token);
          userStore.setUserInfo(res.data);
          close();
          proxy.$modal.msgSuccess("登录成功");
          window.location.reload();
        });
      } else {
        // 倒计时结束，处理逻辑
        clearInterval(timer.value);
        wechatLoginCode.value = "验证码失效，请刷新获取";
      }
    }, 1000);
  });
}

function isShow(type) {
  return webInfo.value.loginTypeList.indexOf(type) != -1;
}
//Enter事件
function handkeyEnter(event) {
  if (event.keyCode == 13) {
    login();
  }
}
//账号密码登录
function login() {
  formRef.value.validate((valid) => {
    if (valid) {
      //发送登录请求
      emailLogin(form.value).then((res) => {
        setToken(res.data.access_token);
        userStore.setUserInfo(res.data);
        close();
        location.reload();
      });
    } else {
      console.log("error submit!!");
      return false;
    }
  });
}
function openAuthLogin(source) {
  //保留当前路径
  //this.settingUrl();
  openAuthUrl(source).then((res) => {
    window.open(res.data, "_self");
  });
}
// function settingUrl() {
//   if (this.$route.path == "/articleInfo") {
//     setUrl("articleId=" + this.$route.query.articleId);
//   } else {
//     setUrl(this.$route.path);
//   }
// }
</script>

<style lang="scss" scoped>
::v-deep(.el-overlay-dialog) {
  background-image: url(https://cxblog.qiniu.zhaohaoyue.love/web/20231007_1696659441438.jpg) !important;
}
@media screen and (min-width: 1119px) {
  ::v-deep(.el-dialog) {
    width: 23% !important;
    border-radius: 10px !important;
  }
}
.dialog {
  .wxImg {
    width: 50%;
    display: block;
    margin: 0 auto;
  }

  .loginBtn {
    margin-top: 30px;
    text-align: center;
    display: block;
    margin: 0 auto;
    width: 50%;
  }

  .regitstBtn {
    .regist,
    .forget {
      &:hover {
        color: var(--theme-color);
      }
    }

    .forget {
      float: right;
    }
  }

  ::v-deep(.input input) {
    border-top: none !important;
    border-left: none !important;
    border-right: none !important;
  }

  .send {
    width: 18%;
    color: var(--text-color);
    font-size: 14px;
    border: none;
    background-color: var(--background-color);
    margin-left: 10px;
    &:hover {
      color: var(--theme-color);
    }
  }

  .goLoginBtn {
    margin-top: 20px;

    a {
      color: red;
    }
  }

  .social-login-title {
    margin-top: 1.5rem;
    color: #b5b5b5;
    font-size: 0.75rem;
    text-align: center;

    &::before {
      content: "";
      display: inline-block;
      background-color: #d8d8d8;
      width: 60px;
      height: 1px;
      margin: 0 12px;
      vertical-align: middle;
    }

    &::after {
      content: "";
      display: inline-block;
      background-color: #d8d8d8;
      width: 60px;
      height: 1px;
      margin: 0 12px;
      vertical-align: middle;
    }
  }

  .social-login-wrapper {
    margin-top: 1rem;
    font-size: 2rem;
    text-align: center;

    a {
      text-decoration: none;
      margin-left: 20px;

      svg {
        width: 30px;
        height: 30px;
      }
    }
  }
}
</style>
