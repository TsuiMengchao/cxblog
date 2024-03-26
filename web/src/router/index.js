import Vue from "vue";
import Router from "vue-router";
import home from '@/view/home/home'

Vue.use(Router);
const routes = [
    {
        path: "/",
        component: home,
        meta: {
            title: "辰雪博客-一个不知道在哪抄来的博客平台"
        },
        children: [
            {
                path: "/",
                component: (resolve) => require(["@/view/home/index.vue"], resolve),
                meta: {
                    title: "辰雪博客-一个不知道在哪抄来的博客平台"
                }
            },
            {

                path: "/links",
                component: (resolve) => require(["@/view/link/index.vue"], resolve),
                meta: {
                    title: "友情链接"
                }
            },
            {
                path: "/article/:articleId",
                component: (resolve) => require(["@/view/article/index.vue"], resolve),
            },
            {
                path: "/message",
                component: (resolve) => require(["@/view/message/index.vue"], resolve),
                meta: {
                    title: "留言板"
                }
            },
            {
                path: "/about",
                component: (resolve) => require(["@/view/about/index.vue"], resolve),
                meta: {
                    title: "关于本站"
                }
            },
            {
                path: "/newposts",
                component: (resolve) => require(["@/view/article/Add"], resolve),
            },
            {
                path: "/archive",
                component: (resolve) => require(["@/view/archive/index"], resolve),
                meta: {
                    title: "文章归档"
                }
            },
            {
                path: "/categorys",
                component: (resolve) => require(["@/view/category/Category.vue"], resolve),
                meta: {
                    title: "文章分类"
                }
            },
            {
                path: "/tag",
                component: (resolve) => require(["@/view/tag/Tag"], resolve),
                meta: {
                    title: "文章标签"
                }
            },
            {
                path: "/say",
                component: (resolve) => require(["@/view/say/index"], resolve),
                meta: {
                    title: "说说"
                }
            },
            {
                path: "/newSays",
                component: (resolve) => require(["@/view/say/Add"], resolve),
                meta: {
                    title: "添加说说"
                }
            },
            {
                path: "/tipsoon",
                component: (resolve) => require(["@/view/tipsoon/index"], resolve),
                meta: {
                    title: "简讯"
                }
            },
            {
                path: "/forum",
                component: (resolve) => require(["@/view/forum/index"], resolve),
                meta: {
                    title: "论坛"
                }
            },
            {
                path: "/sponsor",
                component: (resolve) => require(["@/view/sponsor/index"], resolve),
                meta: {
                    title: "打赏名单"
                }
            },
            {
                path: "/im",
                component: (resolve) => require(["@/view/im/index"], resolve),
                meta: {
                    title: "聊天"
                }
            },
            {
                path: "/hot",
                component: (resolve) => require(["@/view/search/Hot.vue"], resolve),
                meta: {
                    title: "网站热搜"
                }
            },
            {
                name: "notice",
                path: "/notice",
                component: (resolve) => require(["@/view/notice/index.vue"], resolve),
                meta: {
                    title: "通知"
                }
            },
            {
                path: "/navigation",
                component: (resolve) => require(["@/view/navigation/index.vue"], resolve),
                meta: {
                    title: "网站导航"
                }
            },
            {
                path: "/user",
                component: (resolve) => require(["@/view/user/index.vue"], resolve),
                meta: {
                    title: "个人主页"
                }
            },
            {
                path: "/user_main",
                component: (resolve) => require(["@/view/user/UserMain.vue"], resolve),
                meta: {
                    title: "这是啥页面，个人主义Plus？"
                }
            },

        ],
    },
    {
        path: "*",
        name: "NotFound",
        component: () => import("@/view/404/404.vue"),
    }
];

const router = new Router({
    mode: "history",
    scrollBehavior: () => ({ y: 0 }),
    routes
});
// 获取原型对象push函数
const originalPush = Router.prototype.push

// 获取原型对象replace函数
const originalReplace = Router.prototype.replace

// 修改原型对象中的push函数
Router.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}

// 修改原型对象中的replace函数
Router.prototype.replace = function replace(location) {
    return originalReplace.call(this, location).catch(err => err)
}

router.beforeEach((to, from, next) => {
    if (to.meta.title) {
        document.title = to.meta.title
    }
    next()
})

router.onError((error) => {
    const pattern = /Loading chunk (.)+ failed/g;
    const isChunkLoadFailed = error.message.match(pattern);
    const targetPath = router.history.pending.fullPath;
    if (isChunkLoadFailed) {
        window.location.href = origin+targetPath
    }else{
        throw error
    }

});
export default router;
