<template>
  <div class="app-container">
    <!-- 查询和其他操作 -->
    <el-form v-show="showSearch" ref="form" :inline="true" :model="params" label-width="68px">
      <el-form-item label="分类名称">
        <el-select v-model="params.siteClassId" size="small" placeholder="请选择分类名称" @change="handleFind">
          <el-option v-for="item in siteClassList" :key="item.id" :label="item.name" :value="item.id" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="small" @click="handleFind">查找</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button v-if="checkPer(['admin','navigation:add'])" type="primary" icon="el-icon-plus" size="small" @click="handleAdd">新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" icon="el-icon-back" size="small" @click="handleBack">返回
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','navigation:deleteBatch'])"
          :disabled="!multipleSelection.length"
          type="danger"
          icon="el-icon-delete"
          size="small"
          @click="handleDeleteBatch"
        >批量删除
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="getNavigationList" />
    </el-row>

    <div style="margin-top: 5px">
      <el-table border :data="tableData" style="width: 100%" @selection-change="handleSelectionChange">
        <el-table-column align="center" type="selection" />

        <el-table-column label="网址logo" width="150" align="center">
          <template slot-scope="scope">
            <el-avatar :src="scope.row.logo" />
          </template>
        </el-table-column>
        <el-table-column label="网址标题" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.name }}</span>
          </template>
        </el-table-column>

        <el-table-column label="网址地址" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.url }}</span>
          </template>
        </el-table-column>

        <el-table-column label="网址描述" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.info }}</span>
          </template>
        </el-table-column>

        <el-table-column label="创建时间" width="250" align="center" prop="createTime">
          <template slot-scope="scope">
            <span>{{ scope.row.createTime }}</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button v-if="checkPer(['admin','navigation:edit'])" type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
              v-if="checkPer(['admin','navigation:deleteBatch'])"
              type="danger"
              size="mini"
              @click="handleDeleteBatch(scope.row)"
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

    <!-- 添加或修改对话框 -->
    <el-dialog center :title="title" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules">

        <el-form-item prop="logo" label="头网址logo像">
          <el-upload
            class="avatar-uploader"
            action="https://jsonplaceholder.typicode.com/posts/"
            :show-file-list="false"
            :action="uploadPictureHost"
            :before-upload="uploadBefore"
            :http-request="uploadSectionFile"
          >
            <img v-if="form.logo" :src="form.logo" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon" />
          </el-upload>
        </el-form-item>

        <el-form-item label="网址标题" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" auto-complete="off" />
        </el-form-item>

        <el-form-item label="网址地址" :label-width="formLabelWidth" prop="url">
          <el-input v-model="form.url" auto-complete="off" />
        </el-form-item>

        <el-form-item label="网址描述" :label-width="formLabelWidth" prop="info">
          <el-input v-model="form.info" auto-complete="off" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  getNavigationList,
  save,
  update,
  deleteBatch
} from '@/api/site/navigation'
import { upload } from '@/api/tools/imgUpload'
import { getSiteClassList } from '@/api/site/siteClass'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'

export default {
  data() {
    return {
      multipleSelection: [], // 多选，用于批量删除
      uploadPictureHost: process.env.VUE_APP_BASE_API + '/file/upload',
      loading: [],
      tableData: [],
      siteClassList: [],
      params: {
        siteClassId: null, // 从SysDictType传递过来的
        pageNo: 1,
        pageSize: 10
      },
      total: 0, // 总数量
      title: null,
      dialogFormVisible: false, // 控制弹出框
      showSearch: true,
      formLabelWidth: '120px',
      isEditForm: false,
      form: {},
      rules: {
        name: [
          { required: true, message: '标题不能为空', trigger: 'blur' }
        ],
        url: [
          { required: true, message: '地址不能为空', trigger: 'blur' }
        ],
        logo: [
          { required: true, message: 'logo不能为空', trigger: 'blur' }
        ]

      },
      permission: {
        add: ['admin', 'navigation:add'],
        edit: ['admin', 'navigation:edit'],
        deleteBatch: ['admin', 'navigation:deleteBatch']
      }
    }
  },
  created() {
    this.params.siteClassId = this.$route.query.siteClassId
    this.getSiteClassList()
    this.getNavigationList()
  },
  methods: {
    getNavigationList: function() {
      getNavigationList(this.params).then(response => {
        this.tableData = response.data.records
        this.total = response.data.total
      }).catch(err => {
        console.error(err)
      })
    },
    getSiteClassList: function() {
      const query = {
        pageNo: 1, pageSize: 100
      }
      getSiteClassList(query).then(response => {
        this.siteClassList = response.data.records
      }).catch(err => {
        console.error(err)
      })
    },
    // 这里可以设置一些初始值
    getFormObject: function() {
      return {

      }
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.getNavigationList()
    },
    handleBack: function() {
      this.$router.push({ path: 'siteClass' })
    },
    handleAdd: function() {
      this.title = '添加'
      this.dialogFormVisible = true
      this.form = this.getFormObject()
      this.form.siteClassId = this.params.siteClassId
      this.isEditForm = false
    },
    handleEdit: function(row) {
      this.title = '编辑'
      this.dialogFormVisible = true
      this.isEditForm = true
      this.form = row
      this.form.siteClassId = this.params.siteClassId
    },

    handleDeleteBatch: function(row) {
      if (row) {
        this.multipleSelection.push(row)
      }
      if (this.multipleSelection.length <= 0) {
        this.$message.error('请先选中需要删除的内容')
        return
      }
      this.$confirm('此操作将把选中字典数据删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const ids = []
        this.multipleSelection.forEach(item => {
          ids.push(item.id)
        })
        deleteBatch(ids).then(res => {
          this.$message.success('批量删除成功')
          this.getNavigationList()
          this.multipleSelection = []
        }).catch(err => {
          console.error(err)
        })
      }).catch(() => {
        this.$message.info('已取消删除')
      })
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.getNavigationList()
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.getNavigationList()
    },
    // 改变多选
    handleSelectionChange: function(val) {
      this.multipleSelection = val
    },
    submitForm: function() {
      this.$refs.form.validate((valid) => {
        if (!valid) {
          console.log('校验出错')
        } else {
          if (this.isEditForm) {
            update(this.form).then(response => {
              this.$message.success(response.message)
              this.dialogFormVisible = false
              this.getNavigationList()
            }).catch(err => {
              console.error(err)
            })
          } else {
            save(this.form).then(response => {
              this.$message.success(response.message)
              this.dialogFormVisible = false
              this.getNavigationList()
            }).catch(err => {
              console.error(err)
            })
          }
        }
      })
    },
    uploadBefore: function(file) {

    },
    uploadSectionFile: function(param) {
      this.openLoading()
      const file = param.file
      this.files = file
      // FormData 对象
      var formData = new FormData()
      // 文件对象
      formData.append('multipartFile', this.files)
      formData.append('path', 'file.img.upload.navigation')
      upload(formData).then(res => {
        this.form.logo = res.data
        this.loading.close()
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

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;

  text-align: center;
}

.avatar {
  width: 100%;
  height: 100%;
  max-width: 120px;
  display: block;
}
</style>
