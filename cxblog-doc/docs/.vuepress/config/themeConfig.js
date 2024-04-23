const nav = require("./nav.js");
const htmlModules = require("./htmlModules.js");

// Theme Config
module.exports = {
  nav,
  sidebarDepth: 2,
  logo: "/logo/small.png",
  searchMaxSuggestions: 10,
  lastUpdated: "上次更新",

  docsRepo: "tsuimengchao/cxblog/tree/master/cxblog-doc",
  docsDir: "docs",
  docsBranch: "master",
  editLinks: true,
  editLinkText: "帮助我们改善此页面！",

  // Vdoing Theme Config
  sidebar: { mode: "structuring", collapsable: false },

  updateBar: {
    showToArticle: false
  },

  category: false,
  tag: false,
  archive: true,

  author: {
    name: "MCX"
  },

  social: {
    icons: [
      {
        iconClass: "icon-github",
        title: "GitHub",
        link: "https://github.com/tsuimengchao"
      },
      {
        iconClass: "icon-gitee",
        title: "Gitee",
        link: "https://gitee.com/tsuimengchao"
      },
      {
        iconClass: "icon-youjian",
        title: "发邮件",
        link: "mailto:tsuimengchao@qq.com"
      }
    ]
  },
  footer: {
    createYear: 2018,
    copyrightInfo: [
      ' <a href="https://cxblog.zhaohaoyue.love/" target=_blank>辰雪博客</a>'
    ].join('')
  },

  htmlModules
};
