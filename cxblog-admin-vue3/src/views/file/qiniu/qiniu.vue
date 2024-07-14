<template>
  <div class="app-container">
    <!--表单组件-->
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文件名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入文件名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传或同步的时间" prop="updateTime">
        <el-date-picker clearable
          v-model="queryParams.updateTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择上传或同步的时间">
        </el-date-picker>
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
          @click="dialog = true"
          v-hasPermi="['file:qiniuContent:add']"
        >上传</el-button>
      </el-col>
        <el-col :span="1.5">
        <el-button
          type="success"
          plain
          :icon="icon"
          @click="synchronize"
          v-hasPermi="['file:qiniuContent:edit']"
        >同步</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['file:qiniuContent:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['file:qiniuContent:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 文件上传 -->
    <el-dialog v-model="dialog" :close-on-click-modal="false" append-to-body width="500px" @close="doSubmit">
      <el-upload
          :before-remove="handleBeforeRemove"
          :on-success="handleSuccess"
          :on-error="handleError"
          v-model:file-list="fileList"
          :headers="headers"
          :action="qiNiuUploadApi"
          class="upload-demo"
          multiple
      >
        <el-button size="small" type="primary">点击上传</el-button>
        <div slot="tip" style="display: block;" class="el-upload__tip">请勿上传违法文件，且文件不超过15M</div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="doSubmit">确认</el-button>
      </div>
    </el-dialog>

    <el-table v-loading="loading" :data="qiniuContentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="contentId" />
      <el-table-column label="Bucket 识别符" align="center" prop="bucket" />
      <el-table-column label="文件名称" align="center" prop="name" />
      <el-table-column label="文件大小" align="center" prop="size" />
      <el-table-column label="文件类型：私有或公开" align="center" prop="type" />
      <el-table-column label="文件url" align="center" prop="url" />
      <el-table-column label="上传或同步的时间" align="center" prop="updateTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['file:qiniuContent:remove']">删除</el-button>
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

    <!-- 添加或修改七牛云文件存储对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="qiniuContentRef" :model="form" :rules="rules" label-width="80px">
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Qiniu">
import {listQiniuContent, delQiniuContent, updateQiniuContent, getQiniuCofig, updateQiniuCofig, sync} from "@/api/file/qiniu";
import {getToken} from "@/utils/auth.js";
import {Refresh, Loading} from "@element-plus/icons-vue";
import {parseTime} from "@/utils/cxutils.js";

const { proxy } = getCurrentInstance();

const qiniuContentList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const dialog = ref(false);
const dialogImageUrl = ref(''); const dialogVisible = ref(false);
const fileList = ref([]);
const files = ref([]);
const headers=ref({ 'Authorization': getToken() });
const qiNiuUploadApi = ref(import.meta.env.VITE_APP_BASE_API+"/file/qiNiuContent");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: null,
    updateTime: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);
var icon = ref("Refresh");
/** 查询七牛云文件存储列表 */
function getList() {
  loading.value = true;
  listQiniuContent(queryParams.value).then(response => {
    qiniuContentList.value = response.rows;
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
    contentId: null,
    bucket: null,
    name: null,
    size: null,
    type: null,
    url: null,
    suffix: null,
    updateTime: null
  };
  proxy.resetForm("qiniuContentRef");
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
  ids.value = selection.map(item => item.contentId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加七牛云文件存储";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();

}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["qiniuContentRef"].validate(valid => {
    if (valid) {
      if (form.value.contentId != null) {
        updateQiniuContent(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _contentIds = [row.contentId] || ids.value;
  proxy.$modal.confirm('是否确认删除七牛云文件存储编号为"' + _contentIds + '"的数据项？').then(function() {
    return delQiniuContent(_contentIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('file/qiNiuContent/export', {
    ...queryParams.value
  }, `qiniuContent_${new Date().getTime()}.xlsx`)
}

// 刷新列表数据
function doSubmit() {
  fileList.value = []
  dialogVisible.value = false
  dialogImageUrl.value = ''
  dialog.value = false
  getList()
}

function handleBeforeRemove(file, fileList) {
  for (let i = 0; i < this.files.length; i++) {
    if (this.files[i].uid === file.uid) {
      delQiniuContent([this.files[i].id]).then(res => {})
      return true
    }
  }
}

function handleSuccess(response, file, fileList) {
  const uid = file.uid
  const id = response.id
  this.files.push({ uid, id })
}

// 监听上传失败
function handleError(e, file, fileList) {
  const msg = JSON.parse(e.message)
  proxy.$modal.msgError(msg.message)
}



// 同步数据
function synchronize() {
  icon.value = 'Loading'
  sync().then(res => {
    icon.value = 'Refresh'
    proxy.$modal.msgSuccess('数据同步成功')
    getList()
  }).catch(err => {
    icon.value = 'Refresh'
    console.log(err)
  })
}

getList();
</script>
