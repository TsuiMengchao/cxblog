<template>
  <div class="say-main container" v-loading.fullscreen.lock="fullscreenLoading">
    <div class="say-containner">
      <div class="cover">
        <img
          src="https://cxblog.qiniu.zhaohaoyue.love/web/72d9854940be46579f098b49f9d9035c.jpg"
          alt=""
        />
        <div class="info">说说</div>
      </div>
      <div class="contentBox">
        <div class="sayItem" v-for="(item, index) in sayList" :key="index">
          <div class="avatar">
            <el-avatar :src="item.avatar" alt=""></el-avatar>
          </div>
          <div class="rigthBox">
            <div class="nickname">
              {{ item.nickname }}
              <el-tooltip
                class="item"
                effect="dark"
                content="博主"
                placement="right"
              >
                <svg-icon name="bozhu"></svg-icon>
              </el-tooltip>
            </div>
            <p class="content" v-highlight v-html="item.content"></p>
            <div
              v-if="item.imgUrl"
              :class="ckeckImgClass(item.imgUrl)"
            >
              <div
                class="imgBox"
                @click="handlePreviewImg(item.imgUrl)"
                v-for="(imgItem, imgIndex) in splitImg(item.imgUrl)"
                :key="imgIndex"
              >
                <img :key="imgItem" v-lazy="imgItem" alt="" />
              </div>
            </div>

            <div class="bottomBox">
              <div v-if="item.address" class="address">
                <a>
                  <el-icon><Location /></el-icon> {{ item.address }}
                </a>
              </div>
              <span class="time">
                <el-icon><AlarmClock /></el-icon> {{ item.createTimeStr }}
              </span>
            </div>
          </div>
        </div>
        <!-- 分页按钮 -->
        <sy-pagination
          :pageNo="pageData.pageNo"
          :pages="pages"
          @changePage="handlePage"
        />
      </div>
    </div>
    <image-preview :img="images"></image-preview>
  </div>
</template>
<script setup name='Say'>
import { listSay} from "@/api/say";
import imagePreview from "@/components/image-preview/index.vue";
import { onMounted } from 'vue';

const sayList = ref([]);
const images = ref({});
const pageData = ref({
  pageNo: 1,
  pageSize: 10,
});
const pages = ref(0);
const fullscreenLoading = ref(false)

/**预览图片 */
function handlePreviewImg(imgs) {
  images.value = {
    urls: imgs,
    time: new Date().getTime(),
  };
}
/**获取说说 */
function getSayList() {
  fullscreenLoading.value = true
  listSay(pageData.value)
    .then((res) => {
      sayList.value.push(...res.rows);
      pages.value = res.data.pages;
    }).finally(() => (fullscreenLoading.value = false))
}
/**分页 */
function handlePage(val) {
  pageData.value.pageNo = val;
  getSayList();
}
/**图片样式 */
function ckeckImgClass(img) {
  let length = splitImg(img).length;
  if (length == 1) {
    return "contentImg grid-1";
  } else if (length == 2) {
    return "contentImg grid-2";
  } else {
    return "contentImg grid-3";
  }
}
/**分割图片 */
function splitImg(img) {
  if(img) {
    let imgs = img.split(",");
    var r = imgs.filter(function (s) {
      return s && s.trim();
    });
    return r;
  }

}

onMounted(() =>{
  getSayList();
})
</script>
<style lang="scss" scoped>
.say-main {
  @media screen and (max-width: 1118px) {
    padding: 0 5px;

    .say-containner {
      width: 100%;

      ::v-deep(video) {
        height: 200px;
        width: 250px;
      }

      ::v-deep(pre) {
        max-width: 75%;
      }

      .cover {
        height: 250px;
      }

      .imgBox {
        max-height: 200px;
      }

      .grid-1 {
        .imgBox {
          width: 200px;
          height: 200px;
        }
      }

      .grid-2 {
        .imgBox {
          width: 150px;
          height: 150px;
        }
      }

      .grid-3 {
        .imgBox {
          width: 100px;
          height: 100px;
        }
      }

    }
  }

  @media screen and (min-width: 1119px) {
    .say-containner {
      width: 60%;

      ::v-deep(video) {
        height: 500px;
      }

      .imgBox {
        max-height: 250px;
      }

      .cover {
        height: 380px;
      }

      .grid-1 {
        .imgBox {
          width: 250px;
        }
      }

      .grid-2 {
        .imgBox {
          width: 250px;
        }
      }

      .grid-3 {
        .imgBox {
          width: 250px;
        }
      }
    }
  }

  .say-containner {
    padding: 10px;
    margin-top: 80px;

    .cover {
      width: 100%;

      position: relative;

      img {
        border-radius: 5px;
        width: 100%;
        height: 100%;
      }

      .info {
        position: absolute;
        top: 50%;
        left: 50%;
        font-size: 25px;
        font-weight: 700;
      }
    }

    .contentBox {
      margin-top: 20px;
      width: 100%;
      color: var(--text-color);

      .sayItem {
        padding: 10px;
        display: flex;
        margin-bottom: 10px;
        border-radius: 5px;
        position: relative;
        background-color: var(--background-color);
        overflow: hidden;

        .avatar {
          ::v-deep(img) {
            vertical-align: top;
          }
        }

        .rigthBox {
          padding-left: 10px;
          display: flex;
          flex-direction: column;
          width: 100%;

          .nickname {
            color: var(--theme-color);

            svg {
              width: 18px;
              height: 18px;
              vertical-align: -3px;
            }
          }

          .content {
            margin-top: 10px;
          }

          .grid-1 {
            grid-template-columns: repeat(1, 0fr);
          }

          .grid-2 {
            grid-template-columns: repeat(2, 0fr);
          }

          .grid-3 {
            grid-template-columns: repeat(3, 0fr);
          }

          .contentImg {
            display: grid;
            margin-top: 10px;

            .imgBox {
              overflow: hidden;
              margin-right: 5px;
              margin-bottom: 10px;
              border-radius: 5px;
            }

            img {
              max-width: 100%;
              // 这里的高度随便设置，反正父层盒子设置了超出隐藏
              min-height: 300px;
              cursor: zoom-in;
              object-fit: cover;
            }
          }

          .bottomBox {
            margin-top: 20px;
            position: relative;

            .address {
              color: #5597bd;
              margin-bottom: 10px;
            }

            .time,
            .address {
              display: flex;
              align-items: center;
              .el-icon{
                margin-right: 3px;
              }
            }

          }
        }
      }
    }
  }
}
</style>
