<template>
    <el-form ref="formRef" :model="form" :rules="rules" style="margin-top: 6px;" size="small" label-width="110px">
      <el-form-item label="Access Key" prop="accessKey">
        <el-input v-model="form.accessKey" style="width: 95%" placeholder="accessKey，在安全中心，秘钥管理中查看" />
      </el-form-item>
      <el-form-item label="Secret Key" prop="secretKey">
        <el-input v-model="form.secretKey" type="password" style="width: 95%;" placeholder="secretKey，在安全中心，秘钥管理中查看" />
      </el-form-item>
      <el-form-item label="空间名称" prop="bucket">
        <el-input v-model="form.bucket" style="width: 95%;" placeholder="存储空间名称作为唯一的 Bucket 识别符" />
      </el-form-item>
      <el-form-item label="外链域名" prop="host">
        <el-input v-model="form.host" style="width: 95%;" placeholder="外链域名，可自定义，需在七牛云绑定" />
      </el-form-item>
      <el-form-item label="存储区域">
        <el-select v-model="form.zone" placeholder="请选择存储区域">
          <el-option
            v-for="item in zones"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="空间类型" prop="type">
        <el-radio v-model="form.type" label="公开">公开</el-radio>
        <el-radio v-model="form.type" label="私有">私有</el-radio>
      </el-form-item>
      <el-form-item label="">
        <el-button :loading="loading" size="medium" type="primary" @click="doSubmit">保存配置</el-button>
      </el-form-item>
    </el-form>
</template>

<script setup>
import {getQiniuCofig, updateQiniuCofig} from "@/api/file/qiniu";
const { proxy } = getCurrentInstance();

      const zones = ref(['华东', '华北', '华南', '北美', '东南亚'])

      const loading = ref(false)
      const data = reactive({
        form : {},
        rules : {
          accessKey: [
            { required: true, message: '请输入accessKey', trigger: 'blur' }
          ],
          secretKey: [
            { required: true, message: '请输入secretKey', trigger: 'blur' }
          ],
          bucket: [
            { required: true, message: '请输入空间名称', trigger: 'blur' }
          ],
          host: [
            { required: true, message: '请输入外链域名', trigger: 'blur' }
          ],
          type: [
            { required: true, message: '空间类型不能为空', trigger: 'blur' }
          ]
        }
      })

      const {form, rules} = toRefs(data)

// 七牛云配置
function doConfig() {
  getQiniuCofig().then(res => {
    form.value = res.data
  })
}

    function doSubmit() {
      proxy.$refs['formRef'].validate((valid) => {
        if (valid) {
          loading.value = true
          updateQiniuCofig(form.value).then(res => {
            proxy.$modal.notifySuccess('修改成功')
            getList()
            loading.value = false
          }).catch(err => {
            loading.value = false
            console.log(err)
          })
        } else {
          return false
        }
      })
    }
doConfig()
</script>

<style scoped>

</style>
