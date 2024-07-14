<template>
  <div class="hotSearchMain container">
    <div class="box">
      <div class="nav">
        <div class="siteBox">
          <svg-icon :name="svgList[selectSite]"></svg-icon>
          <el-icon
            @click="dialogVisible = true"
            class="hand-style"
            style="vertical-align: -10px !important"
            ><CaretBottom
          /></el-icon>
        </div>
        <el-input
          class="input"
          v-model="text"
          placeholder="请输入内容"
          @keyup.enter="handleCommit"
        ></el-input>
        <div class="searchCommit hand-style" @click="handleCommit">
          <i class="iconfont icon-search"></i>
        </div>
      </div>
      <div class="hot">
        <div class="weibo">
          <div class="title">
            <span>微博热搜</span>
            <svg-icon name="hot"></svg-icon>
          </div>
          <ul>
            <li
              v-for="(item, index) in weiboList"
              class="hand-style"
              :key="index"
              @click="go(item.url)"
            >
              <span class="index">
                {{ index + 1 }}
              </span>
              <span>{{ item.keyword }}</span>
            </li>
          </ul>
        </div>
        <div class="baidu">
          <div class="title">
            <span>百度热搜</span>
            <svg-icon name="hot"></svg-icon>
          </div>
          <ul>
            <li
              v-for="(item, index) in baiduList"
              class="hand-style"
              :key="index"
              @click="go(item.url)"
            >
              <span class="index">
                {{ index + 1 }}
              </span>
              <span>{{ item.keyword }}</span>
            </li>
          </ul>
        </div>

        <div class="zhihu">
          <div class="title">
            <span>知乎热搜</span>
            <svg-icon name="hot"></svg-icon>
          </div>
          <ul>
            <li
              v-for="(item, index) in zhihuList"
              class="hand-style"
              :key="index"
              @click="go(item.url)"
            >
              <span class="index">
                {{ index + 1 }}
              </span>
              <span>{{ item.keyword }}</span>
            </li>
          </ul>
        </div>
        <div class="csdn">
          <div class="title">
            <span>CSDN热搜</span>
            <svg-icon name="hot"></svg-icon>
          </div>
          <ul>
            <li
              v-for="(item, index) in csdnList"
              class="hand-style"
              :key="index"
              @click="go(item.url)"
            >
              <span class="index">
                {{ index + 1 }}
              </span>
              <span>{{ item.keyword }}</span>
            </li>
          </ul>
        </div>
        <div class="toutiao">
          <div class="title">
            <span>头条热搜</span>
            <svg-icon name="hot"></svg-icon>
          </div>
          <ul>
            <li
              v-for="(item, index) in toutiaoList"
              class="hand-style"
              :key="index"
              @click="go(item.url)"
            >
              <span class="index">
                {{ index + 1 }}
              </span>
              <span>{{ item.keyword }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <el-dialog
      :lock-scroll="false"
      title="切换搜索引擎"
      v-model="dialogVisible"
      width="30%"
      center
    >
      <el-radio-group v-model="tabPosition" style="margin-bottom: 30px">
        <el-radio-button
          v-for="(item, index) in siteList"
          :key="index"
          :label="item"
          :value="index"
          ></el-radio-button
        >
      </el-radio-group>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="handleClose">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>
<script setup name='Hot'>
import { getHot } from "@/api";

const { proxy } = getCurrentInstance();
const baiduList = ref([]);
const weiboList = ref([]);
const zhihuList = ref([]);
const csdnList = ref([]);
const toutiaoList = ref([]);
const text = ref(null);
const siteList = ref([
  "百度",
  "谷歌",
  "知乎",
  "Csdn",
  "码云",
  "Github",
  "哔哩哔哩",
]);
const dialogVisible = ref(false);
const tabPosition = ref(0);
const selectSite = ref(0);
const svgList = ref([
  "baidu",
  "chrome",
  "zhihu",
  "csdn",
  "gitee",
  "github",
  "bili",
]);
const searchUrl = ref([
  "https://www.baidu.com/s?&wd=",
  "https://www.google.com/search?q=",
  "https://www.zhihu.com/search?type=content&q=",
  "https://so.csdn.net/so/search?spm=1000.2115.3001.4498&q=",
  "https://search.gitee.com/?skin=rec&type=repository&q=",
  "https://github.com/search?q=",
  "https://search.bilibili.com/all?keyword=",
]);

function color(index) {
  if (index == 0) {
    return "color:red";
  }
  if (index == 1) {
    return "color:#ea9518";
  }
  if (index == 2) {
    return "color:#1296db";
  }
}
function go(url) {
  window.open(url, "_blank");
}
function handleCommit() {
  if (!text.value) {
    proxy.$modal.msgWarning("请输入搜索内容");
    return;
  }
  window.open(searchUrl.value[selectSite.value] + text.value, "_blank");
}
function handleClose() {
  dialogVisible.value = false;
  selectSite.value = tabPosition.value;
  proxy.$modal.msgSuccess("切换成功");
}

getHot("baidu").then((res) => {
  baiduList.value = res.data.data;
});
getHot("weibo").then((res) => {
  weiboList.value = res.data.data;
});
getHot("zhihu").then((res) => {
  zhihuList.value = res.data.data;
});
getHot("csdn").then((res) => {
  csdnList.value = res.data.data;
});
getHot("toutiao").then((res) => {
  toutiaoList.value = res.data.data;
});
</script>
<style lang="scss" scoped>
.hotSearchMain {
  @media screen and (max-width: 1118px) {
    .box {
      width: 100%;
      padding: 10px;

      .nav {
        width: 100%;
      }

      .weibo,
      .baidu,
      .zhihu,
      .csdn,
      .toutiao {
        width: 47%;
        display: inline-block;
        margin-right: 10px;
      }
    }
  }

  @media screen and (min-width: 1119px) {
    .box {
      // width: 70%;

      .nav {
        width: 70%;
      }

      .hot {
        grid-template-columns: repeat(5, 1fr);
        display: grid;

        .weibo,
        .baidu,
        .zhihu,
        .csdn,
        .toutiao {
          width: 250px;
          display: inline-block;
          margin-right: 30px;
        }
      }
    }
  }

  .box {
    height: 100%;
    margin-top: 80px;

    .nav {
      margin: 0 auto;
      display: block;
      height: 40px;

      ::v-deep(.el-input__inner) {
        border-radius: 0 !important;
        background-color: var(--background-color);
        border: 1px solid var(--border-line);
      }

      .siteBox {
        display: inline-block;
        height: calc(100% - 2px);
        border: 1px solid var(--border-line);

        line-height: 38px;
        border-right: none;
        padding-left: 20px;
        padding-right: 20px;

        svg {
          width: 25px;
          height: 25px;
          vertical-align: -8px;
        }

        i {
          margin-left: 10px;
          font-size: 14px;
        }
      }

      .input {
        display: inline-block;
        width: 60%;
        border-radius: 0 !important;
        ::v-deep(.el-input__wrapper) {
          width: 100%;
          padding: 0;
          input {
            height: 38px;
          }
        }
      }

      .searchCommit {
        display: inline-block;
        height: calc(100% - 2px);
        line-height: 36px;
        border: 1px solid var(--border-line);
        border-left: none;
        padding-left: 20px;
        padding-right: 20px;
      }
    }

    .hot {
      margin-top: 50px;

      .weibo .title {
        background-color: #d52c2b;
        background-image: radial-gradient(circle at 50% 3%, #d63736, #d52c2b);
      }

      .toutiao .title {
        background-color: #d10808;
        background-image: radial-gradient(circle at 50% 3%, #d63736, #d52c2b);
      }

      .baidu .title {
        background-color: #4e6ef2;
        background-image: radial-gradient(circle at 50% -45%, #53a7f5, #4e6ef2);
      }

      .zhihu .title {
        background-color: #53a7f5;
        background-image: radial-gradient(circle at 50% -45%, #53a7f5, #4e6ef2);
      }

      .csdn .title {
        background-color: #fc5632;
        background-image: radial-gradient(circle at 50% 3%, #f07a56, #fc5632);
      }

      .weibo,
      .baidu,
      .zhihu,
      .csdn,
      .toutiao {
        .title {
          width: 100%;
          height: 78px;
          text-align: center;
          position: relative;
          overflow: hidden;
          border-top-left-radius: 5px;
          border-top-right-radius: 5px;

          svg {
            margin-top: 20px;
            width: 100%;
          }

          span {
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            position: absolute;
            top: 40%;
            left: 0;
            right: 0;
            bottom: 0;
          }
        }

        ul {
          list-style: none;
          margin-top: 10px;

          li {
            margin-bottom: 20px;
            font-size: 13px;
            height: 100%;
            padding: 5px;

            &:first-child .index {
              background-color: #fe2d46;
            }

            &:nth-child(2) .index {
              background-color: #ff6600;
            }

            &:nth-child(3) .index {
              background-color: #faa90e;
            }

            &:hover {
              background-color: var(--hover-color);
              border-radius: 3px;
            }

            span {
              color: var(--text-color);
            }

            .index {
              display: inline-block;
              text-align: center;
              width: 20px;
              height: 20px;
              margin-right: 10px;
              line-height: 20px;
              background-color: #7f7f8c;
              color: #fff;
            }
          }
        }
      }
    }
  }
}
</style>