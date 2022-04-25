<template>
  <!-- Navbar -->

  <nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="16"
          height="16"
          fill="currentColor"
          class="bi bi-hypnotize"
          viewBox="0 0 16 16"
        >
          <path
            d="m7.949 7.998.006-.003.003.009-.01-.006Zm.025-.028v-.03l.018.01-.018.02Zm0 .015.04-.022.01.006v.04l-.029.016-.021-.012v-.028Zm.049.057v-.014l-.008.01.008.004Zm-.05-.008h.006l-.006.004v-.004Z"
          />
          <path
            fill-rule="evenodd"
            d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM4.965 1.69a6.972 6.972 0 0 1 3.861-.642c.722.767 1.177 1.887 1.177 3.135 0 1.656-.802 3.088-1.965 3.766 1.263.24 2.655-.815 3.406-2.742.38-.975.537-2.023.492-2.996a7.027 7.027 0 0 1 2.488 3.003c-.303 1.01-1.046 1.966-2.128 2.59-1.44.832-3.09.85-4.26.173l.008.021.012-.006-.01.01c.42 1.218 2.032 1.9 4.08 1.586a7.415 7.415 0 0 0 2.856-1.081 6.963 6.963 0 0 1-1.358 3.662c-1.03.248-2.235.084-3.322-.544-1.433-.827-2.272-2.236-2.279-3.58l-.012-.003c-.845.972-.63 2.71.666 4.327a7.415 7.415 0 0 0 2.37 1.935 6.972 6.972 0 0 1-3.86.65c-.727-.767-1.186-1.892-1.186-3.146 0-1.658.804-3.091 1.969-3.768l-.002-.007c-1.266-.25-2.666.805-3.42 2.74a7.415 7.415 0 0 0-.49 3.012 7.026 7.026 0 0 1-2.49-3.018C1.87 9.757 2.613 8.8 3.696 8.174c1.438-.83 3.084-.85 4.253-.176l.005-.006C7.538 6.77 5.924 6.085 3.872 6.4c-1.04.16-2.03.55-2.853 1.08a6.962 6.962 0 0 1 1.372-3.667l-.002.003c1.025-.243 2.224-.078 3.306.547 1.43.826 2.269 2.23 2.28 3.573L8 7.941c.837-.974.62-2.706-.673-4.319a7.415 7.415 0 0 0-2.362-1.931Z"
          />
        </svg>

        Dream Visualizer
        <span class="fs-mini">designed in Schwäbisch Gmünd</span>
      </a>
    </div>
  </nav>

  <!-- End Navbar -->

  <!-- Content Container -->
  <div
    class="container"
    style="
      position: absolute;
      top: 100px;
      margin-left: auto;
      margin-right: auto;
      left: 50px;
      right: 50px;
      text-align: center;
    "
  >
    <!--1. Row-->
    <div class="row">
      <div class="col">
        <h4>Canvas:</h4>
        <vue-drawing-canvas
          ref="VueCanvasDrawing"
          background-color="#000"
          v-model:image="image"
          :stroke-type="strokeType"
          :fill-shape="fillShape"
          :eraser="eraser"
          :lineWidth="line"
          :color="color"
          saveAs="jpeg"
          :styles="{
            border: 'solid 2px #000',
          }"
          :lock="disabled"
          @mousemove="getCoordinate($event)"
          @mouseup="getNewRunwayImage()"
        />

        <!-- Buttons here -->
        <div class="button-container" style="justify-content: right">
          <button
            type="button"
            class="btn btn-dark"
            @click.prevent="$refs.VueCanvasDrawing.undo()"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-arrow-counterclockwise"
              viewBox="0 0 16 16"
            >
              <path
                fill-rule="evenodd"
                d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"
              />
              <path
                d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"
              />
            </svg>
            Undo
          </button>
          <button
            type="button"
            class="btn btn-dark"
            @click.prevent="$refs.VueCanvasDrawing.redo()"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-arrow-clockwise"
              viewBox="0 0 16 16"
            >
              <path
                fill-rule="evenodd"
                d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"
              />
              <path
                d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"
              />
            </svg>
            Redo
          </button>

          <button
            type="button"
            class="btn btn-dark"
            @click.prevent="$refs.VueCanvasDrawing.reset()"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-file-earmark"
              viewBox="0 0 16 16"
            >
              <path
                d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"
              />
            </svg>
            Reset
          </button>
        </div>
        <div style="text-align: left; margin-left: 17px">
          Line-Weight:
          <slider
            v-model="line"
            max="40"
            color="#35ffb8 "
            track-color="#00009e"
            tooltip="true"
          />
        </div>
      </div>
      <div class="col">
        <div class="output">
          <h4 v-if="!loadingImg">Output:</h4>
          <h4 v-if="loadingImg">Loading...</h4>
          <div
            style="width: 600px; height: 400px; background-color: #ededed"
            v-if="!imageAvailable"
          >
          </div>
          <img v-if="imageAvailable"
          :src="generatedImage" style="border: solid 1px #000000" />
          <div class="button-container">
            <button
              class="btn btn-dark"
              style="display: block; margin-left: auto; margin-right: 0px"
              @click="downloadOutput()"
            >
              Download
            </button>
          </div>
        </div>
      </div>
    </div>

    <!--2. Row-->

    <div class="row" style="width: 100%; margin-left: 6px">
      <div class="col">
        <div class="button-container">
          <button
            type="button"
            class="btn btn-primary"
            @click.prevent="eraser = !eraser"
          >
            <span v-if="eraser">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                fill="currentColor"
                class="bi bi-eraser"
                viewBox="0 0 16 16"
              >
                <path
                  d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm2.121.707a1 1 0 0 0-1.414 0L4.16 7.547l5.293 5.293 4.633-4.633a1 1 0 0 0 0-1.414l-3.879-3.879zM8.746 13.547 3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"
                />
              </svg>
              Eraser
            </span>
            <span v-else>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                fill="currentColor"
                class="bi bi-pencil"
                viewBox="0 0 16 16"
              >
                <path
                  d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"
                />
              </svg>
              Draw
            </span>
          </button>
          <input style="height:38px; width:83px" type="color" v-model="color" />
        </div>
      </div>
    </div>

    <!--- Color Picker -->
    <div class="container">
      <div class="color-picker" v-for="c in colors" :key="c.Label">
        <div
          class="color-picker-box"
          :style="{ backgroundColor: c.Color }"
          @click="color = c.Color"
        >
          <p>{{ c.Label }}</p>
        </div>
      </div>
    </div>
  </div>
  <!-- End Content Container -->

  <!-- Footer -->
  <footer class="footer mt-auto py-3 bg-light">
    <div class="container">
      <span class="text-muted">Machine Learning - Smart Home Projekt</span>
    </div>
  </footer>
  <!-- End Footer -->
</template>

<script>
import VueDrawingCanvas from "vue-drawing-canvas";
import slider from "vue3-slider";
import axios from "axios";
import colorsJson from "./assets/colors.json";

export default {
  name: "App",
  components: {
    VueDrawingCanvas,
    slider,
  },
  data() {
    return {
      x: 0,
      y: 0,
      image: "",
      imageAvailable: false,
      generatedImage: "",
      eraser: false,
      disabled: false,
      fillShape: false,
      line: 5,
      color: "#ffffff",
      strokeType: "dash",
      backgroundColor: "#000",
      backgroundImage: null,
      watermark: null,
      loadingImg: false,
      colors: colorsJson,
    };
  },
  methods: {
    async setImage(event) {
      let URL = window.URL;
      this.backgroundImage = URL.createObjectURL(event.target.files[0]);
      await this.$refs.VueCanvasDrawing.redraw();
    },
    async setWatermarkImage(event) {
      let URL = window.URL;
      this.watermark = {
        type: "Image",
        source: URL.createObjectURL(event.target.files[0]),
        x: 0,
        y: 0,
        imageStyle: {
          width: 600,
          height: 400,
        },
      };
      await this.$refs.VueCanvasDrawing.redraw();
    },
    getCoordinate(event) {
      let coordinates = this.$refs.VueCanvasDrawing.getCoordinates(event);
      this.x = coordinates.x;
      this.y = coordinates.y;
    },
    getNewRunwayImage() {
      this.loadingImg = true;
      axios
        .post(`http://localhost:8000/query`, {
          semantic_map: this.image,
        })
        .then((response) => {
          console.log(response);
          this.generatedImage = response.data.output;
          this.loadingImg = false;
          this.imageAvailable = true;
        })

        .catch((e) => {
          this.errors.push(e);
        });
      console.log("getting new image from runway...");
    },
    downloadOutput() {
      let link = document.createElement("a");
      link.download = "output.png";
      link.href = this.generatedImage;
      link.click();
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");
template {
  font-family: "Roboto", sans-serif;
}
.flex-row {
  display: flex;
  flex-direction: row;
}
.button-container {
  display: flex;
  flex-direction: row;
}
.button-container > * {
  margin-top: 15px;
  margin-bottom: 15px;
  margin-right: 10px;
}
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
p {
  font-size: 16px;
  font-weight: bold;
  font-family: "Roboto", sans-serif;
  text-align: center;
}
h4 {
  font-size: 18px;
  font-weight: bold;
  font-family: "Roboto", sans-serif;
  text-align: left;
}

.fs-mini {
  font-size: 8px;
}

footer {
  position: fixed;
  height: 70px;
  bottom: 0;
  width: 100%;
}
</style>
