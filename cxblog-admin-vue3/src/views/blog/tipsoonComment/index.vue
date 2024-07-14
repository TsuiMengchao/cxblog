<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="评论用户id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入评论用户id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="回复用户id" prop="replyUserId">
        <el-input
          v-model="queryParams.replyUserId"
          placeholder="请输入回复用户id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="话题id" prop="tipsoonId">
        <el-input
          v-model="queryParams.tipsoonId"
          placeholder="请输入话题id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ip归属地" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入ip归属地"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ip" prop="ip">
        <el-input
          v-model="queryParams.ip"
          placeholder="请输入ip"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="父id" prop="parentId">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入父id"
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
          v-hasPermi="['blog:tipsoonComment:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:tipsoonComment:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:tipsoonComment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:tipsoonComment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tipsoonCommentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="评论用户id" align="center" prop="userId" />
      <el-table-column label="回复用户id" align="center" prop="replyUserId" />
      <el-table-column label="话题id" align="center" prop="tipsoonId" />
      <el-table-column label="ip归属地" align="center" prop="address" />
      <el-table-column label="ip" align="center" prop="ip" />
      <el-table-column label="父id" align="center" prop="parentId" />
      <el-table-column label="内容" align="center" prop="content" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:tipsoonComment:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:tipsoonComment:remove']">删除</el-button>
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

    <!-- 添加或修改简讯评论对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="tipsoonCommentRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="评论用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入评论用户id" />
        </el-form-item>
        <el-form-item label="回复用户id" prop="replyUserId">
          <el-input v-model="form.replyUserId" placeholder="请输入回复用户id" />
        </el-form-item>
        <el-form-item label="话题id" prop="tipsoonId">
          <el-input v-model="form.tipsoonId" placeholder="请输入话题id" />
        </el-form-item>
        <el-form-item label="ip归属地" prop="address">
          <el-input v-model="form.address" placeholder="请输入ip归属地" />
        </el-form-item>
        <el-form-item label="ip" prop="ip">
          <el-input v-model="form.ip" placeholder="请输入ip" />
        </el-form-item>
        <el-form-item label="父id" prop="parentId">
          <el-input v-model="form.parentId" placeholder="请输入父id" />
        </el-form-item>
        <el-form-item label="内容">
          <editor v-model="form.content" :min-height="192"/>
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

<script setup name="TipsoonComment">
import { listTipsoonComment, getTipsoonComment, delTipsoonComment, addTipsoonComment, updateTipsoonComment } from "@/api/blog/tipsoonComment";

const { proxy } = getCurrentInstance();

const tipsoonCommentList = ref([]);
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
    userId: null,
    replyUserId: null,
    tipsoonId: null,
    address: null,
    ip: null,
    parentId: null,
    content: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询简讯评论列表 */
function getList() {
  loading.value = true;
  listTipsoonComment(queryParams.value).then(response => {
    tipsoonCommentList.value = response.rows;
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
    userId: null,
    replyUserId: null,
    tipsoonId: null,
    address: null,
    ip: null,
    parentId: null,
    content: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("tipsoonCommentRef");
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
  title.value = "添加简讯评论";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getTipsoonComment(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改简讯评论";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["tipsoonCommentRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateTipsoonComment(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTipsoonComment(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除简讯评论编号为"' + _ids + '"的数据项？').then(function() {
    return delTipsoonComment(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/tipsoonComment/export', {
    ...queryParams.value
  }, `tipsoonComment_${new Date().getTime()}.xlsx`)
}

getList();
</script>
