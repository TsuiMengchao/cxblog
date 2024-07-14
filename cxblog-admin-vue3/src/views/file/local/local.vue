<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文件名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入文件名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['file:localContent:add']"
        >上传</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['file:localContent:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['file:localContent:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['file:localContent:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="localContentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="storageId" />
      <el-table-column label="文件名" align="center" prop="name" />
      <el-table-column label="路径" align="center" prop="path" />
      <el-table-column label="类型" align="center" prop="type" />
      <el-table-column label="大小" align="center" prop="size" />
      <el-table-column label="创建者" align="center" prop="createBy" />
      <el-table-column label="创建日期" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['file:localContent:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['file:localContent:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改本地存储对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="localContentRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件名">
          <el-input v-model="form.name" style="width: 370px;" />
        </el-form-item>
        <!--   上传文件   -->
        <el-form-item v-if="title='添加本地存储'" label="上传">
          <el-upload
              ref="uploadRef"
              :limit="1"
              :before-upload="beforeUpload"
              :auto-upload="false"
              :headers="headers"
              :on-success="handleSuccess"
              :on-error="handleError"
              :action="fileUploadApi + '?name=' + form.name"
          >
            <div class="cxblog-upload"><i class="el-icon-upload" /> 添加文件</div>
            <div slot="tip" class="el-upload__tip">可上传任意格式文件，且不超过100M</div>
          </el-upload>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button v-if="title='添加本地存储'" type="primary" @click="upload">确 定</el-button>
          <el-button v-else type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="LocalContent">
import { listLocalContent, getLocalContent, delLocalContent, addLocalContent, updateLocalContent } from "@/api/file/local";
import {getToken} from "@/utils/auth.js";

const { proxy } = getCurrentInstance();

const localContentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const uploadRef = ref(null)

const headers =ref({ 'Authorization': getToken() })
const fileUploadApi = ref(import.meta.env.VITE_APP_BASE_API+"/file/local");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询本地存储列表 */
function getList() {
  loading.value = true;
  listLocalContent(queryParams.value).then(response => {
    localContentList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    name: null
  };
  proxy.resetForm("localContentRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.storageId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加本地存储";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _storageId = row.storageId || ids.value
  getLocalContent(_storageId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改本地存储";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["localContentRef"].validate(valid => {
    if (valid) {
      if (form.value.storageId != null) {
        updateLocalContent(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addLocalContent(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _storageIds = row.storageId || ids.value;
  proxy.$modal.confirm('是否确认删除本地存储编号为"' + _storageIds + '"的数据项？').then(function() {
    return delLocalContent(_storageIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('file/localContent/export', {
    ...queryParams.value
  }, `localContent_${new Date().getTime()}.xlsx`)
}

function beforeUpload(file) {
  let isLt2M = true
  isLt2M = file.size / 1024 / 1024 < 100
  if (!isLt2M) {
    loading.value = false
    proxy.$modal.messageError('上传文件大小不能超过 100MB!')
  }
  form.value.name = file.name
  return isLt2M
}
function handleSuccess(response, file, fileList) {
  proxy.$modal.notify('上传成功')
  getList();
}
// 监听上传失败
function handleError(e, file, fileList) {
  const msg = JSON.parse(e.message)
  proxy.$modal.notifyError(msg.message)
  loading.value = false
}

// 上传文件
function upload() {
  uploadRef.value.submit()
}

getList();
</script>
