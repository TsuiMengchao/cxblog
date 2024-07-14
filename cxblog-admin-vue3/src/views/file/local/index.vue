<template>
  <el-tabs v-model="activeName" style="padding-left: 8px;">
    <el-tab-pane label="本地存储" name="first">
      <Local ref="local" />
    </el-tab-pane>
    <el-tab-pane label="配置" name="second">
      <Form ref="form" />
    </el-tab-pane>
  </el-tabs>
</template>

<script setup>
import Form from './form'
import Local from './local'
const activeName = ref("first")
</script>

<style scoped>
</style>
