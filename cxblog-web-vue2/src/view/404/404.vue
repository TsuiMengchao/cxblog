<template>
    <div class="page_404">
        <div class="error">
            <div class="left">
                <svg-icon icon-class="404_2"></svg-icon>
                <h3 class="title">“未找到您要的资源,<span style="color: red;">{{ countDown }}</span>秒后自动跳转到首页”</h3>
                <a href="/" class="error_link">回到主页</a>
                <svg-icon class="right" icon-class="404_1"></svg-icon>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "NF404",
    data() {
        return {
            countDown: 5,
            timer: null
        }
    },
    methods: {
        goHome() {
            this.$router.push('/')
            clearInterval(this.timer)
        }
    },
    created() {
        this.timer = setInterval(() => {
            this.countDown > 0 ? this.countDown-- : this.goHome()
        }, 1000)
    }
}
</script>

<style lang="scss" scoped>
.page_404 {
    color: #666;
    text-align: center;
    height: 100vh;

    .error {

        .left {
            position: relative;
            top: 200px;

            .right {
                position: absolute;
                top: 80px;
                right: 250px;

            }
        }

        .title {
            font-size: 30px;
            margin-top: 20px;
            margin-bottom: 40px;
            -webkit-user-select: none;
            user-select: none;
            font-weight: 300;
            color: #888;
        }

        .error_link {
            padding: 12px 36px;
            font-size: 14px;
            text-decoration: none;
            -webkit-user-select: none;
            user-select: none;
            color: #999;
            border: 1px solid #999;
            border-radius: 100px;
            -webkit-transition: color .3s;
            transition: color .3s;
        }


    }


}
</style>