<template>
    <div>
        <!-- 内容 -->
        <transition name="moveCartoon" appear>
            <router-view :key="$route.fullPath" />
        </transition>
    </div>
</template>
<script>
import { getNewSystemNotice } from '@/api/im'
import { getToken } from '@/utils/cookieUtil'
export default {

    data() {
        return {
        }
    },

    created() {
        if (this.$store.state.userInfo) {
            if (getToken()) {
                getNewSystemNotice().then(res => {
                    this.$store.commit("setSystemNotice", res.data)
                });
            }
        }
        // //跳回到原地址
        // if (flag) {
        //     // 跳转回原页面
        //     const loginUrl = getUrl();
        //     if (loginUrl != null && loginUrl != "") {
        //         if (loginUrl.indexOf("articleId") != -1) {
        //             let arr = loginUrl.split("=")
        //             this.$router.push({ path: '/articleInfo', query: { articleId: arr[1] } })
        //         } else {
        //             this.$router.push({ path: loginUrl });
        //         }
        //     } else {
        //         this.$router.push({ path: "/" });
        //     }
        // }
    },
}
</script>
<style scoped>
/* 类名要对应回 name 的属性值 */
.moveCartoon-enter-active {
    animation: move .2s;
}

.moveCartoon-leave-active {
    animation: move .2s reverse;
}

@keyframes move {
    from {
        transform: translateX(-100%);
    }

    to {
        transform: translate(0);
    }
}
</style>