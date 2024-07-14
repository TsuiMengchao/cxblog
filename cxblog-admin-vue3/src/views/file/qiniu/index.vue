<template>
  <el-tabs v-model="activeName" style="padding-left: 8px;">
    <el-tab-pane label="储存" name="first">
      <Form ref="local" />
    </el-tab-pane>
    <el-tab-pane label="七牛云存储" name="second">
      <Qiniu ref="qiniu" />
    </el-tab-pane>
  </el-tabs>
</template>

<script setup>
import Qiniu from './qiniu'
import Form from './form'

const activeName = ref("first")
</script>

<style scoped>
</style>
