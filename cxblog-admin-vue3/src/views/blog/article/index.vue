<script setup lang="ts">
import { listTags } from "@/api/blog/tags";
import { listCategory } from "@/api/blog/category";

import {
  getArticlePage,
  randomAvatar,
  addArticle,
  updateArticle,
  delArticle,
  topArticle,
  pubOrShelfArticle,
  getArticleInfo,
  seoArticle,
  reptile,
} from "@/api/blog/article";

import { getDataByDictType } from "@/api/system/dict/data";
import { upload, delBatchFile } from "@/api/file";
import {ElForm, ElMessage, ElMessageBox} from "element-plus";

defineOptions({
  name: "Article",
  inheritAttrs: false,
});

const queryFormRef = ref(ElForm);
const formRef = ref(ElForm);

const loading = ref(false);
const ids = ref<number[]>([]);
const total = ref(0);

const queryParams = reactive<any>({
  pageNum: 1,
  pageSize: 10,
});

const tableData = ref<any[]>();

const dialog = reactive({
  title: "",
  visible: false,
});

const formData = reactive<any>({
  name: "",
  tags: [],
  readType: 0,
  isStick: 0,
  isOriginal: 1,
  isRecommend: 0,
  isCarousel: 0,
  isPublish: 3,
});

const rules = reactive({
  title: [{ required: true, message: "必填字段", trigger: "blur" }],
  summary: [{ required: true, message: "必填字段", trigger: "blur" }],
  tags: [{ required: true, message: "必填字段", trigger: "blur" }],
  categoryName: [{ required: true, message: "必填字段", trigger: "blur" }],
  readType: [{ required: true, message: "必填字段", trigger: "change" }],
  isStick: [{ required: true, message: "必填字段", trigger: "change" }],
  isPublish: [{ required: true, message: "必填字段", trigger: "change" }],
  isOriginal: [{ required: true, message: "必填字段", trigger: "change" }],
  originalUrl: [{ required: true, message: "必填字段", trigger: "blur" }],
  contentMd: [{ required: true, message: "必填字段", trigger: "change" }],
  isRecommend: [{ required: true, message: "必填字段", trigger: "change" }],
  isCarousel: [{ required: true, message: "必填字段", trigger: "change" }],
});

const readTypeStyle = ref(["info", "danger", "warning", "success"]);
const readTypeList = ref(["无需验证", "评论阅读", "点赞阅读", "扫码阅读"]);
const publishList = ref([]);
const isOriginalList = ref(["转载", "原创"]);
const yesOrNoDefaultValue = ref();
const yesOrNoList = ref([]);
const visible = ref(false);
const categoryName = ref();
const tagName = ref();
const categoryList = ref([]);
const tagList = ref([]);
const mdRef = ref();
const homeUrl = ref(import.meta.env.VITE_APP_HOME_URL + "article/");
const dialogVisible = ref(false);
const videoInput = ref("");

const dialogTableVisible = ref(false);
const reptileUrl = ref("");

const uploadPictureHost = ref(
  import.meta.env.VITE_APP_API_URL + "/file/upload"
);
const files = ref();

/** 查询 */
function handleQuery() {
  loading.value = true;
  getArticlePage(queryParams)
    .then((res) => {
      tableData.value = res.rows;
      total.value = res.total;
    })
    .finally(() => {
      loading.value = false;
    });
}
/** 重置查询 */
function resetQuery() {
  queryFormRef.value.resetFields();
  queryParams.pageNum = 1;
  handleQuery();
}

/** 行checkbox 选中事件 */
function handleSelectionChange(selection: any) {
  ids.value = selection.map((item: any) => item.id);
}

/** 打开标签表单弹窗 */
function openDialog(row?: any) {
  dialog.visible = true;
  if (row) {
    dialog.title = "修改文章";
    getArticleInfo(row.id).then((res) => {
      Object.assign(formData, res.data);
    });
  } else {
    dialog.title = "新增文章";
    Object.assign(formData, null);
  }
}

/** 标签保存提交 */
function handleSubmit() {
  formRef.value.validate((valid: any) => {
    if (valid) {
      loading.value = true;
      const id = formData.id;
      formData.content = mdRef.value.d_render;
      if (id) {
        updateArticle(formData)
          .then(() => {
            ElMessage.success("修改成功");
            closeDialog();
            resetQuery();
          })
          .finally(() => (loading.value = false));
      } else {
        addArticle(formData)
          .then(() => {
            ElMessage.success("新增成功");
            closeDialog();
            resetQuery();
          })
          .finally(() => (loading.value = false));
      }
    }
  });
}

/** 关闭表单弹窗 */
function closeDialog() {
  dialog.visible = false;
  resetForm();
}

/** 重置表单 */
function resetForm() {
  formRef.value.resetFields();
  formRef.value.clearValidate();
  formData.id = undefined;
}

/** 删除 */
function handleDelete(id?: number) {
  const formIds = ref<any>([]);
  if (id) {
    formIds.value.push(id);
  }
  if (ids.value.length) {
    formIds.value = ids.value;
  }
  if (!formIds) {
    ElMessage.warning("请勾选删除项");
    return;
  }
  ElMessageBox.confirm("确认删除已选中的数据项?", "警告", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  }).then(() => {
    loading.value = true;
    delArticle(formIds.value)
      .then(() => {
        ElMessage.success("删除成功");
        resetQuery();
      })
      .finally(() => (loading.value = false));
  });
}

//置顶标签
function handleTop(row: any) {
  topArticle(row)
    .then(() => {
      ElMessage.success("置顶成功");
      resetQuery();
    })
    .finally(() => (loading.value = false));
}

function strSplit(item: any) {
  return item.split(",");
}

//上传之前的操作
function uploadBefore() {
  loading.value = true;
}

//上传文件
function uploadSectionFile(param: any) {
  files.value = param.file;
  var form = new FormData();
  form.append("file", files.value);
  upload(form)
    .then((res) => {
      formData.avatar = res.data.url;
    })
    .finally(() => {
      loading.value = false;
    });
}

//上传视频
function uploadVideo(param: any) {
  files.value = param.file;
  // FormData 对象
  var formData = new FormData();
  // 文件对象
  formData.append("file", files.value);
  upload(formData)
    .then((res) => {
      const $vm = mdRef.value;
      // 将文件名与文件路径插入当前光标位置，这是mavon-editor 内置的方法
      $vm.insertText($vm.getTextareaDom(), {
        prefix: `<video height=100% width=100% controls autoplay src="${res.data.url}"></video>`,
        subfix: "",
        str: "",
      });
    })
    .finally(() => {
      loading.value = false;
    });
}
/**
 * 添加网络视频地址
 */
function addVideo() {
  // 这里获取到的是mavon编辑器实例，上面挂载着很多方法
  const $vm = mdRef.value;
  // 将文件名与文件路径插入当前光标位置，这是mavon-editor 内置的方法
  $vm.insertText($vm.getTextareaDom(), {
    prefix: `<video height=100% width=100% src="${videoInput.value}"></video>`,
    subfix: "",
    str: "",
  });

  dialogVisible.value = false;
  videoInput.value = "";
}

//删除图片
function imgDel(filename: any) {
  // delBatchFile(filename[0].split(img)[1]);
}

function randomImg() {
  // loading.value = true
  // randomAvatar().then((res:any) => {
  //   formData.avatar = res.data;
  //   visible.value = false
  // }).finally(() => {
  //   loading.value = false
  // });
  formData.avatar =
    "https://picsum.photos/500/300?random=" + Math.round(Date.now() / 1000);
}

//添加图片
function imgAdd(pos: any, $file: any) {
  var formdata = new FormData();
  formdata.append("file", $file);
  upload(formdata).then((res) => {
    mdRef.value.$img2Url(pos, res.data.url);
  });
}

//移除分类
function removeCategory() {
  formData.categoryName = null;
}

function addCategory(item: any) {
  formData.categoryName = item.name;
}
//保存分类
function saveCategory() {
  if (categoryName.value.trim() !== "") {
    formData.categoryName = categoryName;
  }
}

/**
 * 添加标签
 */
function addTag(item: any) {
  if (formData.tags.length > 2) {
    ElMessage.error("最多添加三个标签,如需继续添加,请先删除一个!");
    return;
  }
  if (formData.tags.indexOf(item.name) === -1) {
    formData.tags.push(item.name);
  }
}

/**
 * 保存标签
 */
function saveTag() {
  if (tagName.value.trim() !== "") {
    addTag({
      name: tagName.value,
    });
    tagName.value = "";
  }
}

/**
 * 删除标签
 */
function removeTag(item: any) {
  const index = formData.tags.indexOf(item);
  formData.tags.splice(index, 1);
}

/**
 * 发布或下架文章
 */
function handleUpdateStatus(row: any, status: Number) {
  let article = { id: row.id, isPublish: status };
  pubOrShelfArticle(article).then((res) => {
    ElMessage.success("修改成功");
    resetQuery();
  });
}

/**
 * SEO
 */
function handleSeo() {
  seoArticle(ids.value).then((res) => {
    ElMessage.success("推送成功");
  });
}

/**
 * 获取字典数据
 */
function getDictList() {
  let dictTypes = ["blog_publish_status", "blog_yes_no"];
  getDataByDictType(dictTypes).then((response) => {
    let dictMap = response.data;
    yesOrNoList.value = dictMap.blog_yes_no.list;
    yesOrNoDefaultValue.value = dictMap.blog_yes_no.defaultValue;
    publishList.value = dictMap.blog_publish_status.list;
  });
}

/**
 * 打开csdn抓取文章弹窗
 */
function openReptile() {
  dialogTableVisible.value = true;
  reptileUrl.value = "";
}

/**
 * 抓取文章
 */
function handleReptile() {
  reptile(reptileUrl.value).then(() => {
    ElMessage.success("抓取成功");
    dialogTableVisible.value = false;
  });
}

function getCategoryAndTag() {
  let params = { pageNum: 1, pageSize: 100 };
  listCategory(params).then((res) => {
    categoryList.value = res.rows;
  });
  listTags(params).then((res) => {
    tagList.value = res.rows;
  });
}

onMounted(() => {
  handleQuery();
  getDictList();
  getCategoryAndTag();
});
</script>

<template>
  <div class="app-container">
    <div class="search-container">
      <el-form ref="queryFormRef" :model="queryParams" :inline="true">
        <el-form-item prop="title" label="文章名称">
          <el-input
            v-model="queryParams.title"
            placeholder="文章名称"
            clearable
            @keyup.enter="handleQuery"
          />
        </el-form-item>
        <el-form-item label="标签名" prop="tagId">
          <el-select
            style="width: 130px"
            v-model="queryParams.tagId"
            filterable
            clearable
            reserve-keyword
            @change="handleQuery"
            placeholder="请选择标签"
          >
            <el-option
              v-for="item in tagList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="分类名" prop="categoryId">
          <el-select
            style="width: 130px"
            v-model="queryParams.categoryId"
            clearable
            reserve-keyword
            @change="handleQuery"
            placeholder="请选择分类"
          >
            <el-option
              v-for="item in categoryList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="发布状态" prop="isPublish">
          <el-select
            style="width: 130px"
            v-model="queryParams.isPublish"
            clearable
            reserve-keyword
            placeholder="是否发布"
            @change="handleQuery"
          >
            <el-option
              v-for="(item, index) in publishList"
              :key="index"
              :label="item.dictLabel"
              :value="item.dictValue"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleQuery"
            ><i-ep-search />搜索</el-button
          >
          <el-button @click="resetQuery"><i-ep-refresh />重置</el-button>
        </el-form-item>
      </el-form>
    </div>

    <el-card shadow="never" class="table-container">
      <template #header>
        <el-button
          type="success"
          @click="openDialog()"
          v-hasPerm="['blog:article:add']"
          ><i-ep-plus />新增</el-button
        >
        <el-button
          type="primary"
          @click="openReptile"
          v-hasPerm="['blog:article:reptile']"
          ><el-icon><MostlyCloudy /></el-icon>csdn文章抓取</el-button
        >
        <el-button
          type="info"
          @click="handleSeo"
          v-hasPerm="['blog:article:seo']"
          ><el-icon><MostlyCloudy /></el-icon>SEO</el-button
        >
        <el-button
          type="danger"
          :disabled="ids.length === 0"
          v-hasPerm="['blog:article:delete']"
          @click="handleDelete()"
          ><i-ep-delete />批量删除</el-button
        >
      </template>

      <el-table
        ref="dataTableRef"
        :data="tableData"
        highlight-current-row
        stripe
        fit
        @selection-change="handleSelectionChange"
        v-loading="loading"
        max-height="600px"
      >
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column width="170" align="center" label="文章封面">
          <template #default="scope">
            <el-image class="article-cover" :src="scope.row.avatar" />
          </template>
        </el-table-column>
        <el-table-column
          prop="title"
          align="center"
          label="文章名称"
          width="220"
        >
          <template #default="scope">
            <el-link
              :underline="false"
              :href="homeUrl + scope.row.id"
              target="_blank"
              >{{ scope.row.title }}</el-link
            >
          </template>
        </el-table-column>
        <el-table-column
          prop="nickname"
          width="120"
          align="center"
          label="文章作者"
        />
        <el-table-column align="center" width="116" label="类型">
          <template #default="scope">
            <span v-for="(item, index) in isOriginalList" :key="index">
              <el-tag
                :type="scope.row.isOriginal === 0 ? 'warning' : 'success'"
                :key="index"
                v-if="scope.row.isOriginal === index"
                >{{ item }}
              </el-tag>
            </span>
          </template>
        </el-table-column>
        <el-table-column align="center" width="125" label="分类">
          <template #default="scope">
            <el-tag style="margin-left: 3px" align="center" type="warning"
              >{{ scope.row.categoryName }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" width="220" label="标签">
          <template #default="scope">
            <el-tag
              style="margin-left: 3px"
              align="center"
              type="primary"
              v-for="item in strSplit(scope.row.tagNames)"
              :key="item"
              >{{ item }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="isStick"
          align="center"
          width="120"
          label="置顶"
          v-hasPerm="['blog:article:top']"
        >
          <template #default="scope">
            <el-switch
              v-model="scope.row.isStick"
              :active-value="1"
              :inactive-value="0"
              @change="handleTop(scope.row)"
              active-color="#13ce66"
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column align="center" width="120" label="阅读方式">
          <template #default="scope">
            <el-tag :type="readTypeStyle[scope.row.readType]">{{
              readTypeList[scope.row.readType]
            }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" width="120" label="状态">
          <template #default="scope">
            <span v-for="(item, index) in publishList" :key="index">
              <el-tag
                v-if="item.dictValue == scope.row.isPublish"
                :type="item.style"
                >{{ item.dictLabel }}</el-tag
              >
            </span>
          </template>
        </el-table-column>
        <el-table-column
          width="200"
          align="center"
          prop="createTime"
          sortable
          label="添加时间"
        />
        <el-table-column width="220" fixed="right" align="center" label="操作">
          <template #default="scope">
            <el-button
              v-hasPerm="['blog:article:pubOrShelf']"
              type="info"
              link
              size="small"
              v-if="scope.row.isPublish === 1"
              @click="handleUpdateStatus(scope.row, 0)"
              icon="Bottom"
              >下架</el-button
            >
            <el-button
              v-hasPerm="['blog:article:pubOrShelf']"
              v-if="scope.row.isPublish === 0"
              type="success"
              link
              size="small"
              @click="handleUpdateStatus(scope.row, 1)"
              icon="Position"
            >
              发布
            </el-button>
            <el-button
              type="primary"
              size="small"
              link
              @click="openDialog(scope.row)"
              icon="Edit"
              v-hasPerm="['blog:article:update']"
              >编辑</el-button
            >
            <el-button
              size="small"
              link
              type="danger"
              @click="handleDelete(scope.row.id)"
              icon="Delete"
              v-hasPerm="['blog:article:delete']"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-if="total > 0"
        v-model:total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="handleQuery"
      />
    </el-card>

    <!--添加or修改区域-->
    <el-dialog
      center
      :title="dialog.title"
      @close="closeDialog"
      v-model="dialog.visible"
      fullscreen
    >
      <el-form
        :rules="rules"
        ref="formRef"
        :model="formData"
        style="margin-top: 10px"
      >
        <el-row>
          <el-col :span="10">
            <el-form-item label="文章名称" prop="title">
              <el-input v-model="formData.title" auto-complete="off"></el-input>
            </el-form-item>
            <el-form-item label="文章简介" prop="summary">
              <el-input
                auto-complete="off"
                type="textarea"
                v-model="formData.summary"
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="1"> </el-col>
          <el-col :span="12">
            <el-form-item>
              <template #label>
                <div style="display: flex; align-items: center">
                  <span>标题图:</span>
                  <el-popover
                    placement="top"
                    width="160"
                    trigger="hover"
                    v-model="visible"
                  >
                    <p>随机获取一张图片</p>
                    <div style="text-align: right; margin: 0">
                      <el-button type="info" link @click="visible = false"
                        >取消</el-button
                      >
                      <el-button type="primary" @click="randomImg()"
                        >确定</el-button
                      >
                    </div>
                    <template #reference>
                      <el-icon><QuestionFilled /></el-icon>
                    </template>
                  </el-popover>
                </div>
              </template>

              <el-upload
                v-loading="loading"
                style="width: 80px; height: 80px"
                class="avatar-uploader"
                :show-file-list="false"
                name="filedatas"
                :action="uploadPictureHost"
                :before-upload="uploadBefore"
                :http-request="uploadSectionFile"
                multiple
              >
                <img
                  v-if="formData.avatar"
                  :src="formData.avatar"
                  class="imgAvatar"
                />
                <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="margin-top: 20px">
          <el-col :span="6">
            <el-form-item label="标签" prop="tags">
              <el-tag
                v-for="(item, index) of formData.tags"
                :key="index"
                style="margin: 0 1rem 0 0"
                :closable="true"
                @close="removeTag(item)"
              >
                {{ item }}
              </el-tag>
              <!-- 标签选项 -->
              <el-popover
                placement="bottom-start"
                width="460"
                trigger="click"
                v-if="formData.tags && formData.tags.length < 3"
              >
                <div class="popover-title">标签</div>
                <!-- 搜索框 -->
                <el-input
                  style="width: 100%"
                  v-model="tagName"
                  placeholder="请输入标签名,enter添加自定义标签"
                  @keyup.enter="saveTag"
                />
                <!-- 标签 -->
                <div class="popover-container">
                  <div>添加标签</div>
                  <el-tag
                    v-for="(item, index) of tagList"
                    :key="index"
                    style="margin-left: 3px; margin-top: 2px"
                    @click="addTag(item)"
                  >
                    {{ item.name }}
                  </el-tag>
                </div>
                <template #reference>
                  <el-button type="primary" plain> 添加标签 </el-button>
                </template>
              </el-popover>
            </el-form-item>
          </el-col>
          <el-col :span="4">
            <el-form-item label="分类" prop="categoryName">
              <el-tag
                type="success"
                v-show="formData.categoryName"
                style="margin: 0 1rem 0 0"
                :closable="true"
                @close="removeCategory"
              >
                {{ formData.categoryName }}
              </el-tag>
              <!-- 分类选项 -->
              <el-popover
                placement="bottom-start"
                width="460"
                trigger="click"
                v-if="!formData.categoryName"
              >
                <div class="popover-title">分类</div>
                <!-- 输入框 -->
                <el-input
                  style="width: 100%"
                  v-model="categoryName"
                  placeholder="请输入分类名,enter添加自定义分类"
                  @keyup.enter="saveCategory"
                />
                <!-- 分类 -->
                <div class="popover-container">
                  <div>添加分类</div>
                  <el-tag
                    v-for="(item, index) of categoryList"
                    :key="index"
                    style="margin-left: 3px; margin-top: 2px"
                    class="category-item"
                    @click="addCategory(item)"
                  >
                    {{ item.name }}
                  </el-tag>
                </div>
                <template #reference>
                  <el-button type="success" plain> 添加分类 </el-button>
                </template>
              </el-popover>
            </el-form-item>
          </el-col>
          <el-col :span="5">
            <el-form-item label="是否置顶" prop="isStick">
              <el-radio-group v-model="formData.isStick">
                <el-radio
                  v-for="(item, index) in yesOrNoList"
                  :label="parseInt(item.dictValue)"
                  border
                  :key="index"
                >{{item.dictLabel}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="是否发布" prop="isPublish">
              <el-radio-group v-model="formData.isPublish">
                <el-radio
                  v-for="(item, index) in publishList"
                  :key="index"
                  :label="parseInt(item.dictValue)"
                  border
                >{{item.dictLabel}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row style="margin-top: 20px">
          <el-col :span="4">
            <el-form-item label="阅读方式" prop="readType">
              <el-select
                style="width: 150px"
                v-model="formData.readType"
                placeholder="请选择阅读方式"
              >
                <el-option
                  v-for="(item, index) in readTypeList"
                  :key="index"
                  :label="item"
                  :value="index"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="5">
            <el-form-item label="创作类型" prop="isOriginal">
              <el-radio-group v-model="formData.isOriginal">
                <el-radio
                  v-for="(item, index) in isOriginalList"
                  :label="index"
                  :key="index"
                  border
                >{{item}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col v-if="formData.isOriginal === 0" :span="5">
            <el-form-item label="原文链接" prop="originalUrl">
              <el-input v-model="formData.originalUrl"></el-input>
            </el-form-item>
          </el-col>

          <el-col :span="5">
            <el-form-item label="是否推荐" prop="isRecommend">
              <el-radio-group v-model="formData.isRecommend">
                <el-radio
                  v-for="(item, index) in yesOrNoList"
                  :label="parseInt(item.dictValue)"
                  border
                  :key="index"
                >{{item.dictLabel}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="5">
            <el-form-item label="是否首页轮播" prop="isCarousel">
              <el-radio-group v-model="formData.isCarousel">
                <el-radio
                  v-for="(item, index) in yesOrNoList"
                  :label="parseInt(item.dictValue)"
                  border
                  :key="index"
                >{{item.dictLabel}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="5">
            <el-form-item label="SEO关键词">
              <el-input v-model="formData.keywords"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row style="margin-top: 20px">
          <el-col :spam="24">
            <el-form-item label="内容" prop="contentMd">
              <mavon-editor
                placeholder="输入文章内容..."
                style="height: 500px; width: 100%"
                ref="mdRef"
                v-model="formData.contentMd"
                @imgDel="imgDel"
                @imgAdd="imgAdd"
              >
                <template #left-toolbar-after>
                  <el-dropdown>
                    <span class="el-dropdown-link">
                      <i title="上传视频"></i>
                      <el-icon class="op-icon fa el-icon-video-camera"
                        ><VideoPlay
                      /></el-icon>
                    </span>
                    <template #dropdown>
                      <el-dropdown-menu>
                        <el-dropdown-item>
                          <el-upload
                            style="display: inline-block"
                            :show-file-list="false"
                            name="filedatas"
                            action=""
                            :http-request="uploadVideo"
                            multiple
                          >
                            <span>上传视频</span>
                          </el-upload>
                        </el-dropdown-item>
                        <el-dropdown-item>
                          <div @click="dialogVisible = true">添加视频地址</div>
                        </el-dropdown-item>
                      </el-dropdown-menu>
                    </template>
                  </el-dropdown>
                </template>
              </mavon-editor>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="handleSubmit">确 定</el-button>
          <el-button @click="closeDialog">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog center title="添加视频" v-model="dialogVisible" width="30%">
      <el-input v-model="videoInput" placeholder="视频地址"></el-input>

      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="addVideo">确 定</el-button>
          <el-button @click="dialogVisible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog title="文章抓取" v-model="dialogTableVisible">
      <el-form>
        <el-form-item label="目标地址url">
          <el-input v-model="reptileUrl" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="tip">
          <span style="color: limegreen">
            请注意如下几点:<br />
            1.如果抓取成功则会自动保存到文章表中<br />
            2.CSDN的文章没有封面图片，所以会是随机图片<br />
            3.暂时只支持CSDN的文章抓取
          </span>
        </el-form-item>
      </el-form>

      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="handleReptile">确 定</el-button>
          <el-button @click="dialogTableVisible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  width: 200px;
  height: 110px;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.avatar-img-icon {
  font-size: 28px;
  color: #8c939d;
  line-height: 110px;
  text-align: center;
}

.imgAvatar {
  width: 200px;
  height: 110px;
  display: block;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  margin: 0, 0, 0, 10px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 195px;
  height: 105px;
  line-height: 105px;
  text-align: center;
}

.article-cover {
  position: relative;
  width: 120px;
  height: 60px;
  border-radius: 4px;
}

.article-cover::after {
  content: "";
  background: rgba(0, 0, 0, 0.3);
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
</style>
