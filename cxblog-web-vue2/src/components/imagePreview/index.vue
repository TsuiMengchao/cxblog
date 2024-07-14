<template>
    <div class=''>
        <viewer :images="newImages" style="height: 800px;">
        </viewer>
    </div>
</template>
   
<script>

export default {
    props: {
        img: {
            type: Object,
            default: {}
        },
    },
    name: '',
    data() {
        return {
            newImages: []
        }
    },

    watch: {
        img: function (newData, oldData) {
            console.log(newData)
            this.newImages = newData.urls;
            let imgList = this.splitImg(this.newImages)
            this.newImages = []
            for (let i = 0; i < imgList.length; i++) {
                this.newImages.push({ src: imgList[i] })
            }
            this.$viewerApi({
                images: this.newImages,
            });
        },
    },
    methods: {
        splitImg(img) {
            let imgs = img.split(",")
            var r = imgs.filter(function (s) {
                return s && s.trim();
            });
            return r;
        },
    },
}
</script>
   
<style lang='scss' scoped></style>