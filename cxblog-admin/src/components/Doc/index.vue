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
      window.open('http://赵浩悦.我爱你/pages/010101/', '_blank')
    }
  }
}
</script>
