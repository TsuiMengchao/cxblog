<template>
  <div class="app-container">

    <el-tabs type="border-card" @tab-click="handleClick">
      <el-tab-pane>
        <span slot="label">
          <i class="el-icon-date" /> 网站信息
        </span>

        <el-form ref="from" style="margin-left: 20px;" label-position="left" :model="form" label-width="80px">
          <el-row :gutter="12">
            <el-col :span="6">
              <el-form-item label="网站头像">
                <el-upload
                  ref="upload"
                  class="avatar-uploader1"
                  action
                  :show-file-list="false"
                  :disabled="!checkPer(['admin','webConfig:edit'])"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="uploadSectionFile"
                >
                  <img v-if="form.logo" style="width: 100px;height: 100px" :src="form.logo" class="avatar1">
                  <i v-else class="el-icon-plus avatar-uploader-icon1" />
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="游客头像" prop="touristAvatar">
                <el-upload
                  ref="upload"
                  class="avatar-uploader1"
                  action
                  :show-file-list="false"
                  :disabled="!checkPer(['admin','webConfig:edit'])"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="touristUpload"
                >
                  <img
                    v-if="form.touristAvatar"
                    style="width: 100px;height: 100px"
                    :src="form.touristAvatar"
                    class="avatar1"
                  >
                  <i v-else class="el-icon-plus avatar-uploader-icon1" />
                </el-upload>
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="网站名称" prop="name">
                <el-input v-model="form.name" style="width: 400px" />
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="网站地址" prop="webUrl">
                <el-input v-model="form.webUrl" style="width: 400px" />
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="关键字" prop="newPwd2">
                <el-input v-model="form.keyword" style="width: 400px" />
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="描述" prop="newPwd1">
                <el-input v-model="form.summary" style="width: 400px" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="公告" prop="newPwd1">
                <el-input v-model="form.bulletin" style="width: 400px" />
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="备案号" prop="newPwd2">
                <el-input v-model="form.recordNum" style="width: 400px" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="版权声明" prop="newPwd1">
                <el-input v-model="form.copyright" style="width: 400px" />
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="上线时间" prop="newPwd2">
                <el-date-picker
                  v-model="form.releaseTime"
                  type="datetime"
                  placeholder="选择日期时间"
                  align="right"
                  :picker-options="pickerOptions">
                </el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="登录方式">
                <el-checkbox-group v-model="loginTypeLists">
                  <el-checkbox
                    v-for="item in loginDictList"
                    :key="item.value"
                    border
                    :label="item.value"
                    style="margin-left:10px;"
                    :disabled="item.value == 1"
                  >
                    {{ item.label }}
                  </el-checkbox>
                </el-checkbox-group>
              </el-form-item>
            </el-col>
          </el-row>
          <el-form-item>
            <el-button v-if="checkPer(['admin','webConfig:edit'])" type="primary" @click="submitForm()">保 存</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>

      <el-tab-pane>
        <span slot="label">
          <i class="el-icon-date" /> 作者信息
        </span>

        <el-form ref="from" style="margin-left: 20px;" label-position="left" :model="form" label-width="80px">
          <el-form-item label="作者头像">
            <el-upload
              ref="upload"
              class="avatar-uploader1"
              action
              :show-file-list="false"
              :disabled="!checkPer(['admin','webConfig:edit'])"
              :action="uploadPictureHost"
              :before-upload="uploadBefore"
              :http-request="authorUpload"
            >
              <img v-if="form.authorAvatar" style="width: 100px;height: 100px" :src="form.authorAvatar" class="avatar1">
              <i v-else class="el-icon-plus avatar-uploader-icon1" />
            </el-upload>
          </el-form-item>

          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="作者" prop="newPwd2">
                <el-input v-model="form.author" style="width: 400px" />
              </el-form-item>
            </el-col>
            <el-col :span="10">
              <el-form-item label="作者简介" prop="newPwd2">
                <el-input v-model="form.authorInfo" style="width: 400px" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="关于我">
              <!-- <mavon-editor placeholder="开始编辑...." :subfield="false" style="height: 300px" ref=md
                v-model="form.aboutMe" /> -->
              <div style="border: 1px solid #ccc;">
                <Toolbar
                  style="border-bottom: 1px solid #ccc"
                  :editor="editor"
                  :default-config="toolbarConfig"
                  :mode="mode"
                />
                <Editor
                  v-model="form.aboutMe"
                  style="height: 500px; overflow-y: hidden;"
                  :default-config="editorConfig"
                  :mode="mode"
                  @onCreated="onCreated"
                />
              </div>
            </el-form-item>

          </el-row>

          <el-form-item>
            <el-button v-if="checkPer(['admin','webConfig:edit'])" type="primary" @click="submitForm()">保 存</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
      <el-tab-pane>
        <span slot="label">
          <i class="el-icon-date" /> 评论&打赏
        </span>

        <el-form ref="from" style="margin-left: 20px;" label-position="left" :model="form" label-width="90px">
          <el-row :gutter="24">
            <el-col :span="4">
              <el-form-item label="支付宝">
                <el-upload
                  ref="upload"
                  class="avatar-uploader1"
                  action
                  :show-file-list="false"
                  :disabled="!checkPer(['admin','webConfig:edit'])"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="aliPayMethod"
                >
                  <img v-if="form.aliPay" style="width: 100px;height: 100px" :src="form.aliPay" class="avatar1" alt="">
                  <i v-else class="el-icon-plus avatar-uploader-icon1" />
                </el-upload>
              </el-form-item>
            </el-col>
            <el-col :span="4">
              <el-form-item label="微信">
                <el-upload
                  ref="upload"
                  class="avatar-uploader1"
                  action
                  :show-file-list="false"
                  :disabled="!checkPer(['admin','webConfig:edit'])"
                  :action="uploadPictureHost"
                  :before-upload="uploadBefore"
                  :http-request="weiXinPayMethod"
                >
                  <img
                    v-if="form.weixinPay"
                    style="width: 100px;height: 100px"
                    :src="form.weixinPay"
                    class="avatar1"
                    alt=""
                  >
                  <i v-else class="el-icon-plus avatar-uploader-icon1" />
                </el-upload>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="网站评论">
              <el-radio
                v-for="item in openDictList"
                :key="item.id"
                v-model="form.openComment"
                :label="item.value"
                border
                size="medium"
              >{{ item.label }}
              </el-radio>
            </el-form-item>
          </el-row>
          <el-row :gutter="24">
            <el-form-item label="网站打赏">
              <el-radio
                v-for="item in openDictList"
                :key="item.id"
                v-model="form.openAdmiration"
                :label="item.value"
                border
                size="medium"
              >{{ item.label }}
              </el-radio>
            </el-form-item>
          </el-row>
          <el-form-item>
            <el-button v-if="checkPer(['admin','webConfig:edit'])" type="primary" @click="submitForm()">保 存</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>

      <el-tab-pane>
        <span slot="label">
          <i class="el-icon-date" /> 关注我们
        </span>
        <el-form
          ref="form"
          style="margin-left: 20px;"
          label-position="left"
          :model="form"
          label-width="80px"
          :rules="rules"
        >
          <el-checkbox-group v-model="showList">
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email" style="width: 400px" />
              <el-checkbox label="1" style="margin-left: 10px">在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="QQ号" prop="qqNumber">
              <el-input v-model="form.qqNumber" style="width: 400px" />
              <el-checkbox label="2" style="margin-left: 10px">在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="QQ群" prop="qqNumber">
              <el-input v-model="form.qqGroup" style="width: 400px" />
              <el-checkbox label="6" style="margin-left: 10px">在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="github" prop="github">
              <el-input v-model="form.github" style="width: 400px" />
              <el-checkbox label="3" style="margin-left: 10px">在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="Gitee" prop="gitee">
              <el-input v-model="form.gitee" style="width: 400px" />
              <el-checkbox label="4" style="margin-left: 10px">在首页显示</el-checkbox>
            </el-form-item>
            <el-form-item label="微信" prop="wechat">
              <el-input v-model="form.wechat" style="width: 400px" />
              <el-checkbox label="5" style="margin-left: 10px">在首页显示</el-checkbox>
            </el-form-item>
          </el-checkbox-group>
          <el-form-item>
            <el-button v-if="checkPer(['admin','webConfig:edit'])" type="primary" @click="submitForm()">保 存</el-button>
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
          :model="form"
          label-width="80px"
          ref="from"
        >
          <el-row :gutter="24">
            <el-col :span="10">
              <el-form-item label="是否显示" prop="newPwd2">
                <el-switch
                  v-model="form.showBulletin"
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
                v-model="form.bulletin"
              >
              </el-input>
            </el-form-item>
          </el-row>

          <el-form-item>
            <el-button
              type="primary"
              @click="submitForm()"
              v-hasPerm="['system:webConfig:update']"
            >修 改</el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { getWebConfig, update } from '@/api/site/webConfig'
import { getDataByDictType } from '@/api/site/dictData'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'
import { upload } from '@/api/tools/imgUpload'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
export default {
  components: {
    Editor,
    Toolbar
  },
  data() {
    return {
      editor: null,
      toolbarConfig: {},
      editorConfig: {
        placeholder: '请输入内容...',
        MENU_CONF: {
          // 配置上传图片
          'uploadImage': {
            customUpload: this.contentUpload // this.contentUpload 是 methods 中的一个普通方法
          },
          'uploadVideo': {
            customUpload: this.uploadVideo
          },
          'codeSelectLang': {
            // 代码语言
            codeLangs: [
              { text: 'CSS', value: 'css' },
              { text: 'HTML', value: 'html' },
              { text: 'XML', value: 'xml' },
              { text: 'Java', value: 'java' }
              // 其他
            ]
          }
        }
      },
      mode: 'default', // or 'simple'
      loginTypeLists: [],
      showList: [],
      loading: [],
      form: {
        name: '',
        aboutMe: '',
        webUrl: '',
        keyword: '',
        summary: '',
        author: '',
        logo: '',
        recordNum: '',
        openComment: '1',
        aliPay: '',
        weixinPay: '',
        authorAvatar: '',
        authorInfo: '',
        touristAvatar: '',
        bulletin: '',
        showBulletin: 1,
        showList: '',
        loginTypeList: '',
        copyright: '',
        releaseTime: ''
      },
      systemConfig: {},
      uploadPictureHost: process.env.VUE_APP_BASE_API + '/file/upload',
      openDictList: [], // 字典
      loginDictList: [], // 字典
      files: {},
      rules: {
        qqNumber: [
          { pattern: /[1-9]([0-9]{5,11})/, message: '请输入正确的QQ号码' }
        ],
        qqGroup: [
          { pattern: /-?[1-9]\d*/, message: '请输入正确的QQ群' }
        ],
        gitee: [
          { pattern: /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/, message: '请输入正确的Gitee地址' }
        ],
        github: [
          { pattern: /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/, message: '请输入正确的Github地址' }
        ],
        email: [
          { pattern: /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/, message: '请输入正确的邮箱' }
        ]
      },
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date())
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24)
            picker.$emit('pick', date)
          }
        }, {
          text: '一周前',
          onClick(picker) {
            const date = new Date()
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
            picker.$emit('pick', date)
          }
        }]
      },
      permission: {
        edit: ['admin', 'webConfig:edit']
      }
    }
  },
  created() {
    // 查询字典
    this.getDictList()
    // 获取配置
    this.getWebConfigFun()
  },
  beforeDestroy() {
    const editor = this.editor
    if (editor == null) return
    editor.destroy() // 组件销毁时，及时销毁编辑器
  },
  methods: {
    uploadVideo: function(file, insertFn) {
      this.files = file
      // FormData 对象
      var formData = new FormData()
      // 文件对象
      formData.append('multipartFile', this.files)
      formData.append('path', 'web')
      upload(formData).then(res => {
        insertFn(res.data, '')
      })
    },
    contentUpload: function(file, insertFn) {
      this.files = file
      // FormData 对象
      var formData = new FormData()
      // 文件对象
      formData.append('multipartFile', this.files)
      formData.append('path', 'web')
      upload(formData).then(res => {
        insertFn(res.data, '', res.data)
      })
    },
    onCreated(editor) {
      this.editor = Object.seal(editor) // 一定要用 Object.seal() ，否则会报错
    },
    /**
     * 字典查询
     */
    getDictList: function() {
      const params = ['sys_normal_disable', 'sys_login_method']
      getDataByDictType(params).then(response => {
        const dictMap = response.data
        this.openDictList = dictMap.sys_normal_disable.list
        this.loginDictList = dictMap.sys_login_method.list
      })
    },
    handleClick(tab, event) {

    },
    getWebConfigFun: function() {
      getWebConfig().then(response => {
        const data = response.data
        const showList = data.showList.split(',')
        const logins = data.loginTypeList.split(',')
        this.loginTypeLists = logins
        this.showList = showList
        this.form = data
      })
    },
    weiXinPayMethod: function(file) {
      const fromData = this.initFromData(file)
      upload(fromData).then(res => {
        this.form.weixinPay = res.data
        this.loading.close()
      })
    },
    aliPayMethod: function(file) {
      const fromData = this.initFromData(file)
      upload(fromData).then(res => {
        this.form.aliPay = res.data
        this.loading.close()
      })
    },
    uploadSectionFile: function(file) {
      const fromData = this.initFromData(file)
      upload(fromData).then(res => {
        this.form.logo = res.data
        this.loading.close()
      })
    },
    touristUpload: function(file) {
      const fromData = this.initFromData(file)
      upload(fromData).then(res => {
        this.form.touristAvatar = res.data
        this.loading.close()
      })
    },
    authorUpload: function(file) {
      const fromData = this.initFromData(file)
      upload(fromData).then(res => {
        this.form.authorAvatar = res.data
        this.loading.close()
      })
    },
    uploadBefore: function() {
      this.openLoading()
    },
    initFromData: function(param) {
      this.files = param.file
      // FormData 对象
      var formData = new FormData()
      // 文件对象
      formData.append('multipartFile', this.files)
      formData.append('path', 'web')
      return formData
    },
    submitForm: function() {
      const form = this.form
      let logins = null
      this.loginTypeLists.forEach(item => {
        if (item !== '') {
          if (logins == null) {
            logins = item
          } else {
            logins = logins + ',' + item
          }
        }
      })
      let showList = null
      this.showList.forEach(item => {
        if (item !== '') {
          if (showList == null) {
            showList = item
          } else {
            showList = showList + ',' + item
          }
        }
      })
      form.loginTypeList = logins
      form.showList = showList
      update(form).then(response => {
        this.$message.success('修改网站配置成功')
        this.getWebConfigFun()
      }).catch(err => {
        console.error(err)
      })
    },
    // 打开加载层
    openLoading: function() {
      this.loading = this.$loading({
        lock: true,
        text: '正在加载中~',
        spinner: 'el-icon-loading',
        background: 'rgba(0, 0, 0, 0.7)'
      })
    }
  }
}
</script>
<style src="@wangeditor/editor/dist/css/style.css"></style>
<style scoped>
.uploadImgBody :hover {
  border: dashed 1px #00ccff;
}

img {
  width: 100px;
  height: 100px;
}

.avatar-uploader1 .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader1 .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon1 {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar1 {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
