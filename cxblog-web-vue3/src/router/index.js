
import { createRouter, createWebHistory } from "vue-router";
import { useSiteStore } from "@/store/moudel/site.js";
import layout from '@/components/layout/index.vue'
import home from '@/views/home/index.vue'
import archive from '@/views/archive/index.vue'
import category from '@/views/category/index.vue'
import tag from '@/views/tag/index.vue'
import hot from '@/views/search/Hot.vue'
import message from '@/views/message/index.vue'
import about from '@/views/about/index.vue'
import link from '@/views/link/index.vue'
import article from '@/views/article/index.vue'
import newposts from '@/views/article/Add.vue'
import say from '@/views/say/index.vue'
// import newSays from '@/views/say/Add.vue'
import software from '@/views/software/index.vue'
import chat from '@/views/chat/index.vue'
import notice from '@/views/notice/index.vue'
import user from '@/views/user/index.vue'

const routes = [
    {
        path: "/",
        component: layout,
        meta: {
            title: "辰雪博客-一个专注于技术分享的博客平台"
        },
        children: [
            {
                path: "/",
                component: home,
                meta: {
                    title: "辰雪博客-一个专注于技术分享的博客平台"
                }
            },
            {
                path: "/article/:articleId",
                component: article,
            },
            {
                path: "newposts",
                component: newposts,
            },
            {
                path: "/archive",
                component: archive,
                meta: {
                    title: "文章归档"
                }
            },
            {
                path: "/category",
                component: category,
                meta: {
                    title: "文章分类"
                }
            },
            {
                path: "/tags",
                component: tag,
                meta: {
                    title: "文章标签"
                }
            },
            {
                path: "/hot",
                component: hot,
            },
            {
                path: "/say",
                component: say,
            },
            // {
            //     path: "/newSays",
            //     component: newSays,
            // },
            {
                path: "/message",
                component: message,
                meta: {
                    title: "留言墙"
                }
            },
            {
                path: "/about",
                component: about,
                meta: {
                    title: "关于本站"
                }
            },
            {
                path: "/link",
                component: link,
                meta: {
                    title: "友情链接"
                }
            },
            {
                path: "/software",
                component: software,
                meta: {
                    title: "开源软件"
                }
            },
            {
                path: "/chat",
                component: chat,
            },
            {
                path: "/msg",
                component: notice,
                meta: {
                    title: "消息"
                }
            },
            {
                path: "/user",
                component: user,
                meta: {
                    title: "个人中心"
                }
            },
        ],
    },
];

const router = createRouter({
    routes,
    history: createWebHistory(),
    scrollBehavior: (to, from, savePosition) => {
        return {
            top: 0
        }
    },

});

router.beforeEach((to, from, next) => {
    if (to.meta.title) {
        document.title = to.meta.title
    }
    const siteStore = useSiteStore()
    siteStore.setSearchDialogVisible(false)
    next()
})
export default router;
