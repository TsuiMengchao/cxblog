<template>
  <div class="app-container">
    <!-- 查询和其他操作 -->
    <el-form v-show="showSearch" ref="form" :inline="true" :model="params" label-width="68px">
      <el-form-item label="字典名称">
        <el-select
          v-model="params.dictId"
          size="small"
          placeholder="请选择字典名称"
          @change="handleFind"
        >
          <el-option
            v-for="item in dictTypeList"
            :key="item.id"
            :label="item.name"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="small" @click="handleFind">查找</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','blogDataDict:add'])"
          type="primary"
          icon="el-icon-plus"
          size="small"
          @click="handleAdd"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-back"
          size="small"
          @click="handleBack"
        >返回
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="checkPer(['admin','blogDataDict:deleteBatch'])"
          :disabled="!multipleSelection.length"
          type="danger"
          icon="el-icon-delete"
          size="small"
          @click="handleDeleteBatch"
        >批量删除
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="fetchDataList" />
    </el-row>

    <div style="margin-top: 5px">
      <el-table border :data="tableData" style="width: 100%" @selection-change="handleSelectionChange">
        <el-table-column align="center" type="selection" />
        <el-table-column label="字典标签" width="100" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.label }}</span>
          </template>
        </el-table-column>

        <el-table-column label="字典键值" width="100" align="center">
          <template slot-scope="scope">
            <el-tag v-if="scope.$index%5 == 0" type="warning">{{ scope.row.value }}</el-tag>
            <el-tag v-if="scope.$index%5 == 1" type="success">{{ scope.row.value }}</el-tag>
            <el-tag v-if="scope.$index%5 == 2" type="info">{{ scope.row.value }}</el-tag>
            <el-tag v-if="scope.$index%5 == 3" type="danger">{{ scope.row.value }}</el-tag>
            <el-tag v-if="scope.$index%5 == 4">{{ scope.row.value }}</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="字典类型" width="200" align="center">
          <template slot-scope="scope">
            <el-tag>{{ scope.row.dict.name }}</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="是否默认" width="100" align="center">
          <template slot-scope="scope">
            <el-tag
              v-for="item in yesOrNoList"
              v-if="scope.row.isDefault === item.value"
              :key="item.value"
              :type="item.style"
            >{{ item.label }}
            </el-tag>
          </template>
        </el-table-column>

        <el-table-column label="回显样式" width="100" align="center">
          <template slot-scope="scope">
            <el-tag :type="scope.row.style">{{ scope.row.style }}</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="排序" width="100" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.dictSort }}</span>
          </template>
        </el-table-column>

        <el-table-column label="发布状态" width="100" align="center">
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

        <el-table-column label="备注" width="200" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.remark }}</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center" min-width="200">
          <template slot-scope="scope">
            <el-button v-if="checkPer(['admin','blogDataDict:edit'])" type="primary" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button v-if="checkPer(['admin','blogDataDict:del'])" type="danger" size="mini" @click="handleDelete(scope.row)">删除</el-button>
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

        <el-form-item label="字典标签" :label-width="formLabelWidth" prop="label">
          <el-input v-model="form.label" auto-complete="off" />
        </el-form-item>

        <el-form-item label="字典键值" :label-width="formLabelWidth" prop="value">
          <el-input v-model="form.value" auto-complete="off" />
        </el-form-item>

        <el-form-item label="字典类型" :label-width="formLabelWidth" prop="dictId">
          <el-select
            v-model="form.dictId"
            disabled
            placeholder="请选择字典类型"
            style="width:200px"
          >
            <el-option
              v-for="item in dictTypeList"
              :key="item.id"
              :label="item.type"
              :value="item.id"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="回显样式" :label-width="formLabelWidth">
          <el-select v-model="form.style" clearable placeholder="回显样式" style="width:140px">
            <el-option
              v-for="item in styleType"
              :key="item.key"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="排序" :label-width="formLabelWidth" prop="sort">
          <el-input v-model="form.sort" auto-complete="off" />
        </el-form-item>

        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="form.remark" auto-complete="off" />
        </el-form-item>

        <el-form-item label="系统默认" :label-width="formLabelWidth" prop="isDefault">
          <el-radio-group v-model="form.isDefault" size="small">
            <el-radio v-for="item in yesOrNoList" :key="item.value" :label="item.value" border>{{ item.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="发布状态" :label-width="formLabelWidth" prop="isPublish">
          <el-radio-group v-model="form.isPublish" size="small">
            <el-radio label="1" border>上架</el-radio>
            <el-radio label="0" border>下架</el-radio>
          </el-radio-group>
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
  fetchDataList,
  addDictData,
  updateDictData,
  deleteDictData,
  deleteBatchDictData,
  getDataByDictType
} from '@/api/site/dictData'
import { fetchDictList } from '@/api/site/dict'
import { mapGetters } from 'vuex'
import { hasAuth } from '@/utils/auth'

export default {
  data() {
    return {
      multipleSelection: [], // 多选，用于批量删除
      isPublishList: [],
      yesOrNoList: [],
      publishDefaultValue: null,
      yesOrNoDefaultValue: null,
      dictTypeList: [],
      tableData: [],
      params: {
        dictId: null, // 从SysDictType传递过来的
        pageNo: 1,
        pageSize: 10
      },
      total: 0, // 总数量
      title: '增加字典数据',
      dialogFormVisible: false, // 控制弹出框
      showSearch: true,
      formLabelWidth: '120px',
      isEditForm: false,
      form: {},
      styleType: [
        { key: 1, label: 'default', value: 'default' },
        { key: 2, label: 'primary', value: 'primary' },
        { key: 3, label: 'success', value: 'success' },
        { key: 4, label: 'info', value: 'info' },
        { key: 5, label: 'warning', value: 'warning' },
        { key: 6, label: 'danger', value: 'danger' }
      ],
      rules: {
        label: [
          { required: true, message: '字典标签不能为空', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在1到20个字符' }
        ],
        value: [
          { required: true, message: '字典键值不能为空', trigger: 'blur' },
          { min: 1, max: 20, message: '长度在1到20个字符' }
        ],
        dictId: [
          { required: true, message: '字典类型不能为空', trigger: 'blur' }
        ],
        isDefault: [
          { required: true, message: '系统默认不能为空', trigger: 'blur' }
        ],
        isPublish: [
          { required: true, message: '发布状态不能为空', trigger: 'blur' }
        ],
        sort: [
          { required: true, message: '排序字段不能为空', trigger: 'blur' },
          { pattern: /^[0-9]\d*$/, message: '排序字段只能为自然数' }
        ]
      },
      permission: {
        add: ['admin', 'blogDataDict:add'],
        edit: ['admin', 'blogDataDict:edit'],
        del: ['admin', 'blogDataDict:del'],
        deleteBatch: ['admin', 'blogDataDict:deleteBatch']
      }
    }
  },
  created() {
    // 传递过来的dictId
    this.params.dictId = this.$route.query.dictId
    this.sysDictTypeList()
    this.getDictList()
    this.fetchDataList()
  },
  methods: {
    fetchDataList: function() {
      fetchDataList(this.params).then(response => {
        this.tableData = response.data.records
        this.total = response.data.total
      }).catch(err => {
        console.error(err)
      })
    },
    getDictList: function() {
      const dictTypes = ['sys_publish_status', 'sys_yes_no']
      getDataByDictType(dictTypes).then(response => {
        const dictMap = response.data
        this.isPublishList = dictMap.sys_publish_status.list
        this.publishDefaultValue = dictMap.sys_publish_status.defaultValue
        this.yesOrNoList = dictMap.sys_yes_no.list
        this.yesOrNoDefaultValue = dictMap.sys_yes_no.defaultValue
      }).catch(err => {
        console.error(err)
      })
    },
    sysDictTypeList: function() {
      var params = {}
      params.pageNo = 1
      params.pageSize = 100
      fetchDictList(params).then(response => {
        this.dictTypeList = response.data.records
      })
    },
    // 这里可以设置一些初始值
    getFormObject: function() {
      return {
        isPublish: this.publishDefaultValue,
        sort: 0,
        isDefault: this.yesOrNoDefaultValue,
        style: ''
      }
    },
    handleFind: function() {
      this.params.pageNo = 1
      this.fetchDataList()
    },
    handleBack: function() {
      this.$router.push({ path: '/site/blogDict' })
    },
    handleAdd: function() {
      this.title = '增加数据字典'
      this.dialogFormVisible = true
      this.form = this.getFormObject()
      this.form.dictId = this.params.dictId
      this.isEditForm = false
    },
    handleEdit: function(row) {
      this.title = '编辑字典数据'
      this.dialogFormVisible = true
      this.isEditForm = true
      this.form = row
      this.form.dictId = this.params.dictId
    },
    handleDelete: function(row) {
      var that = this
      this.$confirm('此操作将把字典数据删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteDictData(row.id).then(response => {
          this.$message.success(response.message)
          that.fetchDataList()
        }).catch(err => {
          console.error(err)
        })
      }).catch(() => {
        this.$message.info('已取消删除')
      })
    },
    handleDeleteBatch: function() {
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
        deleteBatchDictData(ids).then(res => {
          this.$message.success('批量删除成功')
          this.fetchDataList()
        }).catch(err => {
          console.error(err)
        })
      }).catch(() => {
        this.$message.info('已取消删除')
      })
    },
    handleCurrentChange: function(val) {
      this.params.pageNo = val
      this.fetchDataList()
    },
    handleSizeChange: function(val) {
      this.params.pageSize = val
      this.fetchDataList()
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
            updateDictData(this.form).then(response => {
              this.$message.success(response.message)
              this.dialogFormVisible = false
              this.fetchDataList()
            }).catch(err => {
              console.error(err)
            })
          } else {
            addDictData(this.form).then(response => {
              this.$message.success(response.message)
              this.dialogFormVisible = false
              this.fetchDataList()
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
