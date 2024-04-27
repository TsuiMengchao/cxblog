<template>
  <div class="app-container">
    <!-- 查询和其他操作 -->
    <el-form v-show="showSearch" ref="form" :inline="true" :model="params" label-width="68px">
      <el-form-item label="名称">
        <el-input v-model="params.name" style="width: 200px" size="small" placeholder="请输入名称" />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="small" @click="handleFind">查找</el-button>
        <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button v-if="checkPer(['admin','talk:add'])" type="primary" icon="el-icon-plus" size="small" @click="handleAdd">新增
        </el-button>
      </el-col> <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','talk:del'])"
          :disabled="!multipleSelection.length"
          type="danger"
          icon="el-icon-delete"
          size="small"
          @click="handleDeleteBatch(null)"
        >批量删除
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="getTalkList" />
    </el-row>

    <div style="margin-top: 5px">
      <el-table border :data="tableData" style="width: 100%" @selection-change="handleSelectionChange">
        <el-table-column align="center" type="selection" />
        <el-table-column label="名称" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column label="status" align="center">
          <template slot-scope="scope">
            <el-tag>{{ status[scope.row.status] }}</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="创建时间" align="center" prop="createTime">
          <template slot-scope="scope">
            <span>{{ scope.row.createTime }}</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button v-if="checkPer(['admin','talk:edit'])" type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
              v-if="checkPer(['admin','talk:del'])"
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
    <el-dialog center :title="title" :visible.sync="dialogFormVisible" width="30%">
      <el-form ref="form" :model="form" :rules="rules">

        <el-form-item label="名称" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" auto-complete="off" />
        </el-form-item>

        <el-form-item label="状态" :label-width="formLabelWidth" prop="status">
          <el-radio v-model="form.status" :label="0">禁用</el-radio>
          <el-radio v-model="form.status" :label="1">正常</el-radio>
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
import { getTalkList, deleteTalk, addTalk, updateTalk, infoTalk } from '@/api/site/talk'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'
import { parseTime } from '@/utils'
import RightToolbar from '@/components/RightToolbar/index.vue'

export default {
  components: { RightToolbar },
  data() {
    return {
      multipleSelection: [], // 多选，用于批量删除
      tableData: [],
      status: ['禁用', '正常'],
      params: {
        name: null,
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
          { required: true, message: '名称不能为空', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在1到10个字符' }
        ]
      },
      permission: {
        add: ['admin', 'talk:add'],
        edit: ['admin', 'talk:edit'],
        deleteBatch: ['admin', 'talk:del']
      }
    }
  },
  created() {
    this.getTalkList()
  },
  methods: {

    getTalkList: function() {
      getTalkList(this.params).then(response => {
        this.tableData = response.data.records
        this.total = response.data.total
      }).catch(err => {
        console.log(err)
      })
    },
    // 这里可以设置一些初始值
    getFormObject: function() {
      return {
        name: null,
        status: 1
      }
    },

    resetQuery: function() {
      this.params.name = null
      this.getTalkList()
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.getTalkList()
    },
    handleAdd: function() {
      this.title = '添加'
      this.dialogFormVisible = true
      this.form = this.getFormObject()
      this.isEditForm = false
    },
    handleEdit: function(row) {
      this.title = '编辑'
      this.isEditForm = true
      this.form = row
      this.dialogFormVisible = true
    },

    handleDeleteBatch: function(row) {
      if (row) {
        this.multipleSelection.push(row)
      }
      if (this.multipleSelection.length <= 0) {
        this.$message.error('请先选中需要删除的内容!')
        return
      }
      this.$confirm('此操作将把选中字典类型删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          const ids = []
          this.multipleSelection.forEach(item => {
            ids.push(item.id)
          })
          deleteTalk(ids).then(response => {
            this.multipleSelection = []
            this.$message.success(response.message)
            this.getTalkList()
          }).catch(err => {
            console.error(err)
          })
        }).catch(() => {
          this.$message.info('已取消删除')
        })
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.getTalkList()
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.getTalkList()
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
            updateTalk(this.form).then(response => {
              this.$message.success('修改成功')
              this.dialogFormVisible = false
              this.getTalkList()
            }).catch(err => {
              console.error(err)
            })
          } else {
            addTalk(this.form).then(response => {
              this.$message.success('添加成功')
              this.dialogFormVisible = false
              this.getTalkList()
            }).catch(err => {
              console.error(err)
            })
          }
        }
      })
    }
  }
}
</script>
