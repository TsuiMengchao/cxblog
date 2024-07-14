<template>
  <div class="app-container">
    <!-- 查询和其他操作 -->
     <el-form v-show="showSearch" :inline="true" ref="form" :model="params" label-width="68px">
            <el-form-item label="名称">
                <el-input style="width: 200px" size="small" v-model="params.name" placeholder="请输入名称" />
            </el-form-item>

            <el-form-item>
                <el-button type="primary" icon="el-icon-search" size="small" @click="handleFind">查找</el-button>
                <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重置</el-button>
            </el-form-item>
        </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button v-if="canAdd" type="primary" icon="el-icon-plus" size="small" @click="handleAdd">新增
        </el-button>
      </el-col> <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','sponsor:del'])"
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
        <el-table-column label="用户名" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.nickname }}</span>
          </template>
        </el-table-column>
        <el-table-column label="支付截图" align="center">
          <template slot-scope="scope">
            <el-image
              style="width: 100px; height: 100px"
              :src="scope.row.payImg"
              :preview-src-list="[scope.row.payImg]"
            />
          </template>
        </el-table-column>

        <el-table-column label="状态" align="center">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status == 0" type="warning">审核</el-tag>
            <el-tag v-else type="success">通过</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="创建时间" align="center" prop="createTime">
          <template slot-scope="scope">
            <span>{{ scope.row.createTime }}</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button v-if="checkPer(['admin','sponsor:edit'])" type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
              v-if="checkPer(['admin','sponsor:del'])"
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
    <el-dialog center title="编辑" :visible.sync="dialogFormVisible" width="30%">
      <el-form ref="form" :model="form" :rules="rules">

        <el-form-item label="打赏金额" :label-width="formLabelWidth" prop="money">
          <el-input-number v-model="form.money" :precision="2" :step="0.1" />
        </el-form-item>

        <el-form-item label="状态" :label-width="formLabelWidth" prop="status">
          <el-radio v-model="form.status" :label="0">审核</el-radio>
          <el-radio v-model="form.status" :label="1">通过</el-radio>
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
import { getSponsorList, deleteSponsor, updateSponsor, getSponsorInfo } from '@/api/site/sponsor'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'

export default {
  data() {
    return {
      multipleSelection: [], // 多选，用于批量删除
      tableData: [],
      status: ['禁用', '正常'],
      params: {
        pageNo: 1,
        pageSize: 10
      },
      total: 0, // 总数量
      dialogFormVisible: false, // 控制弹出框
      showSearch: true,
      formLabelWidth: '120px',
      form: {},
      rules: {
        money: [
          { required: true, message: '打赏金额不能为空', trigger: 'blur' }
        ]
      },
      permission: {
        edit: ['admin', 'sponsor:edit'],
        deleteBatch: ['admin', 'sponsor:del']
      }
    }
  },
  created() {
    this.getSponsorList()
  },
  methods: {

    getSponsorList: function() {
      getSponsorList(this.params).then(response => {
        this.tableData = response.data.records
        this.total = response.data.total
      }).catch(err => {
        console.log(err)
      })
    },

    resetQuery: function() {
      this.params.name = null
      this.getSponsorList()
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.getSponsorList()
    },
    handleEdit: function(row) {
      getSponsorInfo(row.id).then(res => {
        this.form = res.data
        this.dialogFormVisible = true
      })
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
          deleteSponsor(ids).then(response => {
            this.multipleSelection = []
            this.$message.success(response.message)
            this.getSponsorList()
          }).catch(err => {
            console.error(err)
          })
        }).catch(() => {
          this.$message.info('已取消删除')
        })
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.getSponsorList()
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.getSponsorList()
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
          updateSponsor(this.form).then(response => {
            this.$message.success('修改成功')
            this.dialogFormVisible = false
            this.getSponsorList()
          }).catch(err => {
            console.error(err)
          })
        }
      })
    }
  }
}
</script>
