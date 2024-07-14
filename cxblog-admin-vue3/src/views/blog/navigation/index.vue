<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="网站分类id" prop="siteClassId">
        <el-input
          v-model="queryParams.siteClassId"
          placeholder="请输入网站分类id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网站标题" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入网站标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网址地址" prop="url">
        <el-input
          v-model="queryParams.url"
          placeholder="请输入网址地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网站logo" prop="logo">
        <el-input
          v-model="queryParams.logo"
          placeholder="请输入网站logo"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网站描述" prop="info">
        <el-input
          v-model="queryParams.info"
          placeholder="请输入网站描述"
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
          v-hasPermi="['blog:navigation:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:navigation:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:navigation:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:navigation:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="navigationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="网站分类id" align="center" prop="siteClassId" />
      <el-table-column label="网站标题" align="center" prop="name" />
      <el-table-column label="网址地址" align="center" prop="url" />
      <el-table-column label="网站logo" align="center" prop="logo" />
      <el-table-column label="网站描述" align="center" prop="info" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:navigation:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:navigation:remove']">删除</el-button>
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

    <!-- 添加或修改网站导航对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="navigationRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="网站分类id" prop="siteClassId">
          <el-input v-model="form.siteClassId" placeholder="请输入网站分类id" />
        </el-form-item>
        <el-form-item label="网站标题" prop="name">
          <el-input v-model="form.name" placeholder="请输入网站标题" />
        </el-form-item>
        <el-form-item label="网址地址" prop="url">
          <el-input v-model="form.url" placeholder="请输入网址地址" />
        </el-form-item>
        <el-form-item label="网站logo" prop="logo">
          <el-input v-model="form.logo" placeholder="请输入网站logo" />
        </el-form-item>
        <el-form-item label="网站描述" prop="info">
          <el-input v-model="form.info" placeholder="请输入网站描述" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
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

<script setup name="Navigation">
import { listNavigation, getNavigation, delNavigation, addNavigation, updateNavigation } from "@/api/blog/navigation";

const { proxy } = getCurrentInstance();

const navigationList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    siteClassId: null,
    name: null,
    url: null,
    logo: null,
    info: null,
  },
  rules: {
    siteClassId: [
      { required: true, message: "网站分类id不能为空", trigger: "blur" }
    ],
    name: [
      { required: true, message: "网站标题不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询网站导航列表 */
function getList() {
  loading.value = true;
  listNavigation(queryParams.value).then(response => {
    navigationList.value = response.rows;
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
    id: null,
    siteClassId: null,
    name: null,
    url: null,
    logo: null,
    info: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("navigationRef");
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
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加网站导航";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getNavigation(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改网站导航";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["navigationRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateNavigation(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addNavigation(form.value).then(response => {
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
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除网站导航编号为"' + _ids + '"的数据项？').then(function() {
    return delNavigation(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/navigation/export', {
    ...queryParams.value
  }, `navigation_${new Date().getTime()}.xlsx`)
}

getList();
</script>
