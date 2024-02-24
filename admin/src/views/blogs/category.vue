<template>
  <div class="app-container">
    <!--查询or添加-->
    <el-form v-show="showSearch" ref="form" :inline="true" :model="params" label-width="68px">
      <el-form-item label="分类名称">
        <el-input v-model="params.name" style="width: 200px" size="small" placeholder="请输入分类名称" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="small" @click="handleFind">查找</el-button>
        <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          v-if="canAdd"
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
          v-if="canDeleteBatch"
          size="small"
          :disabled="!multipleSelection.length"
          class="filter-item"
          type="danger"
          icon="el-icon-delete"
          @click="handleDelete"
        >批量删除
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="fetchCategory" />
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
        <el-table-column width="170" align="center" label="图标">
          <template slot-scope="scope">
            <i :class="scope.row.icon" />
          </template>
        </el-table-column>
        <el-table-column prop="name" align="center" label="分类名" width="180" />
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
            <el-button v-if="canTop" type="warning" size="mini" @click="handleTop(scope)">置顶</el-button>
            <el-button v-if="canUpdate" type="primary" size="mini" @click="handleEdit(scope)">编辑</el-button>
            <el-button v-if="canDel" size="mini" type="danger" @click="remove(scope)">删除
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

    <!--添加修改区域-->
    <el-dialog center :title="title" :visible.sync="dialogFormVisible">

      <el-form ref="dataForm" :rules="rules" :model="category">
        <el-form-item label="图标" :label-width="formLabelWidth" prop="icon">
          <el-input v-model="category.icon" placeholder="请输入前图标名称">
            <el-button slot="append" icon="el-icon-setting" @click="openIconsDialog('prefix-icon')">
              选择
            </el-button>
          </el-input>
        </el-form-item>
        <el-form-item label="分类名" prop="name" :label-width="formLabelWidth">
          <el-input v-model="category.name" />
        </el-form-item>
        <el-form-item label="排序" prop="sort" :label-width="formLabelWidth">
          <el-input v-model="category.sort" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="closeDialogForm">取 消</el-button>
        <el-button type="primary" @click="submit">确认</el-button>
      </div>
    </el-dialog>
    <icons-dialog :visible.sync="iconsVisible" :current="category.icon" @select="setIcon" />
  </div>
</template>
<script>
import { fetchCategory, add, info, update, deleteBatch, top, remove } from '@/api/blogs/category'
import { parseTime } from '@/utils'
import { hasAuth } from '@/utils/auth'
import { mapGetters } from 'vuex'
import IconsDialog from '../../components/IconsDialog'
export default {
  components: {
    IconsDialog
  },
  data() {
    return {
      uploadPictureHost: process.env.VUE_APP_BASE_API + '/file/upload',
      // 加载层信息
      loading: [],
      tableData: [],
      formLabelWidth: '120px',
      dialogFormVisible: false,
      visible: false,
      showSearch: true,
      isEditForm: 0,
      total: null,
      multipleSelection: [],
      title: null,
      iconsVisible: false,
      category: {},
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
        ],
        'avatar': [
          { required: true, message: '必填字段', trigger: 'change' }
        ]
      }
    }
  },
  created() {
    this.openLoading()
    this.fetchCategory()
  },
  computed: {
    ...mapGetters([
      'pres'
    ]),
    canAdd: function() {
      return hasAuth(this.pres, 'category:add')
    },
    canDel: function() {
      return hasAuth(this.pres, 'category:del')
    },
    canDeleteBatch: function() {
      return hasAuth(this.pres, 'category:deleteBatch')
    },
    canUpdate: function() {
      return hasAuth(this.pres, 'category:edit')
    },
    canTop: function() {
      return hasAuth(this.pres, 'category:top')
    }
  },
  methods: {
    openIconsDialog: function(model) {
      this.iconsVisible = true
      this.currentIconModel = model
    },
    setIcon: function(val) {
      this.category.icon = val
    },
    fetchCategory: function() {
      fetchCategory(this.params).then(res => {
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
            update(this.category).then(res => {
              this.$message.success('修改分类成功')
              this.fetchCategory()
              this.closeDialogForm()
            }).catch(err => {
              console.log(err)
            })
          } else {
            add(this.category).then(res => {
              this.$message.success('添加分类成功')
              this.fetchCategory()
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
          this.$message.success('删除分类成功')
          this.fetchCategory()
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
    handleDelete: function() {
      if (!this.multipleSelection.length) {
        this.$message.error('请选择要删除的分类')
        return false
      }
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteBatch(this.multipleSelection).then(res => {
          this.$message.success('批量删除分类成功')
          this.fetchCategory()
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
      this.category = this.getFormObject()
      this.title = '新增分类'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    handleEdit: function(scope) {
      info(scope.row.id).then(res => {
        this.category = res.data
        this.isEditForm = 1
        this.title = '修改分类'
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
      this.$confirm('此操作将会把该分类放到首位, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        top(scope.row.id).then(res => {
          this.$message.success('置顶分类成功')
          this.fetchCategory()
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
      this.fetchCategory()
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.fetchCategory()
    },

    closeDialogForm: function() {
      this.tag = {}
      this.dialogFormVisible = false
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.fetchCategory()
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.fetchCategory()
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

