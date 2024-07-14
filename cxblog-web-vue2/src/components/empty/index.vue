<template>
    <div class='empty'>
        <svg-icon icon-class="empty"></svg-icon>
        <div class="tips">{{ message }}</div>
    </div>
</template>
   
<script>

export default {
    props: {
        message: {
            type: String,
            default: '暂无数据'
        }
    },
    name: '',
    data() {
        return {
        }
    },
    created() {
        // console.log('------created--------');
    },
    methods: {

    },
}
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
}
</style>