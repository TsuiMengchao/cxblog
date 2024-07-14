<template>

    <el-form ref="formRef" :model="form" :rules="rules" style="margin-top: 6px;" size="small" label-width="110px">
      <el-form-item label="资源映射路径" prop="domain">
        <el-input v-model="form.domain" style="width: 40%;" />
        <span style="color: #C0C0C0;margin-left: 10px;">资源映射路径，末尾请补充 / </span>
      </el-form-item>
      <el-form-item label="路径前缀" prop="prefix">
        <el-input v-model="form.prefix" style="width: 40%;" />
        <span style="color: #C0C0C0;margin-left: 10px;">资源映射路径前缀</span>
      </el-form-item>
      <el-form-item label="">
        <el-button :loading="loading" size="medium" type="primary" @click="doSubmit">保存配置</el-button>
      </el-form-item>
    </el-form>
</template>

<script setup>
import { getConfig, updateConfig } from '@/api/file/local'
const {proxy} = getCurrentInstance();
      const loading = ref(false)
const form = ref({ domain: '' },{ prefix: '' })
const rules = ref({
        domain: [
          { required: true, message: '请输入外链域名', trigger: 'blur' }
        ],
  prefix: [
    { required: true, message: '请输入资源映射路径前缀', trigger: 'blur' }
  ]
      })

   function init() {
      getConfig().then(res => {
        form.value = res.data
      })
    }
function doSubmit() {
      proxy.$refs['formRef'].validate((valid) => {
        if (valid) {
          loading.value = true
          updateConfig(form.value).then(res => {
            proxy.$modal.notifySuccess('修改成功')
            loading.value = false
          }).catch(err => {
            loading.value = false
            console.log(err.response.data.message)
          })
        } else {
          return false
        }
      })
    }
    init()
</script>

<style scoped>

</style>
