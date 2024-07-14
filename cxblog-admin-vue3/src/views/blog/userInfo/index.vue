<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="邮箱号" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入邮箱号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户昵称" prop="nickname">
        <el-input
          v-model="queryParams.nickname"
          placeholder="请输入用户昵称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户简介" prop="intro">
        <el-input
          v-model="queryParams.intro"
          placeholder="请输入用户简介"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="个人网站" prop="webSite">
        <el-input
          v-model="queryParams.webSite"
          placeholder="请输入个人网站"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否禁用" prop="isDisable">
        <el-input
          v-model="queryParams.isDisable"
          placeholder="请输入是否禁用"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="个人中心背景图" prop="bjCover">
        <el-input
          v-model="queryParams.bjCover"
          placeholder="请输入个人中心背景图"
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
          v-hasPermi="['blog:userInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:userInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:userInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:userInfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="userInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户ID" align="center" prop="id" />
      <el-table-column label="邮箱号" align="center" prop="email" />
      <el-table-column label="用户昵称" align="center" prop="nickname" />
      <el-table-column label="用户头像" align="center" prop="avatar" />
      <el-table-column label="用户简介" align="center" prop="intro" />
      <el-table-column label="个人网站" align="center" prop="webSite" />
      <el-table-column label="是否禁用" align="center" prop="isDisable" />
      <el-table-column label="个人中心背景图" align="center" prop="bjCover" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:userInfo:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:userInfo:remove']">删除</el-button>
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

    <!-- 添加或修改用户信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="userInfoRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="邮箱号" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱号" />
        </el-form-item>
        <el-form-item label="用户昵称" prop="nickname">
          <el-input v-model="form.nickname" placeholder="请输入用户昵称" />
        </el-form-item>
        <el-form-item label="用户头像" prop="avatar">
          <el-input v-model="form.avatar" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="用户简介" prop="intro">
          <el-input v-model="form.intro" placeholder="请输入用户简介" />
        </el-form-item>
        <el-form-item label="个人网站" prop="webSite">
          <el-input v-model="form.webSite" placeholder="请输入个人网站" />
        </el-form-item>
        <el-form-item label="是否禁用" prop="isDisable">
          <el-input v-model="form.isDisable" placeholder="请输入是否禁用" />
        </el-form-item>
        <el-form-item label="个人中心背景图" prop="bjCover">
          <el-input v-model="form.bjCover" placeholder="请输入个人中心背景图" />
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

<script setup name="UserInfo">
import { listUserInfo, getUserInfo, delUserInfo, addUserInfo, updateUserInfo } from "@/api/blog/userInfo";

const { proxy } = getCurrentInstance();

const userInfoList = ref([]);
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
    email: null,
    nickname: null,
    avatar: null,
    intro: null,
    webSite: null,
    isDisable: null,
    bjCover: null,
  },
  rules: {
    nickname: [
      { required: true, message: "用户昵称不能为空", trigger: "blur" }
    ],
    avatar: [
      { required: true, message: "用户头像不能为空", trigger: "blur" }
    ],
    isDisable: [
      { required: true, message: "是否禁用不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询用户信息列表 */
function getList() {
  loading.value = true;
  listUserInfo(queryParams.value).then(response => {
    userInfoList.value = response.rows;
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
    email: null,
    nickname: null,
    avatar: null,
    intro: null,
    webSite: null,
    isDisable: null,
    bjCover: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("userInfoRef");
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
  title.value = "添加用户信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getUserInfo(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改用户信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["userInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateUserInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addUserInfo(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除用户信息编号为"' + _ids + '"的数据项？').then(function() {
    return delUserInfo(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/userInfo/export', {
    ...queryParams.value
  }, `userInfo_${new Date().getTime()}.xlsx`)
}

getList();
</script>
