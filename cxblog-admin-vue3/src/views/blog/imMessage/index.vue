<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="发送用户id" prop="toUserId">
        <el-input
          v-model="queryParams.toUserId"
          placeholder="请输入发送用户id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接收用户id" prop="fromUserId">
        <el-input
          v-model="queryParams.fromUserId"
          placeholder="请输入接收用户id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发送用户头像" prop="toUserAvatar">
        <el-input
          v-model="queryParams.toUserAvatar"
          placeholder="请输入发送用户头像"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ip地址" prop="ipSource">
        <el-input
          v-model="queryParams.ipSource"
          placeholder="请输入ip地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发送用户ip" prop="ip">
        <el-input
          v-model="queryParams.ip"
          placeholder="请输入发送用户ip"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="消息是否撤回 0：未撤回  1：撤回" prop="isWithdraw">
        <el-input
          v-model="queryParams.isWithdraw"
          placeholder="请输入消息是否撤回 0：未撤回  1：撤回"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否已读" prop="isRead">
        <el-input
          v-model="queryParams.isRead"
          placeholder="请输入是否已读"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章id" prop="articleId">
        <el-input
          v-model="queryParams.articleId"
          placeholder="请输入文章id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评论标记 1回复评论 2发表评论" prop="commentMark">
        <el-input
          v-model="queryParams.commentMark"
          placeholder="请输入评论标记 1回复评论 2发表评论"
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
          v-hasPermi="['blog:imMessage:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:imMessage:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:imMessage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:imMessage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="imMessageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="发送用户id" align="center" prop="toUserId" />
      <el-table-column label="接收用户id" align="center" prop="fromUserId" />
      <el-table-column label="发送用户头像" align="center" prop="toUserAvatar" />
      <el-table-column label="发送内容" align="center" prop="content" />
      <el-table-column label="ip地址" align="center" prop="ipSource" />
      <el-table-column label="发送用户ip" align="center" prop="ip" />
      <el-table-column label="消息是否撤回 0：未撤回  1：撤回" align="center" prop="isWithdraw" />
      <el-table-column label="是否已读" align="center" prop="isRead" />
      <el-table-column label="消息类型 1普通消息 2图片" align="center" prop="type" />
      <el-table-column label="${comment}" align="center" prop="code" />
      <el-table-column label="文章id" align="center" prop="articleId" />
      <el-table-column label="通知类型 0系统通知 1：评论 2：关注 3点赞 4收藏 5私信" align="center" prop="noticeType" />
      <el-table-column label="评论标记 1回复评论 2发表评论" align="center" prop="commentMark" />
      <el-table-column label="@用户id" align="center" prop="atUserId" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['blog:imMessage:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['blog:imMessage:remove']">删除</el-button>
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

    <!-- 添加或修改即时消息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="imMessageRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="发送用户id" prop="toUserId">
          <el-input v-model="form.toUserId" placeholder="请输入发送用户id" />
        </el-form-item>
        <el-form-item label="接收用户id" prop="fromUserId">
          <el-input v-model="form.fromUserId" placeholder="请输入接收用户id" />
        </el-form-item>
        <el-form-item label="发送用户头像" prop="toUserAvatar">
          <el-input v-model="form.toUserAvatar" placeholder="请输入发送用户头像" />
        </el-form-item>
        <el-form-item label="发送内容">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="ip地址" prop="ipSource">
          <el-input v-model="form.ipSource" placeholder="请输入ip地址" />
        </el-form-item>
        <el-form-item label="发送用户ip" prop="ip">
          <el-input v-model="form.ip" placeholder="请输入发送用户ip" />
        </el-form-item>
        <el-form-item label="消息是否撤回 0：未撤回  1：撤回" prop="isWithdraw">
          <el-input v-model="form.isWithdraw" placeholder="请输入消息是否撤回 0：未撤回  1：撤回" />
        </el-form-item>
        <el-form-item label="是否已读" prop="isRead">
          <el-input v-model="form.isRead" placeholder="请输入是否已读" />
        </el-form-item>
        <el-form-item label="${comment}" prop="code">
          <el-input v-model="form.code" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="文章id" prop="articleId">
          <el-input v-model="form.articleId" placeholder="请输入文章id" />
        </el-form-item>
        <el-form-item label="评论标记 1回复评论 2发表评论" prop="commentMark">
          <el-input v-model="form.commentMark" placeholder="请输入评论标记 1回复评论 2发表评论" />
        </el-form-item>
        <el-form-item label="@用户id" prop="atUserId">
          <el-input v-model="form.atUserId" type="textarea" placeholder="请输入内容" />
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

<script setup name="ImMessage">
import { listImMessage, getImMessage, delImMessage, addImMessage, updateImMessage } from "@/api/blog/imMessage";

const { proxy } = getCurrentInstance();

const imMessageList = ref([]);
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
    toUserId: null,
    fromUserId: null,
    toUserAvatar: null,
    content: null,
    ipSource: null,
    ip: null,
    isWithdraw: null,
    isRead: null,
    type: null,
    code: null,
    articleId: null,
    noticeType: null,
    commentMark: null,
    atUserId: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询即时消息列表 */
function getList() {
  loading.value = true;
  listImMessage(queryParams.value).then(response => {
    imMessageList.value = response.rows;
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
    toUserId: null,
    fromUserId: null,
    toUserAvatar: null,
    content: null,
    ipSource: null,
    ip: null,
    isWithdraw: null,
    isRead: null,
    type: null,
    code: null,
    articleId: null,
    noticeType: null,
    commentMark: null,
    atUserId: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("imMessageRef");
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
  title.value = "添加即时消息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getImMessage(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改即时消息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["imMessageRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateImMessage(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addImMessage(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除即时消息编号为"' + _ids + '"的数据项？').then(function() {
    return delImMessage(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('blog/imMessage/export', {
    ...queryParams.value
  }, `imMessage_${new Date().getTime()}.xlsx`)
}

getList();
</script>
