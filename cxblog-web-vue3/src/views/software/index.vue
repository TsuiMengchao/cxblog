<template>
  <div class="software-container container">
    <div class="software-wapper">
      <el-card class="software-card">
        <div
          v-for="(item, index) in list"
          :key="index"
          :class="index % 2 === 0 ? 'software-reverse software' : 'software'"
        >
          <el-carousel class="banner" v-if="item.coverImg">
            <el-carousel-item
              v-for="img in splitCover(item.coverImg)"
              :key="img"
            >
              <el-image :src="img" />
            </el-carousel-item>
          </el-carousel>
          <div class="right">
            <div>
              <h2 class="title">{{ item.name }}</h2>
              <span class="desc" v-html="item.info"> </span>
            </div>

            <div class="btn">
              <a v-if="item.codeUrl" :href="item.codeUrl">
                <svg-icon name="gitee"></svg-icon>
                代码仓库
              </a>
              <a v-if="item.demoUrl" :href="item.demoUrl" class="demoBtn">
                <svg-icon name="demo"></svg-icon>
                演示地址
              </a>
              <a
                v-if="item.detailUrl"
                :href="item.detailUrl"
                class="introduceBtn"
              >
                <el-button type="primary" link size="large"
                  >详细介绍
                  <el-icon><DArrowRight /></el-icon>
                </el-button>
              </a>
            </div>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup name="software">
import { listSoftware } from "@/api/software";

const list = ref();

onMounted(() => {
  listSoftware().then((res) => {
    list.value = res.data;
  });
});
/**分割图片 */
function splitCover(param) {
  let imgs = param.split(",");
  var r = imgs.filter(function (s) {
    return s && s.trim();
  });
  return r;
}
</script>

<style lang="scss" scoped>
.software-container {
  .software-wapper {
    margin-top: 80px;
    width: 65%;
    .software-card {
      background-color: var(--background-color);
    }
    .software-reverse {
      flex-direction: row-reverse;
    }
    .software {
      display: flex;
      padding: 10px;
      margin-bottom: 30px;

      .banner {
        min-width: 50%;
        height: 320px;
        ::v-deep(.el-carousel__container) {
          height: 100%;
        }
        ::v-deep(.el-image) {
          height: 100% !important;
        }
      }
      .right {
        margin-left: 30px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        color: var(--text-color);
        .desc {
          margin-top: 20px;
        }
        .btn {
          a {
            text-decoration: none;
            color: var(--text-color);
            margin-right: 20px;
            svg {
              vertical-align: -2px;
            }
            &:hover {
              color: var(--theme-color);
            }
          }
          .introduceBtn {
            display: flex;
            align-items: center;
            float: right;
            color: var(--theme-color);
          }
        }
      }
    }
  }
}
</style>
