<template>
  <div class="">
    <viewer :images="newImages" style="height: 800px"> </viewer>
  </div>
</template>
   
<script setup name='image-preview'>

const $viewerApi =
  getCurrentInstance().appContext.config.globalProperties.$viewerApi;
const newImages = ref([]);

const props = defineProps({
  img: {
    type: Object,
    default: {},
  },
});
watch(
  () => props.img,
  (newValue, oldValue) => {
    newImages.value = newValue.urls;
    let imgList = splitImg(newImages.value);
    newImages.value = [];
    for (let i = 0; i < imgList.length; i++) {
      newImages.value.push({ src: imgList[i] });
    }
    $viewerApi({
      images: newImages.value,
    });
  }
);

function splitImg(img) {
  let imgs = img.split(",");
  var r = imgs.filter(function (s) {
    return s && s.trim();
  });
  return r;
}
</script>
   
<style lang='scss' scoped></style>