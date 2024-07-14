<template>
  <div>
    <el-form ref="formRef" :model="form" :rules="rules" style="margin-top: 6px;" size="small" label-width="100px">
      <el-form-item label="邮件标题" prop="subject">
        <el-input v-model="form.subject" style="width: 646px" placeholder="请输入邮件标题，标题不能为空" />
      </el-form-item>
      <el-form-item label="收件地址" prop="tos">
        <el-input v-model="form.tos" style="width: 646px" placeholder="请输入收件地址，多个地址英文逗号,隔开" />
      </el-form-item>
      <editor v-model="form.content" :min-height="192"/>
      <el-button :loading="loading" style="margin-left:1.6%;margin-bottom: 30px" size="medium" type="primary" @click="doSubmit">发送邮件</el-button>
    </el-form>
  </div>
</template>

<script setup>
import { send } from '@/api/msg/email'
import { upload } from '@/api/file'

const baseApi=import.meta.env.BASE_URL
const imagesUploadApi=import.meta.env.BASE_URL
const {proxy} = getCurrentInstance();
      const loading = ref(false)
      const form = ref({ subject: '', tos: '', content: '' })
const rules = ref({
        subject: [
          { required: true, message: '标题不能为空', trigger: 'blur' }
        ],
        tos: [
          { required: true, message: '收件人不能为空', trigger: 'blur' }
        ]
      })

   function doSubmit() {
      proxy.$refs['formRef'].validate((valid) => {
        if (valid) {
          loading.value = true
          send(form.value).then(res => {
            proxy.$modal.notifySuccess('发送成功')
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
</script>

<style scoped>
  .editor{
    text-align:left;
    margin: 20px;
    width: 730px;
  }
 ::v-deep .w-e-text-container {
    height: 360px !important;
  }
</style>
