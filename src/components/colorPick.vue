<!-- MyComponent.vue -->

<template>
<div class="container">
  <div class="color-picker" v-for="c in colors" :key="c.Label">
    <div class="color-picker-box" :style="{ backgroundColor: c.Color }">
        <p>{{ c.Label }}</p>
    </div>
  </div>
</div>
</template>

<script>
import colorsJson from "../assets/colors.json";
  export default {
    name: "colorPicker",
    components: {
        
    },
    data() {
    return {
        colors: colorsJson,
    }
    }
  };
</script>
<style scoped>
.container {
    display: flex;
    width: 100%;
    flex-wrap: wrap;
    text-align: center;
    line-height: 50px; 
}
.color-picker-box {
    width: 100px;
    height: 50px;
    margin: 5px;
}
</style>