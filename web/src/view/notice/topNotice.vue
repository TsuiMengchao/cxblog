<!-- 公告栏组件 -->
<template>
    <div class="message" ref="msgBox" id="message" v-if="!noticeFlag">
        <marquee behavior="scroll" direction="left" ref="notice" scrollamount="6" onmouseover="this.stop()"
            onmouseout="this.start()">
            <span class="msg" ref="scrollMsg">
                <span class="title">
                    <svg-icon icon-class="topNotice"></svg-icon>
                    公告 :
                </span>
                <span class="content" v-html="notice.msg"></span>
                <span class="closeBtn" @click="closeMsg">
                    关闭 <i class="el-icon-close"></i>
                </span>
            </span>
        </marquee>
    </div>
</template>

<script>

export default {
    name: 'NoticeBar',

    data() {
        return {
            noticeFlag: true,
            notice: {
                id: 3,
                msg: '欢迎您的到来，如果在使用过程中发现bug，麻烦请及时向辰雪反馈。如果本项目对你有帮助，请前往<a href="https://gitee.com/mcxgitee">码云</a>给仓库点上您的小星星》》',
            }
        }
    },
    mounted() {
        const noticeId = sessionStorage.getItem("notice")
        if (noticeId != this.notice.id) {
            this.noticeFlag = false
        }
    },

    methods: {
        closeMsg() {
            sessionStorage.setItem("notice", this.notice.id)
            var message = document.getElementById("message");
            message.style.opacity = 0;
            setTimeout(function () {
                message.style.display = "none";
            }, 500);//这里要等待过渡的0.5s，然后才消失
        },
        stop() {
            let notice = this.$refs.notice
            clearInterval(notice.mysetInterval)
        },
        start() {
            let notice = this.$refs.notice
            notice.run()
        },

    }
}
</script>
<style scoped lang='scss'>
.message {
    width: 100%;
    overflow: hidden;
    position: relative;
    height: 30px;
    line-height: 30px;
    color: var(--text-color1);
    top: 60px;
    transition: all 0.5s linear;

    .msg {
        line-height: 30px;
        font-size: 14px;
        font-weight: 700;
        // position: absolute;

        .title {

            margin-right: 15px;

            svg {
                width: 20px;
                height: 20px;
                vertical-align: -5px;
            }
        }

        .content {
            /deep/ a {
                text-decoration: none;
                color: red;
            }
        }

        .closeBtn {
            margin-left: 15px;
            font-weight: 400;
            cursor: pointer;
        }
    }
}
</style>


