<template>
  <div>
    <div class="page">
      <div class="page-title">
        <h1>Piping</h1>
      </div>
      <div class="page-toolbar">
        <div class="btn-tool">
          <button class="toptool" v-on:click="backHome()">Back</button>
        </div>
        <div class="line-number">
          <label>Line number: </label>
          <h2>{{ lineInfo.line_number }}</h2>
        </div>
      </div>
      <div class="page-content">
        <!-- CML -->
        <table>
          <tr>
            <th colspan="8">
              <div class="table-header">
                <h2>CML</h2>
                <div class="intable-btn">
                  <button class="top-btn" v-on:click="addCMLbtn()">
                    Add CML
                  </button>
                </div>
              </div>
            </th>
          </tr>
          <tr>
            <th>CML Number</th>
            <th>CML Description</th>
            <th>Actual Outside Diameter</th>
            <th>Design Thickness (mm)</th>
            <th>Structural Thickness (mm)</th>
            <th>Required Thickness (mm)</th>
            <th></th>
          </tr>
          <tr v-for="item in cmlList" :key="item.id">
            <td>{{ item.cml_number }}</td>
            <td>{{ item.cml_description }}</td>
            <td>{{ item.actual_outside_diameter }}</td>
            <td>{{ item.design_thickness }}</td>
            <td>{{ item.structural_thickness }}</td>
            <td>{{ item.required_thickness }}</td>
            <td>
              <div class="intable-btn">
                <button v-on:click="fetchTPList(item.id)">
                  view Test Point
                </button>
                <button v-on:click="editCMLBtn(item.id)">edit</button>
                <button v-on:click="deleteCML(item.id)">delete</button>
              </div>
            </td>
          </tr>
          <tr v-if="cmlList.length > 0">
            <td colspan="8" class="table-label-end">
              Total <b>{{ cmlList.length }}</b> records
            </td>
          </tr>
          <tr v-if="cmlList.length == 0">
            <td colspan="8" class="table-label-nodata">No Data</td>
          </tr>
        </table>
        <!-- TEST POINT -->
        <table>
          <tr>
            <th colspan="8">
              <div class="table-header">
                <h2>TEST POINT</h2>
                <div class="intable-btn">
                  <button
                    class="top-btn"
                    v-on:click="addTPbtn()"
                    v-if="this.currentTPadd.id_cml"
                  >
                    Add Test Point
                  </button>
                </div>
              </div>
            </th>
          </tr>
          <tr>
            <th>TP Number</th>
            <th>TP Description</th>
            <th>Note</th>
            <th></th>
          </tr>
          <tr v-for="item in tpList" :key="item.id">
            <td>{{ item.tp_number }}</td>
            <td>{{ item.tp_description }}</td>
            <td>{{ item.note }}</td>
            <td>
              <div class="intable-btn">
                <button v-on:click="fetchTNList(item.id)">
                  view Thickness
                </button>
                <button v-on:click="editTPbtn(item.id)">edit</button>
                <button v-on:click="deleteTP(item.id)">delete</button>
              </div>
            </td>
          </tr>
          <tr v-if="tpList.length > 0">
            <td colspan="8" class="table-label-end">
              Total <b>{{ tpList.length }}</b> records
            </td>
          </tr>
          <tr v-if="tpList.length == 0">
            <td colspan="8" class="table-label-nodata">No Data</td>
          </tr>
        </table>
        <!-- THICKNESS -->
        <table>
          <tr>
            <th colspan="8">
              <div class="table-header">
                <h2>THICKNESS</h2>
                <div class="intable-btn">
                  <button
                    class="top-btn"
                    v-on:click="addTNbtn()"
                    v-if="this.currentTNadd.id_testpoint"
                  >
                    Add Thickness
                  </button>
                </div>
              </div>
            </th>
          </tr>
          <tr>
            <th>TP Number</th>
            <th>TP Description</th>
            <th></th>
          </tr>
          <tr v-for="item in tnList" :key="item.id">
            <td>{{ item.inspection_date }}</td>
            <td>{{ item.actual_thickness }}</td>
            <td>
              <div class="intable-btn">
                <button v-on:click="editTNbtn(item.id)">edit</button>
                <button v-on:click="deleteTN(item.id)">delete</button>
              </div>
            </td>
          </tr>
          <tr v-if="tnList.length > 0">
            <td colspan="8" class="table-label-end">
              Total <b>{{ tnList.length }}</b> records
            </td>
          </tr>
          <tr v-if="tnList.length == 0">
            <td colspan="8" class="table-label-nodata">No Data</td>
          </tr>
        </table>
        <div class="page-end"></div>
      </div>
    </div>
    <div class="popup-wrapper" v-if="isPopup == true">
      <!-- CML (1) -->
      <div class="popup-card" v-if="popupPage == 1">
        <div class="title">
          <h2 v-if="isAdd == true">Add New CML</h2>
          <h2 v-if="isEdit == true">Edit CML</h2>
        </div>
        <div class="content">
          <div class="form-grid">
            <div>
              <label>CML Number:</label>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentCMLedit.cml_number"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentCMLadd.cml_number"
              />
            </div>
            <div>
              <label>CML Description:</label>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentCMLedit.cml_description"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentCMLadd.cml_description"
              />
            </div>
          </div>
        </div>
        <div class="toolbar">
          <div class="btn-tool">
            <div></div>
            <div>
              <button v-on:click="addCML()" v-if="isAdd == true">add</button>
              <button v-on:click="editCML()" v-if="isEdit == true">
                save edit
              </button>
              <button v-on:click="closePopup(1)">cancel</button>
            </div>
          </div>
        </div>
      </div>
      <!-- TEST POINT (2) -->
      <div class="popup-card" v-if="popupPage == 2">
        <div class="title">
          <h2 v-if="isAdd == true">Add New Test Point</h2>
          <h2 v-if="isEdit == true">Edit Test Point</h2>
        </div>
        <div class="content">
          <div class="form-grid">
            <div>
              <label>Test Point Number:</label>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentTPedit.tp_number"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentTPadd.tp_number"
              />
            </div>
            <div>
              <label>Test Point Description:</label>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentTPedit.tp_description"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentTPadd.tp_description"
              />
            </div>
            <div>
              <label>Note:</label>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentTPedit.note"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentTPadd.note"
              />
            </div>
          </div>
        </div>
        <div class="toolbar">
          <div class="btn-tool">
            <div></div>
            <div>
              <button v-on:click="addTP()" v-if="isAdd == true">add</button>
              <button v-on:click="editTP()" v-if="isEdit == true">
                save edit
              </button>
              <button v-on:click="closePopup(2)">cancel</button>
            </div>
          </div>
        </div>
      </div>
      <!-- THICKNESS (3) -->
      <div class="popup-card" v-if="popupPage == 3">
        <div class="title">
          <h2 v-if="isAdd == true">Add New Thickness</h2>
          <h2 v-if="isEdit == true">Edit Thickness</h2>
        </div>
        <div class="content">
          <div class="form-grid">
            <div>
              <label>Inspection Date:</label>
              <input
                v-if="isEdit == true"
                type="date"
                v-model="currentTNedit.inspection_date"
              />
              <input
                v-if="isAdd == true"
                type="date"
                v-model="currentTNadd.inspection_date"
              />
            </div>
            <div>
              <label>Actual Thickness:</label>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentTNedit.actual_thickness"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentTNadd.actual_thickness"
              />
            </div>
          </div>
        </div>
        <div class="toolbar">
          <div class="btn-tool">
            <div></div>
            <div>
              <button v-on:click="addTN()" v-if="isAdd == true">add</button>
              <button v-on:click="editTN()" v-if="isEdit == true">
                save edit
              </button>
              <button v-on:click="closePopup(3)">cancel</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "PageDetail",
  created() {
    this.fetchInfo();
    this.fetchCMLList();
  },
  data() {
    return {
      isPopup: false,
      isAdd: false,
      isEdit: false,
      currentCMLadd: {
        id_info: "",
        cml_number: "",
        cml_description: "",
        actual_outside_diameter: "",
        design_thickness: "",
        structural_thickness: "",
        required_thickness: "",
      },
      currentCMLedit: {},
      currentTPadd: {
        id_cml: "",
        tp_number: "",
        tp_description: "",
        note: "",
      },
      currentTPedit: {},
      currentTNadd: {},
      currentTNedit: {},
      popupPage: 1,
      lineInfo: {},
      cmlList: [],
      tpList: [],
      tnList: [],
      selectedID: this.$store.state.selected_line,
    };
  },
  methods: {
    fetchInfo() {
      axios
        .get("http://localhost/infoView.php?id=" + this.selectedID)
        .then((res) => {
          console.log("Get Line Info:");
          console.log(res.data[0]);
          this.lineInfo = res.data[0];
          this.calcAll();
        });
    },
    fetchCMLList() {
      this.tpList = [];
      if (this.selectedID) {
        axios
          .get("http://localhost/cmlList.php?id=" + this.selectedID)
          .then((res) => {
            // console.log("Get CML Info: " + res.data);
            this.cmlList = res.data;
          });
      }
    },
    fetchTPList(id) {
      this.currentTPadd.id_cml = id;
      this.tnList = [];
      if (id) {
        axios.get("http://localhost/tpList.php?id=" + id).then((res) => {
          console.log("Fetch Test Point List: " + res.statusText);
          console.log(res.data);
          this.tpList = res.data;
        });
      }
    },
    fetchTNList(id) {
      this.currentTNadd.id_testpoint = id;
      if (id) {
        axios.get("http://localhost/tnList.php?id=" + id).then((res) => {
          console.log("Fetch Thickness List: " + res.statusText);
          console.log(res.data);
          this.tnList = res.data;
        });
      }
    },
    openPopup(opt) {
      if (opt == 1) {
        this.popupPage = 1;
      } else if (opt == 2) {
        this.popupPage = 2;
      } else if (opt == 3) {
        this.popupPage = 3;
      }
      this.isPopup = true;
    },
    closePopup() {
      // if (opt == 1) {
      //   this.clearForm(1);
      //   this.fetchCMLList();
      // } else if (opt == 2) {
      //   this.clearForm(2);
      //   this.fetchTPList();
      // } else if (opt == 3) {
      //   this.clearForm(3);
      //   this.fetchTNList();
      // }
      this.isPopup = false;
      this.isAdd = false;
      this.isEdit = false;
    },
    clearForm(opt) {
      var self = this;
      if (opt == 1) {
        Object.keys(this.currentCMLadd).forEach(function (key) {
          self.currentCMLadd[key] = "";
        });
      } else if (opt == 2) {
        Object.keys(this.currentTPadd).forEach(function (key) {
          self.currentTPadd[key] = "";
        });
      } else if (opt == 3) {
        Object.keys(this.currentTNadd).forEach(function (key) {
          self.currentTNadd[key] = "";
        });
      }
    },
    calcAll() {
      this.calAOD();
      this.calDT();
      this.calST();
      this.calRT();
    },
    calAOD() {
      var pipe_size = this.lineInfo.pipe_size;
      var result;
      if (pipe_size == 0.125) result = 10.3;
      else if (pipe_size == 0.25) result = 13.7;
      else if (pipe_size == 0.357) result = 17.1;
      else if (pipe_size == 0.5) result = 21.3;
      else if (pipe_size == 1) result = 33.4;
      else if (pipe_size == 1.25) result = 42.2;
      else if (pipe_size == 1.5) result = 48.3;
      else if (pipe_size == 2.0) result = 60.3;
      else if (pipe_size == 2.5) result = 73.0;
      else if (pipe_size == 3) result = 88.9;
      else if (pipe_size == 3.5) result = 101.6;
      else if (pipe_size == 4.0) result = 114.3;
      else if (pipe_size == 5) result = 141.3;
      else if (pipe_size == 6) result = 168.3;
      else if (pipe_size == 8) result = 219.1;
      else if (pipe_size == 10) result = 273.0;
      else if (pipe_size == 12) result = 323.8;
      else if (pipe_size == 14) result = 355.6;
      else if (pipe_size == 16) result = 406.4;
      else if (pipe_size == 18) result = 457.0;
      else result = 0;
      this.currentCMLadd.actual_outside_diameter = Number(result).toFixed(3);
      console.log(
        "Actual Outside Diameter= " + this.currentCMLadd.actual_outside_diameter
      );
    },
    calDT() {
      var info = this.lineInfo;
      var aod = this.currentCMLadd.actual_outside_diameter;
      var result;
      var t = info.design_pressure * aod;
      var bl = 2 * info.stress * info.joint_efficiency;
      var br = 2 * info.design_pressure * 0.4;
      var b = bl + br;
      result = t / b;
      this.currentCMLadd.design_thickness = Number(result).toFixed(3);
      console.log("Design Thickness= " + this.currentCMLadd.design_thickness);
    },
    calST() {
      var pipe_size = this.lineInfo.pipe_size;
      var result;
      if (pipe_size <= 2) result = 1.8;
      else if (pipe_size == 3) result = 2;
      else if (pipe_size == 4) result = 2.3;
      else if (pipe_size >= 6 && pipe_size <= 18) result = 2.8;
      else if (pipe_size >= 20) result = 3.1;
      else result = 0;
      this.currentCMLadd.structural_thickness = Number(result).toFixed(3);
      console.log(
        "Structural Thickness= " + this.currentCMLadd.structural_thickness
      );
    },
    calRT() {
      var result;
      const a = this.currentCMLadd.design_thickness,
        b = this.currentCMLadd.structural_thickness;
      result = Number(Math.max(a, b).toFixed(3));
      this.currentCMLadd.required_thickness = result;
      console.log(
        "Required Thickness= " + this.currentCMLadd.required_thickness
      );
    },
    addCMLbtn() {
      this.isAdd = true;
      this.openPopup(1);
    },
    addCML() {
      this.currentCMLadd.id_info = this.lineInfo.id;
      var data = this.currentCMLadd;
      if (confirm("Confirm Add?")) {
        axios
          .post("http://localhost/cmlAdd.php", JSON.stringify(data))
          .then((res) => {
            console.log("Add CML: " + res.data);
            this.fetchCMLList();
            this.closePopup(1);
          });
      }
    },
    editCMLBtn(id) {
      this.isEdit = true;
      this.isAdd = false;
      axios.get("http://localhost/cmlView.php?id=" + id).then((res) => {
        console.log("View CML: " + res.statusText);
        this.currentCMLedit = res.data[0];
      });
      this.openPopup(1);
    },
    editCML() {
      var data = this.currentCMLedit;
      if (confirm("Confirm Edit?")) {
        axios
          .post("http://localhost/cmlUpdate.php", JSON.stringify(data))
          .then((res) => {
            console.log("Update CML: " + res.data);
            this.fetchCMLList();
            this.closePopup(1);
          });
      }
    },
    addTPbtn() {
      if (this.currentTPadd.id_cml) {
        this.isAdd = true;
        this.openPopup(2);
      } else alert("No CML selected. Please select one");
    },
    addTP() {
      var data = this.currentTPadd;
      if (confirm("Confirm Add?")) {
        axios
          .post("http://localhost/tpAdd.php", JSON.stringify(data))
          .then((res) => {
            console.log("Add TP: " + res.data);
            this.fetchTPList(this.currentTPadd.id_cml);
            this.closePopup(2);
          });
      }
    },
    editTPbtn(id) {
      this.isEdit = true;
      this.isAdd = false;
      axios.get("http://localhost/tpView.php?id=" + id).then((res) => {
        console.log("View TP: " + res.statusText);
        this.currentTPedit = res.data[0];
      });
      this.openPopup(2);
    },
    editTP() {
      var data = this.currentTPedit;
      if (confirm("Confirm Edit?")) {
        axios
          .post("http://localhost/tpUpdate.php", JSON.stringify(data))
          .then((res) => {
            console.log("Update TP: " + res.data);
            this.fetchTPList(this.currentTPedit.id_cml);
            this.closePopup(2);
          });
      }
    },
    addTNbtn() {
      if (this.currentTNadd.id_testpoint) {
        this.isAdd = true;
        this.openPopup(3);
      } else alert("No Test Point selected. Please select one");
    },
    addTN() {
      var data = this.currentTNadd;
      if (confirm("Confirm Add?")) {
        axios
          .post("http://localhost/tnAdd.php", JSON.stringify(data))
          .then((res) => {
            console.log("Add TN: " + res.data);
            this.fetchTNList(this.currentTNadd.id_testpoint);
            this.closePopup(3);
          });
      }
    },
    editTNbtn(id) {
      this.isEdit = true;
      this.isAdd = false;
      axios.get("http://localhost/tnView.php?id=" + id).then((res) => {
        console.log("View TP: " + res.statusText);
        this.currentTNedit = res.data[0];
      });
      this.openPopup(3);
    },
    editTN() {
      var data = this.currentTNedit;
      if (confirm("Confirm Edit?")) {
        axios
          .post("http://localhost/tnUpdate.php", JSON.stringify(data))
          .then((res) => {
            console.log("Update TN: " + res.data);
            this.fetchTNList(this.currentTNedit.id_testpoint);
            this.closePopup(3);
          });
      }
    },
    deleteCML(id) {
      if (confirm("Confirm Delete?")) {
        if (id) {
          axios.get("http://localhost/cmlDelete.php?id=" + id).then((res) => {
            console.log("Delete CML: " + res.statusText);
            this.fetchCMLList();
          });
        }
      }
    },
    deleteTP(id) {
      if (confirm("Confirm Delete?")) {
        if (id) {
          axios.get("http://localhost/tpDelete.php?id=" + id).then((res) => {
            console.log("Delete TP: " + res.statusText);
            this.fetchTPList(this.currentTPadd.id_cml);
          });
        }
      }
    },
    deleteTN(id) {
      if (confirm("Confirm Delete?")) {
        if (id) {
          axios.get("http://localhost/tnDelete.php?id=" + id).then((res) => {
            console.log("Delete TN: " + res.statusText);
            this.fetchTNList(this.currentTNadd.id_testpoint);
          });
        }
      }
    },
    backHome() {
      this.$router.push({ path: "/" });
    },
  },
};
</script>

<style lang="scss" scoped>
.line-number {
  text-align: right;
}
.form-grid {
  grid-template-columns: 100% !important;
  div {
    justify-content: center !important;
  }
}
</style>