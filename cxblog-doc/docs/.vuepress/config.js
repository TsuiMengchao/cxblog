const head = require('./config/head.js');
const plugins = require('./config/plugins.js');
const themeConfig = require('./config/themeConfig.js');

module.exports = {
  host: 'localhost', // ip
  port: '8040', //端口号
  open: true,
  dest: "./doc",
  theme: "vdoing",
  title: "辰雪博客 在线文档",
  description: '一个不知道哪抄来的博客',
  base: "/",
  markdown: {
    lineNumbers: true
  },
  head,
  themeConfig,
  plugins
}
