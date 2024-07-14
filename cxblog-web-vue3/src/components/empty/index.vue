<template>
    <div class='empty'>
        <svg-icon name="empty"></svg-icon>
        <div class="tips">{{ message }}</div>
    </div>
</template>
   
<script setup name='empty'>
const props = defineProps({
  message: {
    type: String,
    default: '暂无数据',
  },
});
</script>
   
<style lang='scss' scoped>
.empty {
    width: 100%;
    display: flex;
    align-items: center;
    flex-direction: column;
    text-align: center;
    box-sizing: border-box;
    padding: 40px 0;

    .tips {
        color: #999;
        font-size: 14px;
        margin-top: 10px;
    }
    svg{
        width: 40em;
        height: 15em;
    }
}
</style>