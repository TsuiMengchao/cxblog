<template>
  <div class="archive container" v-loading.fullscreen.lock="fullscreenLoading">
    <!-- 归档列表 -->
    <el-card class="archive-container">
      <div class="num">目前共计{{ count }}篇文章，继续加油</div>

      <div
        style="border-bottom: 1px solid var(--border-line); margin-bottom: 20px"
      ></div>
      <ul class="timeline-wrapper">
        <li
          class="timeline-item"
          v-for="(item, index) in archiveList"
          :key="index"
        >
          <div class="timeline-box">
            <div class="out-circle">
              <div class="in-circle"></div>
            </div>
            <div class="long-line"></div>
          </div>
          <div class="timeline-content">
            <div class="timeline-date hand-style" @click="open(index)">
              <span style="padding-left: 10px">
                {{ formatTime(item.time) }}
              </span>
              <span style="float: right; padding-right: 10px">
                <el-icon>
                  <component :is="item.icon ? item.icon :'ArrowDown'" />
                </el-icon>
              </span>
            </div>
            <div
              ref="liColRef"
              style="overflow: hidden; transition: height 0.3s"
            >
              <router-link
                :to="'/article/' + chriden.id"
                v-for="chriden in item.list"
                :key="chriden.id"
                class="timeline-title hand-style"
              >
                <span style="margin-right: 10px"
                  >{{ chriden.formatTime }} :
                </span>
                {{ chriden.title }}
              </router-link>
              <el-divider></el-divider>
            </div>
          </div>
        </li>
      </ul>
    </el-card>
  </div>
</template>

<script setup name="Archive">
import { archiveArticle } from "@/api";

const archiveList = ref([]);
const count = ref(0);
const liColHeight = ref(0);
const liColRef = ref();
const fullscreenLoading = ref(true)

/**展开或收缩动画 */
function open(i) {
  const temp = archiveList.value[i];
  const liCol = liColRef.value[i];
  let height = liCol.offsetHeight; //获取要展开元素的高度
  if (height === liColHeight.value) {
    // 展开
    liCol.style.height = "auto";
    height = liCol.offsetHeight;
    liCol.style.height = liColHeight.value + "px";
    let f = document.body.offsetHeight; // 必加
    liCol.style.height = height + "px";
    temp.icon = "ArrowDown";
  } else {
    // 收缩
    liCol.style.height = liColHeight.value + "px";
    temp.icon = "ArrowUp";
  }
}

/** 获取所有文章  */
function getArchiveArticleList() {
  archiveArticle().then((res) => {
    archiveList.value = res.data;
    count.value = res.total;
  }).finally(() => (fullscreenLoading.value = false));
}

/**格式时间 */
function formatTime(time) {
  const arr = time.split("-");
  return arr[0] + "  年  " + arr[1] + "  月";
}

onMounted(() => {
  getArchiveArticleList();
});
</script>

<style lang="scss" scoped>
.archive {
  @media screen and (max-width: 1118px) {
    padding-left: 10px;
    padding-right: 10px;

    .archive-container {
      width: 100%;
    }
  }

  @media screen and (min-width: 1119px) {
    .archive-container {
      width: 60%;
    }
  }

  .archive-container {
    margin-top: 80px;
    height: 100%;
    text-align: center;
    background-color: var(--background-color);
    padding: 5px 40px;

    .num {
      line-height: 50px;
      font-weight: 700;
      color: var(--theme-color);
    }

    ul.timeline-wrapper {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    /* 时间线 */
    .timeline-item {
      position: relative;
      height: auto;

      .timeline-box {
        text-align: center;
        position: absolute;
        height: 100%;

        .out-circle {
          width: 16px;
          height: 16px;
          background: rgba(14, 116, 218, 0.1);
          box-shadow: 0px 4px 12px 0px rgba(0, 0, 0, 0.1);
          border-radius: 50%;
          display: flex;
          align-items: center;
          position: relative;
          top: 7px;

          .in-circle {
            width: 10px;
            height: 10px;
            margin: 0 auto;
            background: var(--theme-color);
            border-radius: 50%;
            box-shadow: 0px 4px 12px 0px rgba(0, 0, 0, 0.1);
          }
        }

        .long-line {
          width: 5px;
          height: 100%;
          background: var(--theme-color);
          box-shadow: 0px 4px 12px 0px rgba(0, 0, 0, 0.1);
          opacity: 0.1;
          margin-left: 5px;
        }
      }

      .timeline-content {
        box-sizing: border-box;
        margin-left: 20px;
        height: auto;
        padding: 0 0 0 20px;
        text-align: left;

        .timeline-title {
          font-size: 14px;
          word-break: break-all;
          margin-bottom: 16px;
          color: var(--article-color);
          font-weight: 500;
          margin-left: 20px;
          display: block;
          text-decoration: none;
          padding: 10px 0px;
          border-bottom: 1px dashed #dbdde0;

          &:hover {
            color: var(--theme-color);
          }
        }

        .timeline-date {
          font-size: 14px;
          color: var(--theme-color);
          font-weight: 500;
          margin-bottom: 16px;
          background-color: var(--text-color3);
          display: block;
          height: 35px;
          line-height: 35px;
          border-radius: 5px;

          &::before {
            content: "";
            width: 0;
            height: 0;
            border-width: 10px 10px 10px 0;
            border-style: solid;
            border-color: transparent var(--text-color3) transparent transparent;
            /*透明 灰 透明 透明 */
            position: relative;
            display: inline-block;
            left: -8px;
            top: 5px;
          }
        }

        .fgx {
          width: 100%;
          border-bottom: 2px dashed var(--border-line);
          margin-bottom: 20px;
        }
      }
    }

    .timeline-item:last-of-type .timeline-content {
      margin-bottom: 0;
    }
  }
}
</style>
