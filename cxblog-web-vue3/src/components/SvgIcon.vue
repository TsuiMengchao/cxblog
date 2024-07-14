<template>
  <svg :class="svgClass" aria-hidden="true" :style="{marginRight:`${mr}px`}">
    <use :xlink:href="iconName"/>
  </svg>
</template>

<script setup>

const props = defineProps({
  name: {
    type: String,
    required: true,
     default: ''
  },
  color: {
    type: String,
    default: ''
  },
  mr:{
    type:String,
    default:'0'
  }
})

const iconName = computed(()=>`#icon-${props.name}`);
const mr = computed(()=>`#icon-${props.mr}`);
const svgClass = computed(()=> {
  if (props.name) {
    return `svg-icon icon-${props.name}`
  }
  return 'svg-icon'
});
</script>

<style lang='scss'>
.svg-icon {
  width: 1em;
  height: 1em;
  fill: currentColor;
  vertical-align: middle;
}
</style>
