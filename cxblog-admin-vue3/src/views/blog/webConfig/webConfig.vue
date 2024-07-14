<template>
  <div class="app-container" v-loading.fullscreen.lock="loading">
    <el-tabs type="border-card" @tab-click="handleClick">
      <el-tab-pane>
        <template #label> <svg-icon icon-class="client" /> 网站信息 </template>

        <el-form
          style="margin-left: 20px"
          label-position="left"
          :model="formData"
          label-width="80px"
          ref="from"
        >
          <el-row :gutter="12">
            <el-col :span="6">
              <el-form-item label="网站头像">
                <el-upload
                  class="avatar-uploader1"
                  :show-file-list="false"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="uploadSectionFile"
                >
                  <img
                    style="width: 100px; height: 100px"
                    v-if="formData.logo"
                    :src="formData.logo"
                    class="avatar1"
                  />
                  <el-icon v-else><Upload /></el-icon>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="游客头像" prop="touristAvatar">
                <el-upload
                  class="avatar-uploader1"
                  :show-file-list="false"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="handleUploadTourist"
                >
                  <img
                    style="width: 100px; height: 100px"
                    v-if="formData.touristAvatar"
                    :src="formData.touristAvatar"
                    class="avatar1"
                  />
                  <i v-else class="el-icon-plus avatar-uploader-icon1"></i>
                </el-upload>
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="网站名称" prop="name">
                <el-input
                  v-model="formData.name"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="网站地址" prop="webUrl">
                <el-input
                  v-model="formData.webUrl"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="关键字" prop="newPwd2">
                <el-input
                  v-model="formData.keyword"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="描述" prop="newPwd1">
                <el-input
                  v-model="formData.summary"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="备案号" prop="newPwd2">
                <el-input
                  v-model="formData.recordNum"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="登录方式">
                <el-checkbox-group v-model="loginTypeLists">
                  <el-checkbox
                    border
                    v-for="item in loginDictList"
                    :label="item.dictValue"
                    :key="item.dictValue"
                    style="margin-left: 10px"
                  >{{item.dictLabel}}</el-checkbox>
                </el-checkbox-group>
              </el-form-item>
            </el-col>
          </el-row>

          <el-form-item>
            <el-button
              type="primary"
              @click="submitForm()"
              v-hasPerm="['system:webConfig:update']"
              >修 改</el-button
            >
          </el-form-item>
        </el-form>
      </el-tab-pane>

      <el-tab-pane>
        <template #label> <svg-icon icon-class="user" /> 作者信息 </template>

        <el-form
          style="margin-left: 20px"
          label-position="left"
          :model="formData"
          label-width="80px"
          ref="from"
        >
          <el-form-item label="作者头像">
            <el-upload
              class="avatar-uploader1"
              :show-file-list="false"
              :action="uploadPictureHost"
              :before-upload="uploadBefore"
              :http-request="handleUploadAuthor"
            >
              <img
                style="width: 100px; height: 100px"
                v-if="formData.authorAvatar"
                :src="formData.authorAvatar"
                class="avatar1"
              />
              <i v-else class="el-icon-plus avatar-uploader-icon1"></i>
            </el-upload>
          </el-form-item>

          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="作者" prop="newPwd2">
                <el-input
                  v-model="formData.author"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="作者简介" prop="newPwd2">
                <el-input
                  v-model="formData.authorInfo"
                  style="width: 400px"
                ></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="关于我">
              <div style="border: 1px solid #ccc">
                <Toolbar
                    style="border-bottom: 1px solid #ccc"
                    :editor="editorRef"
                    :defaultConfig="toolbarConfig"
                    :mode="mode"
                />
                <Editor
                    style="height: 500px; overflow-y: hidden"
                    v-model="formData.aboutMe"
                    :defaultConfig="editorConfig"
                    :mode="mode"
                    @onCreated="onCreated"
                />
              </div>
            </el-form-item>
          </el-row>

          <el-form-item>
            <el-button
              type="primary"
              @click="submitForm()"
              v-hasPerm="['system:webConfig:update']"
              >修 改</el-button
            >
          </el-form-item>
        </el-form>
      </el-tab-pane>

      <el-tab-pane>
        <template #label> <svg-icon icon-class="order" /> 评论&打赏 </template>

        <el-form
          style="margin-left: 20px"
          label-position="left"
          :model="formData"
          label-width="90px"
          ref="from"
        >
          <el-row :gutter="24">
            <el-col :span="4">
              <el-form-item label="支付宝">
                <el-upload
                  class="avatar-uploader1"
                  :show-file-list="false"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="handleUploadAliPay"
                >
                  <img
                    style="width: 100px; height: 100px"
                    v-if="formData.aliPay"
                    :src="formData.aliPay"
                    class="avatar1"
                    alt=""
                  />
                  <el-icon v-else class="avatar-uploader-icon"
                    ><Plus
                  /></el-icon>
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="4">
              <el-form-item label="微信">
                <el-upload
                  class="avatar-uploader1"
                  :show-file-list="false"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="handleUploadWxPay"
                >
                  <img
                    style="width: 100px; height: 100px"
                    v-if="formData.weixinPay"
                    :src="formData.weixinPay"
                    class="avatar1"
                    alt=""
                  />
                  <i v-else class="el-icon-plus avatar-uploader-icon1"></i>
                </el-upload>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="网站评论">
              <el-radio
                v-for="item in openDictList"
                :key="item.id"
                v-model="formData.openComment"
                :label="item.dictValue"
                border
                >{{ item.dictLabel }}
              </el-radio>
            </el-form-item>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="网站打赏">
              <el-radio
                v-for="item in openDictList"
                :key="item.id"
                v-model="formData.openAdmiration"
                :label="parseInt(item.dictValue)"
                border
                >{{ item.dictLabel }}
              </el-radio>
            </el-form-item>
          </el-row>
          <el-form-item>
            <el-button
              type="primary"
              @click="submitForm()"
              v-hasPerm="['system:webConfig:update']"
              >修 改</el-button
            >
          </el-form-item>
        </el-form>
      </el-tab-pane>

      <el-tab-pane>
        <template #label> <svg-icon icon-class="peoples" /> 关注我们 </template>
        <el-form
          style="margin-left: 20px"
          label-position="left"
          :model="formData"
          label-width="80px"
          :rules="rules"
          ref="form"
        >
          <el-checkbox-group v-model="showList">
            <el-form-item label="邮箱" prop="email">
              <el-input
                v-model="formData.email"
                style="width: 400px"
              ></el-input>
              <el-checkbox
                label="1"
                style="margin-left: 10px"
              >在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="QQ号" prop="qqNumber">
              <el-input
                v-model="formData.qqNumber"
                style="width: 400px"
              ></el-input>
              <el-checkbox
                  label="2"
                  style="margin-left: 10px"
              >在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="QQ群" prop="qqNumber">
              <el-input
                v-model="formData.qqGroup"
                style="width: 400px"
              ></el-input>
              <el-checkbox
                  label="6"
                  style="margin-left: 10px"
              >在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="github" prop="github">
              <el-input
                v-model="formData.github"
                style="width: 400px"
              ></el-input>
              <el-checkbox
                  label="3"
                  style="margin-left: 10px"
              >在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="Gitee" prop="gitee">
              <el-input
                v-model="formData.gitee"
                style="width: 400px"
              ></el-input>
              <el-checkbox
                  label="4"
                  style="margin-left: 10px"
              >在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="微信" prop="wechat">
              <el-input
                v-model="formData.wechat"
                style="width: 400px"
              ></el-input>
              <el-checkbox
                  label="5"
                  style="margin-left: 10px"
              >在首页显示</el-checkbox>
            </el-form-item>
          </el-checkbox-group>
          <el-form-item>
            <el-button
              type="primary"
              @click="submitForm()"
              v-hasPerm="['system:webConfig:update']"
              >修 改</el-button
            >
          </el-form-item>
        </el-form>
      </el-tab-pane>

      <el-tab-pane>
        <template #label>
          <el-icon><BellFilled /></el-icon> 发布公告
        </template>
        <el-form
          style="margin-left: 20px"
          label-position="left"
          :model="formData"
          label-width="80px"
          ref="from"
        >
          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="是否显示" prop="newPwd2">
                <el-switch
                  v-model="formData.showBulletin"
                  active-color="#13ce66"
                  inactive-color="#ff4949"
                  :active-value="1"
                  :inactive-value="0"
                >
                </el-switch>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="公告内容">
              <el-input
                type="textarea"
                :rows="5"
                style="width: 800px"
                placeholder="请输入公告内容"
                v-model="formData.bulletin"
              >
              </el-input>
            </el-form-item>
          </el-row>

          <el-form-item>
            <el-button
              type="primary"
              @click="submitForm()"
              v-hasPerm="['system:webConfig:update']"
              >修 改</el-button
            >
          </el-form-item>
        </el-form>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup lang="ts">
import { getWebConfig, updateWebConfig } from "@/api/blog/webConfig";
import { getDataByDictType } from "@/api/system/dict/data";
import { upload } from "@/api/file";
import { Editor, Toolbar } from "@wangeditor/editor-for-vue";

defineOptions({
  name: "FriendLink",
  inheritAttrs: false,
});

const loading = ref(false);


const editorRef = shallowRef();
const toolbarConfig = ref({});
const editorConfig = ref({
  placeholder: "请输入内容...",
  MENU_CONF: {
    // 配置上传图片
    uploadImage: {
      customUpload: contentUpload,
    },
    uploadVideo: {
      customUpload: uploadVideo,
    },
    codeSelectLang: {
      // 代码语言
      codeLangs: [
        { text: "CSS", value: "css" },
        { text: "HTML", value: "html" },
        { text: "XML", value: "xml" },
        { text: "Java", value: "java" },
        // 其他
      ],
    },
  },
});
const mode = ref("default");
const loginTypeLists = ref<any>([]);
const showList = ref([]);
const formData = reactive<any>({});
const systemConfig = ref({});
const uploadPictureHost = ref(
  import.meta.env.VITE_APP_API_URL + "/file/upload"
);
const openDictList = ref([]);
const loginDictList = ref([]);
const files = ref();
const rules = ref({
  qqNumber: [{ pattern: /[1-9]([0-9]{5,11})/, message: "请输入正确的QQ号码" }],
  qqGroup: [{ pattern: /-?[1-9]\d*/, message: "请输入正确的QQ群" }],
  gitee: [
    {
      pattern: /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/,
      message: "请输入正确的Gitee地址",
    },
  ],
  github: [
    {
      pattern: /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/,
      message: "请输入正确的Github地址",
    },
  ],
  email: [
    {
      pattern: /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/,
      message: "请输入正确的邮箱",
    },
  ],
});

//编辑器上传视频
function uploadVideo(file: any, insertFn: any) {
  files.value = file;
  //FormData 对象
  var formData = new FormData();
  // 文件对象
  formData.append("file", files.value);
  upload(formData).then((res: any) => {
    insertFn(res.data, "");
    loading.value = false;
  });
}

//编辑器上传图片
function contentUpload(file: any, insertFn: any) {
  files.value = file;
  // FormData 对象
  var formData = new FormData();
  // 文件对象
  formData.append("file", files.value);
  upload(formData).then((res: any) => {
    insertFn(res.data, "", res.data);
    loading.value = false;
  });
}
// //创建富文本编辑框
// function onCreated(editor: any) {
//   editorRef.value = editor; // 一定要用 Object.seal() ，否则会报错
// }
// 在可编辑的重新加载之前
function onEditableReloadBefore(inst) {
  console.log(inst)
  console.log('editable 即将重载: ' + new Date().toLocaleString())
}

// 在工具栏上重新加载之前
function onToolbarReloadBefore(inst) {
  console.log(inst)
  console.log('toolbar 即将重载: ' + new Date().toLocaleString())
}
/**
 * 字典查询
 */
function getDictList() {
  let params = ["sys_normal_disable", "blog_login_method"];
  getDataByDictType(params).then((response) => {
    let dictMap = response.data;
    openDictList.value = dictMap.sys_normal_disable.list;
    loginDictList.value = dictMap.blog_login_method.list;
  });
}
function handleClick(tab: any, event: any) {}

//网站信息
function getWebConfigFun() {
  getWebConfig().then((response) => {
    let data = response.data;
    let showListObj = data.showList.split(",");
    let logins = data.loginTypeList.split(",");
    loginTypeLists.value = logins;
    showList.value = showListObj;
    console.log(showList.value)
    Object.assign(formData, data);
  });
}
//上传微信收款码
function handleUploadWxPay(file: any) {
  let fromData = initFromData(file);
  upload(fromData).then((res: any) => {
    formData.weixinPay = res.data;
    loading.value = false;
  });
}
//上传支付宝收款码
function handleUploadAliPay(file: any) {
  let fromData = initFromData(file);
  upload(fromData).then((res: any) => {
    formData.aliPay = res.data;
    loading.value = false;
  });
}
// 上传文件
function uploadSectionFile(file: any) {
  let fromData = initFromData(file);
  upload(fromData).then((res: any) => {
    formData.logo = res.data;
    loading.value = false;
  });
}
//上传游客头像
function handleUploadTourist(file: any) {
  let fromData = initFromData(file);
  upload(fromData).then((res: any) => {
    formData.touristAvatar = res.data;
    loading.value = false;
  });
}
//上传作者头像
function handleUploadAuthor(file: any) {
  let fromData = initFromData(file);
  upload(fromData).then((res: any) => {
    formData.authorAvatar = res.data;
    loading.value = false;
  });
}
//上传之前的操作
function uploadBefore() {
  loading.value = true;
}
//初始化上传文件对象
function initFromData(param: any) {
  files.value = param.file;
  var formData = new FormData();
  formData.append("file", files.value);
  return formData;
}
//提交
function submitForm() {
  let logins = "";
  loginTypeLists.value.forEach((item: any) => {
    if (item !== "") {
      if (logins == "") {
        logins = item;
      } else {
        logins = logins + "," + item;
      }
    }
  });
  let showObj = "";
  showList.value.forEach((item: any) => {
    if (item !== "") {
      if (showObj == "") {
        showObj = item;
      } else {
        showObj = showObj + "," + item;
      }
    }
  });
  formData.loginTypeList = logins;
  formData.showList = showObj;
  updateWebConfig(formData)
    .then((response) => {
      ElMessage.success("修改成功");
      getWebConfigFun();
    })
    .catch((err) => {
      console.error(err);
    });
}

onMounted(() => {
  getDictList();
  getWebConfigFun();
});
</script>
<style src="@wangeditor/editor/dist/css/style.css"></style>
<style scoped>
img {
  width: 100px;
  height: 100px;
}

.avatar1 {
  width: 178px;
  height: 178px;
  display: block;
}

::v-deep(.avatar-uploader1 .el-upload) {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader1 .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 100px;
  height: 100px;
  text-align: center;
}
</style>
