<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" icon="el-icon-plus" size="small" @click="handleInserBefore">添加
        </el-button>
        <el-button
          v-if="checkPer(['admin','tipsoon:del'])"
          :disabled="!multipleSelection.length"
          type="danger"
          icon="el-icon-delete"
          size="small"
          @click="handleDeleteBatch"
        >批量删除
        </el-button>

      </el-col>
    </el-row>

    <div style="margin-top: 5px">
      <el-table border :data="tableData" style="width: 100%" @selection-change="handleSelectionChange">
        <el-table-column type="selection" align="center" />
        <el-table-column prop="userId" align="center" width="150" label="用户id" />
        <el-table-column prop="site" align="center" width="200" label="关联地址" />
        <el-table-column prop="imgUrl" align="center" width="200" label="关联图片">
          <template slot-scope="scope">
            <div>
              <div style="display: flex;flex-wrap: wrap;">
                <div style="display: flex;justify-content: center;margin: 2px 2px;"
                >
                  <el-image :src="scope.row.imgUrl" :preview-src-list="[scope.row.imgUrl]" class="imgBox" />
                </div>
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="title" align="center" label="标题" />
        <el-table-column prop="content" align="center" label="内容" />
        <el-table-column prop="createTime" width="200" align="center" label="发表时间" />

        <el-table-column align="center" label="操作" width="200" class-name="small-padding fixed-width">
          <template slot-scope="scope">

            <el-button
              v-if="checkPer(['admin','tipsoon:edit'])"
              size="mini"
              type="primary"
              @click="handleUpdate(scope.row.id)"
            >修改</el-button>

            <el-button
              v-if="checkPer(['admin','tipsoon:del'])"
              size="mini"
              type="danger"
              @click="handleDeleteBatch(scope.row.id)"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!--分页区域-->
    <div class="pagination-container" style="float: right;margin-bottom: 1.25rem;margin-top: 1.25rem;">
      <el-pagination
        background
        :current-page="params.pageNo"
        :page-size="params.pageSize"
        :page-sizes="[10, 20, 30]"
        layout="total, sizes,prev, pager, next,jumper"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>

    <!-- 添加或修改 -->
    <el-dialog
      center
      :title="isUpdate ? '修改讨论' : '添加讨论'"
      :visible.sync="dialogFormVisible"
      :close-on-click-modal="false"
    >
      <el-form ref="dataForm" :model="form" label-position="left">

        <el-form-item label="标题" prop="title" :label-width="formLabelWidth">
          <el-input v-model="form.title" />
        </el-form-item>

        <el-form-item label="内容" :label-width="formLabelWidth">
          <div style="border: 1px solid #ccc;">
            <Toolbar
              style="border-bottom: 1px solid #ccc"
              :editor="editor"
              :default-config="toolbarConfig"
              :mode="mode"
            />
            <Editor
              v-model="form.content"
              style="height: 500px; overflow-y: hidden;"
              :default-config="editorConfig"
              :mode="mode"
              @onCreated="onCreated"
            />
          </div>
        </el-form-item>
        <el-form-item label="网页地址" prop="site" :label-width="formLabelWidth">
          <el-input v-model="form.site.url" />
        </el-form-item>
        <el-form-item label="网页标题" prop="site" :label-width="formLabelWidth">
          <el-input v-model="form.site.title" />
        </el-form-item>
        <el-form-item label="图片(最多九张)" prop="sort" :label-width="formLabelWidth">
          <el-upload
            :action="uploadPictureHost"
            :before-upload="uploadBefore"
            list-type="picture-card"
            :limit="9"
            :http-request="uploadSectionFile"
            multiple
            :on-remove="handleRemove"
          >
            <i class="el-icon-plus" />
          </el-upload>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button v-if="!isUpdate" type="primary" @click="submit">确认</el-button>
        <el-button v-else type="primary" @click="update">提交</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { upload, delBatchFile } from '@/api/tools/imgUpload'
import { getTipsoonList, insertTipsoon, deleteTipsoon, getTipsoonInfo, updateTipsoon } from '@/api/blogs/tipsoon'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
export default {
  components: {
    Editor,
    Toolbar
  },
  data() {
    return {
      uploadPictureHost: process.env.VUE_APP_BASE_API + '/file/upload',
      formLabelWidth: '120px',
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
              { text: 'JAVA', value: 'java' }
              // 其他
            ]
          }
        }
      },
      mode: 'default', // or 'simple'
      tableData: [],
      multipleSelection: [],
      // 加载层信息
      loading: [],
      form: { site:{ url:"", title:""}},
      isUpdate: false,
      total: 0,
      showSearch: true,
      dialogFormVisible: false,
      params: {
        pageNo: 1,
        pageSize: 10
      },
      files: {},
      permission: {
        edit: ['admin', 'tipsoon:edit'],
        del: ['admin', 'tipsoon:del']
      }
    }
  },
  created: function() {
    this.getTipsoonList()
  },
  methods: {
    splitImg(img) {
      const imgs = img.split(',')
      var r = imgs.filter(function(s) {
        return s && s.trim()
      })
      return r
    },
    update() {
      var form = { ...this.form }
      if (form.site.url !== "") {
        form.site = JSON.stringify(form.site)
      } else {
        form.site = null
      }
      updateTipsoon(form).then(res => {
        this.getTipsoonList()
        this.$message.success('修改成功')
        this.dialogFormVisible = false
      })
    },
    handleUpdate(id) {
      this.form = {
        site: { url:"",title:"" },
        imgUrl: ""
      }
      getTipsoonInfo(id).then(res => {
        this.form = res.data
        if (this.form.site !== undefined) {
          this.form.site = JSON.parse(this.form.site)
          if (this.form.site.title === undefined) {
            this.form.site.title = ''
          }
        } else {
          this.form.site = { url: '', title: '' }
        }
        this.isUpdate = true
        this.dialogFormVisible = true
      })
    },
    handleInserBefore() {
      this.form = {
        site: { url:"",title:"" },
        imgUrl: ""
      }
      this.isUpdate = false
      this.dialogFormVisible = true
    },
    submit() {
      var form = { ...this.form }
      if (form.site.url !== "") {
        form.site = JSON.stringify(form.site)
      } else {
        form.site = null
      }
      insertTipsoon(form).then(res => {
        this.getTipsoonList()
        this.$message.success('添加成功')
        this.dialogFormVisible = false
      }).catch(err => {
        console.log(err)
      })
    },
    uploadBefore: function() {
      this.openLoading()
    },
    uploadVideo: function(file, insertFn) {
      this.files = file
      // FormData 对象
      var formData = new FormData()
      // 文件对象
      formData.append('multipartFile', this.files)
      formData.append('path', 'file.img.upload.tipsoon')
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
      formData.append('path', 'file.img.upload.tipsoon')
      upload(formData).then(res => {
        insertFn(res.data, '', res.data)
      })
    },
    uploadSectionFile: function(param) {
      this.files = param.file
      // FormData 对象
      var formData = new FormData()
      // 文件对象
      formData.append('multipartFile', this.files)
      formData.append('path', 'file.img.upload.tipsoon')
      upload(formData).then(res => {
        this.form.imgUrl = res.data
      })
      this.loading.close()
    },
    handleRemove(file, fileList) {
      console.log(file, fileList)
    },

    onCreated(editor) {
      this.editor = Object.seal(editor) // 一定要用 Object.seal() ，否则会报错
    },
    getTipsoonList: function() {
      this.openLoading()
      getTipsoonList(this.params).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
        this.loading.close()
      }).catch(err => {
        console.log(err)
      })
    },

    handleDeleteBatch: function(id) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const ids = []
        if (id != null) {
          ids.push(id)
        } else {
          this.multipleSelection.forEach(item => {
            ids.push(item.id)
          })
        }
        deleteTipsoon(ids).then(res => {
          this.$message.success('删除成功')
          this.getTipsoonList()
        }).catch(err => {
          console.error(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消删除'
        })
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
    },
    handleSelectionChange: function(val) {
      this.multipleSelection = val
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.fetchNote()
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.fetchNote()
    }
  }
}
</script>
<style src="@wangeditor/editor/dist/css/style.css"></style>
<style lang="scss" scoped>
.imgBox {
    border-radius: 5px;
}

::v-deep img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    cursor: zoom-in;
}</style>
