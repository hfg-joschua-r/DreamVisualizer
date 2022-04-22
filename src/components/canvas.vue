<!-- MyComponent.vue -->

<template>
  <vue-drawing-canvas ref="VueCanvasDrawing" />
</template>

<script>
  import VueDrawingCanvas from "vue-drawing-canvas";

  export default {
    name: "MyComponent",
    components: {
      VueDrawingCanvas,
    },
  };
</script>