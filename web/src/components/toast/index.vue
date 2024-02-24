<template>
    <div id="toast">
        <span class="toast" @mouseleave="start" @mouseenter="stop" :style="{ backgroundColor: color, top: styleTop }">
            <i :class="icon" style="vertical-align:-1px"></i>
            {{ message }}
            <i class="el-icon-close close" v-if="showCloseBtn" @click="close"></i>
        </span>
    </div>
</template>
 
<script>
export default {
    name: 'Toast',
    data() {
        return {
            message: '',
            icon: "",
            type: "normal",
            color: "#49b1f5",
            styleTop: "-100px",
            timer: null,
            showCloseBtn: false
        };
    },

    methods: {
        close() {
            this.styleTop = "-100px"
            clearInterval(this.timer);
        },
        stop() {
            clearInterval(this.timer);
        },
        start() {
            this.timer = setTimeout(() => {
                this.styleTop = "-100px"
            }, 3000);
        },
        after(message) {
            clearInterval(this.timer);
            this.message = message;
            this.styleTop = "30px"
            this.timer = setTimeout(() => {
                this.styleTop = "-100px"
            }, 3000);
        },
        show(option) {
            switch (option.type) {
                case "error":
                    this.color = "#F56C6C";
                    this.icon = "iconfont icon-cuo";
                    break;
                case "success":
                    this.color = "#52C41A";
                    this.icon = "iconfont icon-duigouxiao";
                    break;
                case "warnning":
                    this.color = "#F57C00";
                    this.icon = "iconfont icon-jinggao";
                    break;
                default:
                    this.icon = null
                    this.color = "#49b1f5"
                    break;
            }
            this.showCloseBtn = option.showClose;
            this.after(option.message)
        },
        success(message) {
            this.color = "#52C41A";
            this.icon = "iconfont icon-duigouxiao";
            this.after(message)
        },
        error(message) {
            this.color = "#F56C6C";
            this.icon = "iconfont icon-cuo";
            this.after(message)
        },
        warnning(message) {
            this.color = "#F57C00";
            this.icon = "iconfont icon-jinggao1";
            this.show = true;
            this.after(message)
        },
        info(message) {
            this.color = "#909399";
            this.icon = "iconfont icon-jinggao1";
            this.show = true;
            this.after(message)
        },
    },
};
</script>
 
<style lang="scss" scoped>
.toast {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    margin: 0 auto;
    background-color: #333;
    color: #fff;
    padding: 10px;
    border-radius: 3px;
    z-index: 99999;
    width: fit-content;
    height: fit-content;
    transition: all 0.4s;

    .close {
        margin-left: 30px;
        cursor: pointer;
    }

}
</style>