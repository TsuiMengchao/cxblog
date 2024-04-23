<template>
  <view class="template-thanks tn-safe-area-inset-bottom">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
        @click="goBack">
        <text class='icon tn-icon-left-arrow'></text>
      </view>
    </tn-nav-bar>

    <view class="tn-margin" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      <view class="tn-flex tn-flex-row-between">
        <view class="justify-content-item tn-text-bold tn-text-xl">
          感谢名单
        </view>
      </view>
    </view>

    <view class="tn-margin tn-text-lg">
      <view class="tn-padding-bottom">
        在这里，首先感谢各位小伙伴的信任与支持啦（打赏费用，用于垫付服务器+域名支出）
      </view>

      <view class="tn-padding-bottom">
        也感恩伯乐巨佬们的支持和鼓励
      </view>

      <view class="tn-padding-bottom">
        感谢 七牛云提供的免费云存储支持
		<view class="tn-padding-bottom">
        </view>
        感谢 PanJiaChen大佬提供的前端脚手架
        <view class="tn-padding-bottom">
        </view>
        感谢 Moxun大佬提供的前端 Curd 通用组件
        <view class="tn-padding-bottom">
        </view>
        感谢 zhy6599大佬提供的后端运维管理相关功能
        <view class="tn-padding-bottom">
        </view>
        感谢 j.yao.SUSE大佬提供的匿名接口与Redis限流等功能
        <view class="tn-padding-bottom">
        </view>
        感谢 d15801543974大佬提供的基于注解的通用查询方式
        <view class="tn-padding-bottom">
        </view>
        感谢每一位被 CX-BLOG 抄过代码的开发者。
      </view>

      <view class="tn-padding-bottom">
        梦辰雪再次感谢大家的支持，可以的话，git上给个五星好评吖
      </view>
    </view>
  </view>
</template>

<script>
  import page_mixin from '@/libs/mixin/page_mixin.js'
  export default {
    name: 'TemplateThanks',
    mixins: [page_mixin],
    data(){
      return {

      }
    },
    methods: {
      
    }
  }
</script>

<style lang="scss" scoped>
    /* 胶囊*/
    .tn-custom-nav-bar__back {
      width: 60%;
      height: 100%;
      position: relative;
      display: flex;
      justify-content: space-evenly;
      align-items: center;
      box-sizing: border-box;
      background-color: rgba(0, 0, 0, 0.15);
      border-radius: 1000rpx;
      border: 1rpx solid rgba(255, 255, 255, 0.5);
      color: #FFFFFF;
      font-size: 18px;

      .icon {
        display: block;
        flex: 1;
        margin: auto;
        text-align: center;
      }

    }

</style>
