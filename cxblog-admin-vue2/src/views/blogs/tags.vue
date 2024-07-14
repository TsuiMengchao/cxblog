<template>
  <div class="app-container">
    <!--查询or添加-->
    <el-form v-show="showSearch" ref="form" :inline="true" :model="params" label-width="68px">
      <el-form-item label="标签名称">
        <el-input v-model="params.name" style="width: 200px" size="small" placeholder="请输入标签名称" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="small" @click="handleFind">查找</el-button>
        <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','tag:add'])"
          size="small"
          class="filter-item"
          type="primary"
          icon="el-icon-plus"
          @click="handleCreate"
        >添加
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','tag:deleteBatch'])"
          size="small"
          :disabled="!multipleSelection.length"
          class="filter-item"
          type="danger"
          icon="el-icon-delete"
          @click="handleDelete"
        >批量删除
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="fetchTags" />
    </el-row>

    <div style="margin-top: 5px">
      <el-table
        border
        :data="tableData"
        style="width: 100%"
        :default-sort="{ prop: 'sort', order: 'descending' }"
        @selection-change="handleSelectionChange"
      >
        <el-table-column align="center" type="selection" />
        <el-table-column prop="name" align="center" label="标签名" width="180" />
        <el-table-column prop="articleCount" align="center" label="文章量" />
        <el-table-column align="center" prop="sort" sortable label="排序">
          <template slot-scope="scope">
            <el-tag type="warning">{{ scope.row.sort }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" prop="clickVolume" label="点击量">
          <template slot-scope="scope">
            <el-tag type="warning">{{ scope.row.clickVolume }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column width="180" align="center" label="添加时间">
          <template slot-scope="scope">
            <span>{{ dataFormat(scope.row.createTime) }}</span>
          </template>
        </el-table-column>
        <el-table-column width="220" align="center" label="操作" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button v-if="checkPer(['admin','tag:top'])" type="warning" size="mini" @click="handleTop(scope)">置顶</el-button>
            <el-button v-if="checkPer(['admin','tag:edit'])" type="primary" size="mini" @click="handleEdit(scope)">编辑</el-button>
            <el-button v-if="checkPer(['admin','tag:del'])" size="mini" type="danger" @click="remove(scope)">删除
            </el-button>
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
    <el-dialog center :title="title" :visible.sync="dialogFormVisible">

      <el-form ref="dataForm" :rules="rules" :model="tag">
        <el-form-item label="标签名" prop="name" :label-width="formLabelWidth">
          <el-input v-model="tag.name" />
        </el-form-item>
        <el-form-item label="排序" prop="sort" :label-width="formLabelWidth">
          <el-input v-model="tag.sort" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="closeDialogForm">取 消</el-button>
        <el-button type="primary" @click="submit">确认</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { fetchTags, remove, add, info, update, deleteBatch, top } from '@/api/blogs/tags'
import { parseTime } from '@/utils'
import { hasAuth } from '@/utils/auth'
import { mapGetters } from 'vuex'
import RightToolbar from '@/components/RightToolbar/index.vue'

export default {
  components: { RightToolbar },
  data() {
    return {
      // 加载层信息
      loading: [],
      tableData: [],
      formLabelWidth: '120px',
      dialogFormVisible: false,
      showSearch: true,
      isEditForm: 0,
      total: null,
      multipleSelection: [],
      title: null,
      visible: false,
      tag: {},
      params: {
        name: null,
        pageNo: 1,
        pageSize: 10
      },
      rules:
        {
          'name': [
            { required: true, message: '必填字段', trigger: 'change' },
            { min: 1, max: 20, message: '长度在1到20个字符' }
          ],
          'sort': [
            { required: true, message: '必填字段', trigger: 'change' },
            { pattern: /^[0-9]\d*$/, message: '排序字段只能为自然数' }
          ]
        },
      permission: {
        add: ['admin', 'tag:add'],
        edit: ['admin', 'tag:edit'],
        del: ['admin', 'tag:del'],
        deleteBatch: ['admin', 'tag:deleteBatch'],
        top: ['admin', 'tag:top']
      }
    }
  },
  created() {
    this.openLoading()
    this.fetchTags()
  },
  methods: {
    fetchTags: function() {
      fetchTags(this.params).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
        this.loading.close()
      }).catch(err => {
        console.log(err)
      })
    },
    submit: function() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          if (this.isEditForm) {
            update(this.tag).then(res => {
              this.$message.success('修改标签成功')
              this.fetchTags()
              this.closeDialogForm()
            }).catch(err => {
              console.log(err)
            })
          } else {
            add(this.tag).then(res => {
              this.$message.success('添加标签成功')
              this.tag = res.data
              this.fetchTags()
              this.closeDialogForm()
            }).catch(err => {
              console.log(err)
            })
          }
        } else {
          console.error('no submit')
        }
      })
    },
    remove: function(scope) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        remove(scope.row.id).then(res => {
          this.$message.success('删除标签成功')
          this.fetchTags()
        }).catch(err => {
          console.log(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消删除'
        })
      })
    },
    handleCreate: function() {
      this.isEditForm = 0
      this.tag = this.getFormObject()
      this.title = '新增标签'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    handleEdit: function(scope) {
      info(scope.row.id).then(res => {
        this.tag = res.data
        this.isEditForm = 1
        this.title = '修改标签'
        this.dialogFormVisible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].clearValidate()
        })
      })
    },
    getFormObject: function() {
      return {
        name: '',
        sort: ''
      }
    },
    handleTop: function(scope) {
      this.$confirm('此操作将会把该标签放到首位, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        top(scope.row.id).then(res => {
          this.$message.success('置顶标签成功')
          this.fetchTags()
        }).catch(err => {
          console.log(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消置顶'
        })
      })
    },
    resetQuery: function() {
      this.params.name = null
      this.fetchTags()
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.fetchTags()
    },
    handleDelete: function() {
      if (!this.multipleSelection.length) {
        this.$message.error('请选择要删除的标签')
        return false
      }
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const ids = []
        this.multipleSelection.forEach(item => {
          ids.push(item.id)
        })
        deleteBatch(ids).then(res => {
          this.$message.success('批量删除标签成功')
          this.fetchTags()
        }).catch(err => {
          console.log(err)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消删除'
        })
      })
    },
    closeDialogForm: function() {
      this.tag = {}
      this.dialogFormVisible = false
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.fetchTags()
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.fetchTags()
    },
    handleSelectionChange: function(val) {
      this.multipleSelection = val
    },
    // 打开加载层
    openLoading() {
      this.loading = this.$loading({
        lock: true,
        text: '正在加载中~',
        spinner: 'el-icon-loading',
        background: 'rgba(0, 0, 0, 0.7)'
      })
    },
    dataFormat: function(time) {
      return parseTime(time)
    }
  }
}
</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  overflow: hidden;
  width: 200px;
  height: 110px;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-img-icon {
  font-size: 28px;
  color: #8c939d;
  line-height: 110px;
  text-align: center;
}

.imgAvatar {
  width: 200px;
  height: 110px;
  display: block;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  margin: 0, 0, 0, 10px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

#imgIcon {
  color: #fff;
  font-size: 1.5rem;
  position: absolute;
  top: 1rem;
  left: 1rem;
  bottom: 1.4rem;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 195px;
  height: 105px;
  line-height: 105px;
  text-align: center;
}

.imgBody {
  width: 195px;
  height: 105px;
  border: solid 2px #ffffff;
  float: left;
  position: relative;
}

.uploadImgBody {
  margin-left: 5px;
  width: 195px;
  height: 105px;
  border: dashed 1px #c0c0c0;
  float: left;
  position: relative;
}

.uploadImgBody :hover {
  border: dashed 1px #00ccff;
}

.inputClass {
  position: absolute;
}

.tag-cover {
  position: relative;
  width: 100%;
  height: 80px;
  border-radius: 4px;
}
</style>
