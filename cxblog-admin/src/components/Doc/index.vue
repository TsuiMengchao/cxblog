<template>
  <div>
    <svg-icon icon-class="doc" @click="click" />
  </div>
</template>

<script>
export default {
  name: 'Doc',
  methods: {
    click() {
      window.open('https://doc.cxblog.zhaohaoyue.love/pages/010101/', '_blank')
    }
  }
}
</script>
