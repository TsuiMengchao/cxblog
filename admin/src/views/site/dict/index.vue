<template>
  <div class="app-container">
    <!-- 查询和其他操作 -->
    <el-form v-show="showSearch" ref="form" :inline="true" :model="params" label-width="68px">
      <el-form-item label="字典名称">
        <el-input v-model="params.name" style="width: 200px" size="small" placeholder="请输入字典名称" />
      </el-form-item>
      <el-form-item label="是否发布">
        <el-select
          v-model="params.isPublish"
          filterable
          size="small"
          clearable
          reserve-keyword
          placeholder="是否发布"
          @change="handleFind"
        >
          <el-option
            v-for="(item) in isPublishList"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
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
          type="primary"
          icon="el-icon-plus"
          size="small"
          @click="handleAdd"
        >新增
        </el-button>
      </el-col> <el-col :span="1.5">
        <el-button
          v-if="canDeleteBatch"
          :disabled="!multipleSelection.length"
          type="danger"
          icon="el-icon-delete"
          size="small"
          @click="handleDeleteBatch"
        >批量删除
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="fetchDictList" />
    </el-row>

    <div style="margin-top: 5px">
      <el-table
        border
        :data="tableData"
        style="width: 100%"
        :default-sort="{prop: 'sort', order: 'descending'}"
        @selection-change="handleSelectionChange"
        @sort-change="changeSort"
      >
        <el-table-column align="center" type="selection" />
        <el-table-column label="字典类型" width="200" align="center">
          <template slot-scope="scope">
            <el-tag type="warning" style="cursor: pointer">{{ scope.row.name }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="字典名称" width="150" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.description }}</span>
          </template>
        </el-table-column>
        <el-table-column label="备注" width="250" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.remark }}</span>
          </template>
        </el-table-column>

        <el-table-column
          label="发布状态"
          width="110"
          align="center"
          prop="isPublish"
          sortable="custom"
          :sort-by="['isPublish']"
        >
          <template slot-scope="scope">
            <el-tag
              v-for="item in isPublishList"
              v-if="scope.row.isPublish === item.value"
              :key="item.value"
              :type="item.style"
            >{{ item.label }}
            </el-tag>
          </template>
        </el-table-column>

        <el-table-column
          label="排序"
          width="80"
          align="center"
          prop="sort"
          sortable="custom"
          :sort-orders="['ascending', 'descending']"
        >
          <template slot-scope="scope">
            <span>{{ scope.row.sort }}</span>
          </template>
        </el-table-column>

        <el-table-column
          label="创建时间"
          width="160"
          align="center"
          prop="createTime"
          sortable="custom"
          :sort-by="['createTime']"
        >
          <template slot-scope="scope">
            <span>{{ dataFormat(scope.row.createTime) }}</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center" min-width="240">
          <template slot-scope="scope">
            <el-button type="success" size="mini" @click="handleList(scope.row)">列表</el-button>
            <el-button v-if="canUpdate" type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button v-if="canDelete" type="danger" size="mini" @click="handleDelete(scope.row)">删除</el-button>
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

        <el-form-item label="字典名称" :label-width="formLabelWidth" prop="type">
          <el-input v-model="form.name" auto-complete="off" />
        </el-form-item>

        <el-form-item label="字典描述" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.description" auto-complete="off" />
        </el-form-item>

        <el-form-item label="发布状态" :label-width="formLabelWidth" prop="isPublish">
          <el-radio-group v-model="form.isPublish" size="small">
            <el-radio v-for="(item) in isPublishList" :key="item.value" :label="item.value" border>{{ item.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="form.remark" auto-complete="off" />
        </el-form-item>

        <el-form-item label="排序" :label-width="formLabelWidth" prop="sort">
          <el-input v-model="form.sort" auto-complete="off" />
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
import { addDict, deleteBatchDict, deleteDict, fetchDictList, updateDict } from '@/api/site/dict'
import { getDataByDictType } from '@/api/site/dictData'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'
import { parseTime } from '@/utils'

export default {
  data() {
    return {
      query: {}, // 查询对象
      multipleSelection: [], // 多选，用于批量删除
      tableData: [],
      isPublishList: [],
      publishDefaultValue: null,
      keyword: '',
      params: {
        name: null,
        isPublish: null,
        descColumn: null, // 降序字段
        ascColumn: null, // 升序字段
        pageNo: 1,
        pageSize: 10
      },
      total: 0, // 总数量
      title: '增加字典类型',
      dialogFormVisible: false, // 控制弹出框
      showSearch: true,
      formLabelWidth: '120px',
      isEditForm: false,
      form: {},
      rules: {
        type: [
          { required: true, message: '字典类型不能为空', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在1到20个字符' }
        ],
        name: [
          { required: true, message: '字典名称不能为空', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在1到20个字符' }
        ],
        isPublish: [
          { required: true, message: '发布状态不能为空', trigger: 'blur' }
        ],
        sort: [
          { required: true, message: '排序字段不能为空', trigger: 'blur' },
          { pattern: /^[0-9]\d*$/, message: '排序字段只能为自然数' }
        ]
      }
    }
  },
  computed: {
    ...mapGetters([
      'pres'
    ]),
    canList() {
      return hasAuth(this.pres, 'blogDict:list')
    },
    canAdd() {
      return hasAuth(this.pres, 'blogDict:add')
    },
    canUpdate() {
      return hasAuth(this.pres, 'blogDict:edit')
    },
    canDelete() {
      return hasAuth(this.pres, 'blogDict:del')
    },
    canDeleteBatch() {
      return hasAuth(this.pres, 'blogDict:deleteBatch')
    }
  },
  created() {
    this.getDictList()
    this.fetchDictList()
  },
  methods: {
    dataFormat: function(time) {
      return parseTime(time)
    },
    // 字段排序
    changeSort: function(val) {
      // 根据当前排序重新获取后台数据,一般后台会需要一个排序的参数
      if (val.order === 'ascending') {
        this.params.ascColumn = val.prop
        this.params.descColumn = ''
      } else {
        this.params.ascColumn = ''
        this.params.descColumn = val.prop
      }
      this.fetchList()
    },
    fetchDictList: function() {
      fetchDictList(this.params).then(response => {
        this.tableData = response.data.records
        this.total = response.data.total
      }).catch(err => {
        console.log(err)
      })
    },
    // 这里可以设置一些初始值
    getFormObject: function() {
      return {
        isPublish: this.publishDefaultValue,
        sort: 0
      }
    },
    getDictList: function() {
      const dictTypes = ['sys_publish_status']
      getDataByDictType(dictTypes).then(response => {
        const dictMap = response.data
        this.isPublishList = dictMap.sys_publish_status.list
        this.publishDefaultValue = dictMap.sys_publish_status.defaultValue
      }).catch(err => {
        console.error(err)
      })
    },
    resetQuery: function() {
      this.params.name = null
      this.params.isPublish = null
      this.fetchDictList()
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.fetchDictList()
    },
    handleAdd: function() {
      this.title = '增加字典类型'
      this.dialogFormVisible = true
      this.form = this.getFormObject()
      this.isEditForm = false
    },
    handleEdit: function(row) {
      this.title = '编辑字典类型'
      this.isEditForm = true
      this.form = row
      this.dialogFormVisible = true
    },
    handleDelete: function(row) {
      const that = this
      this.$confirm('此操作将把字典类型删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteDict(row.id).then(response => {
          this.$message.success(response.message)
          that.fetchDictList()
        }).catch(err => {
          console.error(err)
        })
      }).catch(() => {
        this.$message.info('已取消删除')
      })
    },
    handleDeleteBatch: function(row) {
      const that = this
      if (that.multipleSelection.length <= 0) {
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
          that.multipleSelection.forEach(item => {
            ids.push(item.id)
          })
          deleteBatchDict(ids).then(response => {
            this.$message.success(response.message)
            that.fetchDictList()
          }).catch(err => {
            console.error(err)
          })
        }).catch(() => {
          this.$message.info('已取消删除')
        })
    },
    handleList: function(row) {
      this.$router.push({
        path: '/site/blogDictData',
        query: { dictId: row.id }
      })
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.fetchDictList()
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.fetchDictList()
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
            updateDict(this.form).then(response => {
              this.$message.success('修改成功')
              this.dialogFormVisible = false
              this.fetchDictList()
            }).catch(err => {
              console.error(err)
            })
          } else {
            addDict(this.form).then(response => {
              this.$message.success('添加成功')
              this.dialogFormVisible = false
              this.fetchDictList()
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
