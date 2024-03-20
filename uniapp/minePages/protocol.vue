<template>
  <view class="template-protocol">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
        @cviewck="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>

    <view class=" tn-margin tn-text-lg " :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      <view class="plus-text">
		<view class="tn-text-center tn-margin-bottom-lg tn-text-bold">
			1. 说明
		</view>
		<view class="tn-margin-bottom-xs">本小程序名称为：辰雪博客（辰雪博客归属），以下简称本站</view>
		<view class="tn-margin-bottom-xs">如因不可抗力、网络状况、通讯线路、设备故障、第三方网站等任何原因而导致您不能正常使用本站，本站不承担任何的法律责任</view>
		<view class="tn-margin-bottom-xs">您应该对从本站下载的内容自行承担风险。除了本站注明之外，其它一切因使用从本站下载内容而可能遭致的意外、疏忽、侵权及造成的损失，本站对其概不负责，亦不承担任何法律责任</view>
		<view class="tn-margin-bottom-xs">本站严格遵守国家相关法律法规，尊重版权、著作权等权利，因此本站不支持包含危害国家安全和民族团结、侵犯他人权益、欺骗性质、色情或暴力的内容</view>
		<view class="tn-margin-bottom-xs">本站保留自动和人工审查的权利，一旦发现或者接到有效举报，本站将在不做任何通知上传者的情况下删除相关的内容，并保留将有关资料提交给相关部门的权利</view>
		<view class="tn-margin-bottom-xs">本站尊重并保护个人隐私</view>
	  </view>

      <view class="plus-text">
		<view class="tn-text-center tn-margin-bottom-lg tn-text-bold">
			2. 使用协议
		</view>
		<view class="tn-text-bold">您承诺，严格依照本声明使用本服务，并且不会利用本服务进行任何违法或不当的活动，发布、传送或分享含有下列内容之一的信息：</view>
		<view class="tn-margin-bottom-xs">
			反对宪法所确定的基本原则的
		</view>
		<view class="tn-margin-bottom-xs">
			危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的
		</view>
		<view class="tn-margin-bottom-xs">损害国家荣誉和利益的</view>
		<view class="tn-margin-bottom-xs">煽动民族仇恨、民族歧视、破坏民族团结的</view>
		<view class="tn-margin-bottom-xs">破坏国家宗教政策，宣扬邪教和封建迷信的</view>
		<view class="tn-margin-bottom-xs">散布谣言，扰乱社会秩序，破坏社会稳定的</view>
		<view class="tn-margin-bottom-xs">散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的</view>
		<view class="tn-margin-bottom-xs">侮辱或者诽谤他人，侵害他人合法权利的</view>
		<view class="tn-margin-bottom-xs">含有虚假、诈骗、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容</view>
		<view class="tn-margin-bottom-xs">含有中国或其您所在国国家管辖法所适用的法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的。您应当对使用本服务是否符合法律法规规定进行必要审查，并由您承担由此产生的所有责任。您确认并同意，我方不会因为本服务或您使用本服务违反上述约定，而需要承担任何责任</view>
		<view class="tn-margin-bottom-xs">您同意并承诺，在使用本服务时，不会披露任何保密、敏感或个人信息</view>
		<view class="tn-margin-bottom-xs">您使用本服务不得侵害他人权益（包括但不限于著作权、专利权、商标权等知识产权与其他权益）</view>
		<view class="tn-margin-bottom-xs">若您违反本声明任何约定，则我方有权随时单方面终止本声明，且我方无需承担任何责任。同时，我方有权根据实际损失向您请求赔偿</view>
		<view class="tn-margin-bottom-xs">除双方另有约定外，本声明之解释与适用，以及与本声明有关的争议，均依照中华人民共和国法律予以处理(不包含冲突法)</view>

      </view>

    </view>


    <view class="tn-padding-bottom"></view>
  </view>
</template>

<script>
  import template_page_mixin from '@/libs/mixin/template_page_mixin.js'
  export default {
    name: 'TemplatePlus',
    mixins: [template_page_mixin],
    data(){
      return {}
    },
    methods: {

      // 复制微信号
      copyWechat() {
        uni.setClipboardData({
          data: "qunlong1234",
        })
      },
    }
  }
</script>

<style lang="scss" scoped>
  /* 胶囊*/
  .tn-custom-nav-bar__back {
    width: 100%;
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

    &:before {
      content: " ";
      width: 1rpx;
      height: 110%;
      position: absolute;
      top: 22.5%;
      left: 0;
      right: 0;
      margin: auto;
      transform: scale(0.5);
      transform-origin: 0 0;
      pointer-events: none;
      box-sizing: border-box;
      opacity: 0.7;
      background-color: #FFFFFF;
    }
  }
  .tn-margin-bottom-xs{
	text-indent: 20px;
  }

</style>
