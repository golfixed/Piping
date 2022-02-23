<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "App",
  components: {},
};
</script>

<style lang="scss">
$app-font: "Helvetica Nueue", "Roboto", sans-serif;
#app {
  font-family: $app-font;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin: 0;
  padding: 0;
  font-size: 12px;
}
body {
  width: 100vw;
  height: 100vh;
  margin: 0;
  padding: 0;
  overflow: hidden;
  // -webkit-user-select: none;
  -webkit-touch-callout: none;
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  label,
  span,
  li,
  ul,
  p {
    margin: 0;
    padding: 0;
    font-family: $app-font;
  }
  a {
    text-decoration: none;
    color: #505050;
  }
}
body::-webkit-scrollbar {
  display: none;
}
table {
  width: 100%;
  text-align: left;
  border-collapse: collapse;
  margin-bottom: 20px;
  .table-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    height: fit-content;
    padding-bottom: 10px;
  }
  .intable-btn {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    button {
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #fff;
      border: 1px solid #21325e;
      border-radius: 4px;
      height: 20px;
      padding: 0 10px;
      margin-right: 4px;
    }
    button:hover {
      background-color: #21325e;
      color: #fff;
    }
    .top-btn {
      width: -webkit-fill-available;
      font-weight: bold;
      max-width: 140px;
      height: 30px;
      background-color: #21325e;
      color: #fff;
    }
    .top-btn:hover {
      background-color: #21325e;
      color: #fff;
    }
  }
}
tr {
  height: 30px;
}
tr > th {
  height: fit-content;
  text-indent: 4px;
  text-align: left;
  border: 1px solid #2c3e50;
  border-width: 0px 0px 2px 0px;
}
tr > td {
  border: 1px solid rgb(207, 207, 207);
  border-width: 0 0px 1px 0px;
  text-indent: 4px;
}

tr:first-child:hover {
  background-color: #fff;
}
tr:nth-child(2):hover {
  background-color: #fff;
}
tr:hover {
  background-color: rgb(248, 248, 248);
}

.page-end {
  height: 200px;
}

.page-title {
  background-color: #21325e;
  color: #fff;
  padding: 20px;
}

.page-toolbar {
  padding: 20px 20px 0 20px;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}
.page-content {
  padding: 20px;
  overflow: scroll;
  width: calc(100vw - 40px);
  height: calc(100vh - 131px);
}

.table-label-nodata {
  text-align: center;
  height: 100px;
}
.table-label-end {
  text-align: center;
  height: 20px;
  border: 1px solid #2c3e50;
  border-width: 1px 0px 2px 0px;
}
.table-label-nodata:hover,
.table-label-end:hover {
  background-color: #fff;
}
.btn-tool {
  display: flex;
  justify-content: space-between;
  align-items: center;
  div {
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
  button {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #fff;
    border: 1px solid #21325e;
    border-radius: 4px;
    height: 30px;
    padding: 0 10px;
    margin-right: 10px;
  }
  button:last-child {
    margin-right: 0;
  }
  button:hover {
    background-color: #21325e;
    color: #fff;
  }
}
button {
  cursor: pointer;
  user-select: none;
  -webkit-user-select: none;
}

.popup-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: 10;
  background-color: rgba(255, 255, 255, 0.9);
  .popup-card {
    min-width: 500px;
    height: fit-content;
    background-color: #fff;
    border-radius: 4px;
    overflow: hidden;
    border: 1px solid #21325e;
    .title {
      padding: 10px 20px;
      background-color: #21325e;
      color: #fff;
    }
    .content {
      padding: 20px;
      .form-grid {
        display: grid;
        grid-template-columns: repeat(2, 50%);

        div {
          height: 25px;

          display: flex;
          justify-content: flex-end;
          align-items: center;
          margin-bottom: 10px;
          label {
            margin: 0 10px;
            width: 120px;
            text-align: right;
          }
          input {
            width: 200px;
          }
          p {
            font-weight: bold;
            width: 200px;
          }
        }
      }
    }
    .toolbar {
      padding: 0 20px 20px 20px;
    }
  }
}
</style>
