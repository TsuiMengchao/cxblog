<template>
    <div class="toolbar1" :style="{ right: right }">
        <el-tooltip class="item" effect="dark" content="聊天室" placement="left">
            <a href="javascript:void(0)" @click="handleGoIm" class="toolbar_item chat ">
                <i class="el-icon-chat-dot-square"></i>
            </a>
        </el-tooltip>

        <el-tooltip class="item" effect="dark" :content="theme && theme == 'dark' ? '切换浅色主题' : '切换深色主题'" placement="left">
            <a href="javascript:void(0)" class="toolbar_item " @click="chageTheme">
                <i class="iconfont icon-taiyang theme" id="light"
                    :style="theme == 'dark' ? '' : 'transform: translateX(30px)'"></i>
                <i class="iconfont icon-yueliang theme" id="dark"
                    :style="!theme || theme == 'light' ? '' : 'transform: translateX(-30px)'"></i>
            </a>
        </el-tooltip>

        <el-tooltip class="item" effect="dark" :content="isFullscreen ? '退出全屏' : '全屏'" placement="left">
            <a href="javascript:void(0)" title="全屏" class="toolbar_item back2top" @click="toFullOrExit">

                <i class="iconfont icon-tuichuquanping" v-if="isFullscreen"></i>
                <i class="iconfont icon-quanping" v-else></i>
            </a>
        </el-tooltip>

        <el-tooltip class="item" effect="dark" content="回到顶部" placement="left">
            <a href="javascript:void(0)" title="回到顶部" class="toolbar_item back2top" @click="backTop()"
                @mouseenter="handleMouseEnter" @mouseleave="handleMouseLeave">
                <span style="font-size: 1rem;" v-if="percentage < 100 && showPercentage">{{ percentage + '%' }}</span>
                <i v-else class="iconfont icon-shangjiantou"></i>
            </a>
        </el-tooltip>

    </div>
</template>
<script>
export default {
    data() {
        return {
            theme: sessionStorage.getItem("theme"),
            show: false,
            isFullscreen: false,
            right: "-80px",
            percentage: 0,
            showPercentage: true,
            style: sessionStorage.getItem("theme") ? "" : "transform: translateX(-30px)"
        }
    },
    mounted() {
        window.addEventListener("scroll", this.toTop, true);
    },

    methods: {
        toFullOrExit() {
            this.isFullscreen = !this.isFullscreen
            if (this.isFullscreen) {
                this.requestFullScreen()
            } else {
                this.exitFullscreen()
            }
        },

        requestFullScreen() {
            let de = document.documentElement
            if (de.requestFullscreen) {
                de.requestFullscreen()
            } else if (de.mozRequestFullScreen) {
                de.mozRequestFullScreen()
            } else if (de.webkitRequestFullScreen) {
                de.webkitRequestFullScreen()
            }
        },
        exitFullscreen() {
            let de = document
            if (de.exitFullscreen) {
                de.exitFullscreen()
            } else if (de.mozCancelFullScreen) {
                de.mozCancelFullScreen()
            } else if (de.webkitCancelFullScreen) {
                de.webkitCancelFullScreen()
            }
        },
        handleGoIm() {
            if (!this.$store.state.userInfo) {
                this.$store.commit("setLoginFlag", true)
                return;
            }
            this.$router.push({ path: "/im" })
        },
        chageTheme() {
            this.theme = sessionStorage.getItem("theme")
            let val = ''
            if (!this.theme || this.theme == 'light') { //浅色模式
                val = 'dark'
                document.getElementById("dark").style.transform = 'translateX(0)'
                document.getElementById("light").style.transform = 'translateX(30px)'

            } else {
                val = 'light'
                document.getElementById("light").style.transform = 'translateX(0)'
                document.getElementById("dark").style.transform = 'translateX(-30px)'
            }
            this.theme = val
            sessionStorage.setItem('theme', val)
            document.documentElement.dataset.theme = val
        },
        handleMouseEnter() {
            this.showPercentage = false
        },
        handleMouseLeave() {
            this.showPercentage = true
        },
        toTop() {
            let scrollTop =
                document.documentElement.scrollTop
            // let scrollHeight = document.documentElement.scrollHeight
            // // 变量 windowHeight 是可视区的高度
            // let windowHeight = document.documentElement.clientHeight || document.body.clientHeight
            // // let scrollTop1 = document.documentElement.scrollTop || document.body.scrollTop
            // // 滚动条到底部得距离 = 滚动条的总高度 - 可视区的高度 - 当前页面的滚动条纵坐标位置
            // var scrollBottom = scrollHeight - scrollTop
            // console.log("windowHeight:" + windowHeight)
            // let b = scrollTop > 0 ? scrollTop + windowHeight : scrollTop
            // let a = (b / scrollHeight) * 100
            // console.log('a', a)

            var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
            var totalHeight = document.documentElement.scrollHeight;
            var viewportHeight = window.innerHeight || document.documentElement.clientHeight;
            var percentage = (scrollPosition / (totalHeight - viewportHeight)) * 100;
            this.percentage = Math.round(percentage)

            let scroll = scrollTop - this.i;
            this.i = scrollTop;

            if (scrollTop <= 150) {
                this.right = "-80px"
            }

            if (scroll > 0) {
                this.right = "20px"
            }

        },
        backTop() {
            var timer = setInterval(function () {
                let osTop =
                    document.documentElement.scrollTop || document.body.scrollTop;
                let ispeed = Math.floor(-osTop / 5);
                document.documentElement.scrollTop = document.body.scrollTop =
                    osTop + ispeed;
                this.isTop = true;
                if (osTop === 0) {
                    clearInterval(timer);
                }
            }, 30);
        },
    },
}
</script>

<style lang="scss" scoped>
.toolbar1 {
    position: fixed;
    bottom: 130px;
    z-index: 99;
    transition: all .8s;

    .toolbar_item {
        width: 25px;
        height: 25px;
        text-align: center;
        margin-bottom: 10px;
        display: block;
        font-size: 1.2rem;
        text-decoration: none;
        color: #fff;
        background-color: var(--theme-color);
        padding: 5px;
        border-radius: 5px;
        font-weight: 700;
        position: relative;
        overflow: hidden;

        .theme {
            position: absolute;
            left: 10px;
            top: 10px;
            transition: all .5s;
        }


    }

}
</style>