<template>
  <div class="emoji-container">
    <div class="emojiBox" v-if="type == 0">
      <span
        class="emoji-item hand-style"
        v-for="(item, index) in emojiList"
        :key="index"
        @click="chooseEmoji(item.url, 0)"
      >
        <el-tooltip
          class="item"
          effect="dark"
          :content="item.name"
          placement="top"
        >
          <img :src="item.url" class="emoji" :title="item.name" />
        </el-tooltip>
      </span>
    </div>

    <div class="emojiBox" v-if="type == 1">
      <span
        class="emoji-item hand-style"
        v-for="(item, index) in heoList"
        :key="index"
        @click="chooseEmoji(item.url, 1)"
      >
        <el-tooltip
          class="item"
          effect="dark"
          :content="item.name"
          placement="top"
        >
          <img :src="item.url" class="heoImg" :title="item.name" />
        </el-tooltip>
      </span>
    </div>

    <div class="btnBox">
      <el-radio-group v-model="type" size="large">
        <el-radio-button label="表情" value="0" />
        <el-radio-button label="heo" value="1" />
      </el-radio-group>
    </div>
  </div>
</template>
   
<script setup name='emoji'>
import emojiJson from "@/assets/emoji.json";
import heoJson from "@/assets/heo.json";

const emojiList = ref(emojiJson);
const heoList = ref(heoJson);
const type = ref(0);
const emoji = ref({});

const emit = defineEmits(["chooseEmoji"]);

//切换按钮
function handleTabClick(index) {
  let btnList = document.getElementsByClassName("itemBtn");
  for (var i = 0; i < btnList.length; i++) {
    btnList[i].className = "itemBtn";
    if (i == index) {
      btnList[i].className = "itemBtn active";
    }
  }
}

//选择表情
function chooseEmoji(url, type) {
  let emoji = {
    url: url,
    type: type,
  };

  if (type == 1) {
    emoji.width = "50px";
    emoji.height = "100%";
  }
  if (type == 2) {
    emoji.maxHeight = "100px";
    emoji.height = "100%";
  }
  if (type == 0) {
    emoji.width = "25px";
    emoji.height = "25px";
  }

  emit("chooseEmoji", emoji);
}
</script>
   
<style lang='scss' scoped>
::v-deep(.el-radio-button__inner) {
  padding: 8px 15px !important;
}

.emoji-container {
  max-width: 400px;
  background-color: var(--background-color);
  border: 1px solid var(--border-line);
  padding: 5px;
  border-radius: 5px;

  .emojiBox {
    min-height: 150px;
    max-height: 150px;
    max-width: 400px;
    overflow-y: scroll;

    &::-webkit-scrollbar {
      display: none;
    }

    .emoji-item {
      display: inline-block;

      .emoji {
        padding: 3px;
        border-radius: 5px;
        width: 30px;
        height: 30px;

        &:hover {
          background-color: rgb(221, 221, 221);
        }
      }

      .heoImg {
        width: 40px;
        height: 40px;
        transition: all 0.35s;
        margin-left: 5px;

        &:hover {
          transform: scale(1.2);
        }
      }
    }
  }

  .btnBox {
    margin-top: 10px;
    padding-top: 5px;
    border-top: 2px solid var(--border-line);
    color: var(--text-color);
  }
}
</style>