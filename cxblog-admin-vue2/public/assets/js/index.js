var oldTitle = "辰雪博客-一个不知道在哪抄来的博客平台"

document.addEventListener("visibilitychange", () => {
  if (document.hidden) {
    //离开此标签页
    oldTitle = document.title
    document.title = "等等，你别走啊(ο̬̬̬̬̬̬̬̏̃ɷο̬̬̬̬̬̬̬̏̃)"
  } else {
    //进入此标签页
    document.title = "算了，你还是走吧_(:3 ⌒ﾞ)_"

    window.setTimeout(() => {
      document.title = oldTitle
    }, 800)
  }
}, false);

/* 样式代码 */
var styleTitle1 = `
font-size: 20px;
font-weight: 600;
color: rgb(244,167,89);
`
var styleTitle2 = `
font-style: oblique;
font-size:14px;
color: rgb(244,167,89);
font-weight: 400;
`
var styleContent = `
color: rgb(30,152,255);
`


/* 内容代码 */
var title1 = '🌒 辰雪博客 后台管理系统'

// => 读取配置型(在配置文件里配置这些会变动的网址)
var offiUrl = 'https://www.zhaohaoyue.love/'
var content = `
版 本 号：1.0.0
编译日期：${new Date()}
站点介绍：
1. 一个想当全栈程序员的个人博客.
🏠官网:  ${offiUrl}
📞QQ/VX: 18333191029
`
console.log(`%c${title1}%c${content}`, styleTitle1, styleContent)
