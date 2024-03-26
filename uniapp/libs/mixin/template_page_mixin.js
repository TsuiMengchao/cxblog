/**
 * 演示页面mixin
 */
import {
  insertFollowed,deleteFollowed
} from '@/api/followed.js'
module.exports = {

  data() {
    return {

    }
  },
  onLoad() {
    // 更新顶部导航栏信息
    this.updateCustomBarInfo()
  },
  // 分享微信好友
  onShareAppMessage() {
    return {
      title: this.wechatShare.title,
      path: this.wechatShare.path,
      imageUrl: this.wechatShare.imageUrl,
      desc: this.wechatShare.desc,
      content: this.share.content,
      success() {
        uni.showToast({
          title: "分享成功"
        })
      },
      fail() {
        uni.showToast({
          title: "分享失败",
          icon: 'none'
        })
      }
    }
  },
  // 分享朋友圈
  onShareTimeline() {

  },
  methods: {
    // 点击左上角返回按钮时触发事件
    goBack() {
      // 通过判断当前页面的页面栈信息，是否有上一页进行返回，如果没有则跳转到首页
      const pages = getCurrentPages()
      if (pages && pages.length > 0) {
        const firstPage = pages[0]
        if (pages.length == 1 && (!firstPage.route || firstPage.route != 'pages/index')) {
          uni.reLaunch({
            url: '/pages/index'
          })
        } else {
          uni.navigateBack({
            delta: 1
          })
        }
      } else {
        uni.reLaunch({
          url: '/pages/index'
        })
      }
    },
    // 更新顶部导航栏信息
    async updateCustomBarInfo() {
      // 获取vuex中的自定义顶栏的高度
      let customBarHeight = this.vuex_custom_bar_height
      let statusBarHeight = this.vuex_status_bar_height
      // 如果获取失败则重新获取
      if (!customBarHeight) {
        try {
          const navBarInfo = await this.$tn.updateCustomBar()
          customBarHeight = navBarInfo.customBarHeight
          statusBarHeight = navBarInfo.statusBarHeight
        } catch(e) {
          setTimeout(() => {
            this.updateCustomBarInfo()
          }, 10)
          return
        }
      }

      // 更新vuex中的导航栏信息
      this.$tn.vuex('vuex_status_bar_height', statusBarHeight)
      this.$tn.vuex('vuex_custom_bar_height', customBarHeight)
    },
    handleFollowed(userId, content) {
      insertFollowed(userId).then(res => {
        if (res.code != 200) {
          this.$tn.message.toast(res.message)
          return
        }
        content.isFollowed = 1
        this.$tn.message.toast('关注成功')
      })
    },

    handleDeleteFollowed(userId, content) {
      deleteFollowed(userId).then(res => {
        if(res.code != 200){
          this.$tn.message.toast(res.message)
        }
        content.isFollowed = 0
        this.$tn.message.toast('取消关注')
      })
    },

    // 复制
    copy(data="什么都没有复制到") {
      uni.setClipboardData({
        data,
      })
      this.$tn.message.toast('复制成功')
    },
    // 分享
    share(data) {
      uni.setClipboardData({
        data,
      })
      uni.showToast({
        title: "此功能暂未开发"
      })
    },
  }
}
