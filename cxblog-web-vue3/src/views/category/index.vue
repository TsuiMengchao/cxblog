<template>
  <div class="container">
    <div class="tag-wapper">
      <div class="left">
        <div class="tag-box">
          <div class="tag-title">
            <svg-icon name="category"></svg-icon> 分类({{
              categoryList.length
            }})
          </div>
          <div class="tag-list">
            <a
              ref="tagRef"
              :style="{ fontSize: tag.font }"
              :class="
                handleChoose(tag, index)
                  ? 'tag-option hand-style active'
                  : 'tag-option hand-style'
              "
              @click="handleClick(tag.id, index)"
              v-for="(tag, index) in categoryList"
              :key="index"
            >
              {{ tag.name }} <span class="num">{{ tag.articleNum }}</span>
            </a>
          </div>
        </div>

        <div class="article-list" v-if="articleList.length" v-loading.fullscreen.lock="fullscreenLoading">
          <div
            class="article-item box-shadow-top"
            v-for="(article, index) in articleList"
            :key="index"
          >
            <div class="article-cover">
              <img v-lazy="article.avatar" :key="article.avatar" alt="" />
            </div>
            <div class="article-right">
              <router-link :to="'/article/' + article.id">
                <h4>{{ article.title }}</h4>
              </router-link>
              <div class="article-meta">
                <el-avatar
                  class="userAvatar"
                  :src="siteStore.getWebInfo.authorAvatar"
                ></el-avatar>
                <el-tooltip
                  class="item"
                  effect="dark"
                  content="文章标签"
                  placement="top"
                  v-for="tag in article.tagList"
                  :key="tag.id"
                >
                  <el-tag
                    :type="tagStyle[Math.round(Math.random() * 4)]"
                    class="hand-style tag"
                    :key="tag.id"
                    @click="handleNatigation(tag.id, '/tags')"
                  >
                    <i class="el-icon-folder-opened"></i> {{ tag.name }}
                  </el-tag>
                </el-tooltip>
                <el-icon><Clock /></el-icon> {{ article.formatCreateTime }}
              </div>
            </div>
          </div>
          <!-- 分页按钮 -->
          <div>
            <sy-pagination
              :pageNo="pageData.pageNo"
              :pages="pages"
              @changePage="handlePage"
            />
          </div>
        </div>
        <sy-empty v-else message="此分类下暂无发布文章" />
      </div>
      <div class="right">
        <AuthorInfo style="position: sticky; top: 60px" />
      </div>
    </div>
  </div>
</template>

<script setup  name="Category">
import AuthorInfo from "@/components/authorInfo/index.vue";
import { listArticle, listCategory } from "@/api";
import { useSiteStore } from "@/store/moudel/site.js";
import { ref, onMounted } from 'vue';

const siteStore = useSiteStore()
const route = useRoute();
const router = useRouter();
const categoryList = ref([]);
const articleList = ref([]);
const tagStyle = ref(["", "success", "info", "warning", "danger"]);
const pages = ref(0);
const lastIndex = ref(null);
const pageData = ref({
  pageNo: 1,
  pageSize: 8,
  categoryId: route.query.id,
});
const tagRef = ref()
const fullscreenLoading = ref(true)

/**跳转 */
function handleNatigation(id, path) {
  router.push({ path: path, query: { id: id } });
}

/**选中的分类 */
function handleChoose(item) {
  return item.id == pageData.value.categoryId;
}

/**点击分类 */
function handleClick(id, index) {
  if (index == lastIndex.value) {
    return;
  }
  fullscreenLoading.value = true
  tagRef.value[index].className = "tag-option hand-style active";
  if (lastIndex.value != null) {
    tagRef.value[lastIndex.value].className = "tag-option hand-style ";
  }
  lastIndex.value = index;
  pageData.value.pageNo = 1;
  pageData.value.categoryId = id;
  articleList.value = [];
  getArticleList();
}

/**分页 */
function handlePage(val) {
  fullscreenLoading.value = true
  pageData.value.pageNo = val;
  getArticleList();
}

/**获取所有分类 */
function getCategoryList() {
  listCategory().then((res) => {
    categoryList.value = res.data;
    for (var i = 0; i < categoryList.value.length; i++) {
      categoryList.value[i].font = Math.floor(Math.random() * 10) + 10 + "px";
    }
  });
}
/**获取所有文章 */
function getArticleList() {
  listArticle(pageData.value).then((res) => {
      articleList.value.push(...res.rows);
      pages.value = res.data.pages;
    }).finally(() => (fullscreenLoading.value = false))
}

onMounted(() =>{
  getCategoryList();
  if (pageData.value.categoryId != null) {
    getArticleList();
  }
})


</script>

<style lang='scss' scoped>
.tag-wapper {
  margin-top: 80px;

  display: flex;
  justify-content: space-between;

  @media screen and (max-width: 1118px) {
    width: 100%;

    .left {
      width: 100%;

      .article-cover {
        display: none;
      }
    }

    .right {
      display: none;
    }
  }

  @media screen and (min-width: 1119px) {
    width: 65%;

    .left {
      width: 70%;

      .article-cover {
        width: 150px;
        height: 80px;
      }
    }

    .right {
      width: 30%;
    }
  }

  .left {
    color: var(--text-color);
    margin-right: 15px;

    .tag-box {
      background-color: var(--background-color);
      padding: 15px;
      border-radius: 5px;

      .tag-title {
        font-size: 1.2rem;
        margin-bottom: 20px;
        margin-top: 10px;

        svg {
          width: 20px;
          height: 20px;
          vertical-align: -3px;
        }
      }

      .tag-list {
        .tag-option {
          display: inline-block;
          border: 1px solid var(--border-line);
          border-radius: 5px;
          margin-right: 10px;
          padding: 5px;
          margin-bottom: 10px;

          &:hover {
            background-color: rgb(171, 214, 214);
          }

          .num {
            display: inline-block;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            background-color: #66b1ff;
            text-align: center;
            line-height: 20px;
            color: white;
            font-size: 12px;
          }
        }

        .active {
          background-color: rgb(171, 214, 214);
        }
      }
    }

    .article-list {
      margin-top: 20px;

      .article-item {
        padding: 10px;
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        background-color: var(--background-color);

        &:last-child {
          border-bottom: none;
        }

        .article-cover {
          border-radius: 5px;

          img {
            width: 100%;
            height: 100%;
            border-radius: 5px;
          }
        }

        .article-right {
          display: flex;
          flex-direction: column;
          margin-left: 10px;

          a {
            text-decoration: none;
            color: var(--text-color);
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;

            &:hover {
              color: var(--theme-color);
            }
          }
        }

        .article-meta {
          margin-top: 15px;
          display: flex;
          align-items: center;

          .tag {
            margin-right: 5px;
          }

          .userAvatar {
            margin-right: 10px;
          }

          i {
            margin: 0 5px;
          }
        }
      }
    }
  }
}
</style>
