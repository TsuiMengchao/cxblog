import Vue from "vue";
import VueRouter from "vue-router";
import home from '@/view/home/home'

Vue.use(VueRouter);
const routes = [
    {
        path: "/",
        component: home,
        meta: {
            title: "辰雪博客-一个专注于技术分享的博客平台"
        },
        children: [
            {
                path: "/",
                component: resolve => require(["@/view/home/index.vue"], resolve),
                meta: {
                    title: "辰雪博客-一个专注于技术分享的博客平台"
                }
            },
            {

                path: "/links",
                component: resolve => require(["@/view/link/index.vue"], resolve),
                meta: {
                    title: "友情链接"
                }
            },
            {
                path: "/article/:articleId",
                component: resolve => require(["@/view/article/index.vue"], resolve),
            },
            {
                path: "/message",
                component: resolve => require(["@/view/message/index.vue"], resolve),
                meta: {
                    title: "留言板"
                }
            },
            {
                path: "/about",
                component: resolve => require(["@/view/about/index.vue"], resolve),
                meta: {
                    title: "关于本站"
                }
            },
            {
                path: "/newposts",
                component: resolve => require(["@/view/article/Add"], resolve),
            },
            {
                path: "/archive",
                component: resolve => require(["@/view/archive/index"], resolve),
                meta: {
                    title: "文章归档"
                }
            },
            {
                path: "/categorys",
                component: resolve => require(["@/view/category/Category.vue"], resolve),
                meta: {
                    title: "文章分类"
                }
            },
            {
                path: "/tag",
                component: resolve => require(["@/view/tag/Tag"], resolve),
                meta: {
                    title: "文章标签"
                }
            },
            {
                path: "/say",
                component: resolve => require(["@/view/say/index"], resolve),
                meta: {
                    title: "说说"
                }
            },
            {
                path: "/newSays",
                component: resolve => require(["@/view/say/Add"], resolve),
                meta: {
                    title: "添加说说"
                }
            },
            {
                path: "/forum",
                component: resolve => require(["@/view/forum/index"], resolve),
                meta: {
                    title: "瞬间"
                }
            },
            {
                path: "/sponsor",
                component: resolve => require(["@/view/sponsor/index"], resolve),
                meta: {
                    title: "打赏名单"
                }
            },
            {
                path: "/im",
                component: resolve => require(["@/view/im/index"], resolve),
                meta: {
                    title: "辰雪博客-一个专注于技术分享的博客平台"
                }
            },
            {
                path: "/hot",
                component: resolve => require(["@/view/search/Hot.vue"], resolve),
                meta: {
                    title: "网站热搜"
                }
            },
            {
                name: "notice",
                path: "/notice",
                component: resolve => require(["@/view/notice/index.vue"], resolve),
                meta: {
                    title: "辰雪博客-一个专注于技术分享的博客平台"
                }
            },
            {
                path: "/navigation",
                component: resolve => require(["@/view/navigation/index.vue"], resolve),
                meta: {
                    title: "网站导航"
                }
            },
            {
                path: "/user",
                component: resolve => require(["@/view/user/index.vue"], resolve),
                meta: {
                    title: "辰雪博客-一个专注于技术分享的博客平台"
                }
            },
            {
                path: "/user_main",
                component: resolve => require(["@/view/user/UserMain.vue"], resolve),
                meta: {
                    title: "辰雪博客-一个专注于技术分享的博客平台"
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

const router = new VueRouter({
    mode: "history",
    scrollBehavior: () => ({ y: 0 }),
    routes
});
// 获取原型对象push函数
const originalPush = VueRouter.prototype.push

// 获取原型对象replace函数
const originalReplace = VueRouter.prototype.replace

// 修改原型对象中的push函数
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}

// 修改原型对象中的replace函数
VueRouter.prototype.replace = function replace(location) {
    return originalReplace.call(this, location).catch(err => err)
}

router.beforeEach((to, from, next) => {
    if (to.meta.title) {
        document.title = to.meta.title
    }
    next()
})
export default router;
