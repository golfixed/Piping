<template>
  <div>
    <div class="page">
      <div class="page-title">
        <h1>Piping</h1>
      </div>
      <div class="page-toolbar">
        <div class="btn-tool">
          <button class="toptool" v-on:click="fetchPipeList()">Refresh</button>
        </div>
        <div></div>
      </div>
      <div class="page-content">
        <table>
          <tr>
            <th colspan="8">
              <div class="table-header">
                <h2>PIPE LINE LIST</h2>
                <div class="intable-btn">
                  <button class="top-btn" v-on:click="addBtn()">
                    Add Piping
                  </button>
                </div>
              </div>
            </th>
          </tr>
          <tr>
            <th>Line Number</th>
            <th>Location</th>
            <th>From</th>
            <th>To</th>
            <th>Pipe Size (inch)</th>
            <th>Service</th>
            <th>Material</th>
            <th></th>
          </tr>
          <tr v-for="item in pipeList" :key="item.id">
            <td>{{ item.line_number }}</td>
            <td>{{ item.location }}</td>
            <td>{{ item._from }}</td>
            <td>{{ item._to }}</td>
            <td>{{ item.pipe_size }}</td>
            <td>{{ item.service }}</td>
            <td>{{ item.material }}</td>
            <td>
              <div class="intable-btn">
                <button v-on:click="viewBtn(item.id)">info</button>
                <button v-on:click="detailBtn(item.id)">detail</button>
              </div>
            </td>
          </tr>
          <tr v-if="pipeList.length > 0">
            <td colspan="8" class="table-label-end">
              Total <b>{{ pipeList.length }}</b> records
            </td>
          </tr>
          <tr v-if="pipeList.length == 0">
            <td colspan="8" class="table-label-nodata">No Data</td>
          </tr>
        </table>
        <div class="page-end"></div>
      </div>
    </div>
    <div class="popup-wrapper" v-if="isPopup == true">
      <div class="popup-card">
        <div class="title">
          <h2 v-if="isAdd == true">Add New Piping Informations</h2>
          <h2 v-if="isEdit == true">Edit Piping Informations</h2>
          <h2 v-if="isView == true">Piping Informations</h2>
        </div>
        <div class="content">
          <div class="form-grid">
            <div>
              <label>Line number:</label>
              <p v-if="isView == true">{{ currentViewInfo.line_number }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.line_number"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.line_number"
              />
            </div>
            <div>
              <label>Location:</label>
              <p v-if="isView == true">{{ currentViewInfo.location }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.location"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.location"
              />
            </div>
            <div>
              <label>From:</label>
              <p v-if="isView == true">{{ currentViewInfo._from }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo._from"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo._from"
              />
            </div>
            <div>
              <label>To:</label>
              <p v-if="isView == true">{{ currentViewInfo._to }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo._to"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo._to"
              />
            </div>
            <div>
              <label>Drawing number:</label>
              <p v-if="isView == true">{{ currentViewInfo.drawing_number }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.drawing_number"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.drawing_number"
              />
            </div>
            <div>
              <label>Service:</label>
              <p v-if="isView == true">{{ currentViewInfo.service }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.service"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.service"
              />
            </div>
            <div>
              <label>Material:</label>
              <p v-if="isView == true">{{ currentViewInfo.material }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.material"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.material"
              />
            </div>
            <div>
              <label>Inservice Date:</label>
              <p v-if="isView == true">{{ currentViewInfo.inservice_date }}</p>
              <input
                v-if="isEdit == true"
                type="date"
                v-model="currentEditInfo.inservice_date"
              />
              <input
                v-if="isAdd == true"
                type="date"
                v-model="currentAddInfo.inservice_date"
              />
            </div>
            <div>
              <label>Pipe Size:</label>
              <p v-if="isView == true">{{ currentViewInfo.pipe_size }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.pipe_size"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.pipe_size"
              />
            </div>
            <div>
              <label>Original Thickness:</label>
              <p v-if="isView == true">
                {{ currentViewInfo.original_thickness }}
              </p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.original_thickness"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.original_thickness"
              />
            </div>
            <div>
              <label>Stress:</label>
              <p v-if="isView == true">{{ currentViewInfo.stress }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.stress"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.stress"
              />
            </div>
            <div>
              <label>Joint Efficiency:</label>
              <p v-if="isView == true">
                {{ currentViewInfo.joint_efficiency }}
              </p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.joint_efficiency"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.joint_efficiency"
              />
            </div>
            <div>
              <label>ca:</label>
              <p v-if="isView == true">{{ currentViewInfo.ca }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.ca"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.ca"
              />
            </div>
            <div>
              <label>Design Life:</label>
              <p v-if="isView == true">{{ currentViewInfo.design_life }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.design_life"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.design_life"
              />
            </div>
            <div>
              <label>Design pressure:</label>
              <p v-if="isView == true">{{ currentViewInfo.design_pressure }}</p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.design_pressure"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.design_pressure"
              />
            </div>
            <div>
              <label>Operating pressure:</label>
              <p v-if="isView == true">
                {{ currentViewInfo.operating_pressure }}
              </p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.operating_pressure"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.operating_pressure"
              />
            </div>
            <div>
              <label>Design temperature:</label>
              <p v-if="isView == true">
                {{ currentViewInfo.design_temperature }}
              </p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.design_temperature"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.design_temperature"
              />
            </div>
            <div>
              <label>Operating temperature:</label>
              <p v-if="isView == true">
                {{ currentViewInfo.operating_temperature }}
              </p>
              <input
                v-if="isEdit == true"
                type="text"
                v-model="currentEditInfo.operating_temperature"
              />
              <input
                v-if="isAdd == true"
                type="text"
                v-model="currentAddInfo.operating_temperature"
              />
            </div>
          </div>
        </div>
        <div class="toolbar">
          <div class="btn-tool">
            <div>
              <button
                v-if="isView == true"
                v-on:click="deleteInfo(currentViewInfo.id)"
              >
                delete
              </button>
            </div>
            <div>
              <button v-on:click="addInfo()" v-if="isAdd == true">add</button>
              <button v-on:click="editBtn()" v-if="isView == true">edit</button>
              <button v-on:click="editInfo()" v-if="isEdit == true">
                save edit
              </button>
              <button v-on:click="togglePopup(false)">cancel</button>
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
  name: "PageInfo",
  created() {
    this.fetchPipeList();
  },
  data() {
    return {
      isPopup: false,
      isAdd: false,
      isEdit: false,
      isView: false,
      pipeList: [],
      currentEditInfo: {},
      currentViewInfo: {},
      currentAddInfo: {
        id: "",
        line_number: "",
        location: "",
        _from: "",
        _to: "",
        drawing_number: "",
        service: "",
        material: "",
        inservice_date: "",
        pipe_size: "",
        original_thickness: "",
        stress: "",
        joint_efficiency: "",
        ca: "",
        design_life: "",
        design_pressure: "",
        operating_pressure: "",
        design_temperature: "",
        operating_temperature: "",
      },
    };
  },
  methods: {
    fetchPipeList() {
      axios.get("http://localhost/infoList.php").then((res) => {
        console.log("Fetch Pipe List  Status: " + res.statusText);
        if (res.status == 200) {
          if (res.data.length > 0) {
            console.log(res.data);
            this.pipeList = res.data;
          } else console.log("data not found!");
        }
      });
    },
    resetPopup() {
      this.isAdd = false;
      this.isView = false;
      this.isEdit = false;
      this.currentViewInfo = {};
      this.currentEditInfo = {};
    },
    clearForm(opt) {
      if (opt == 1) {
        var self = this;
        Object.keys(this.currentAddInfo).forEach(function (key) {
          self.currentAddInfo[key] = "";
        });
      }
    },
    togglePopup(cmd) {
      if (cmd == true) {
        this.isPopup = true;
      } else {
        this.isPopup = false;
        this.fetchPipeList();
        this.resetPopup();
      }
    },
    addBtn() {
      this.togglePopup(true);
      this.isAdd = true;
    },
    viewBtn(id) {
      axios.get("http://localhost/infoView.php?id=" + id).then((res) => {
        console.log("View Pipe Info: " + res.statusText);
        this.currentViewInfo = res.data[0];
        this.isView = true;
        this.togglePopup(true);
      });
    },
    editBtn() {
      this.isView = false;
      this.isEdit = true;
      this.currentEditInfo = this.currentViewInfo;
    },
    detailBtn(id) {
      this.$store.commit("GET_ITEM_ID", id);
      this.$router.push({ path: "/detail" });
    },
    addInfo() {
      var data = this.currentAddInfo;
      if (this.currentAddInfo.line_number) {
        if (confirm("Confirm Add?")) {
          axios
            .post("http://localhost/infoAdd.php", JSON.stringify(data))
            .then((res) => {
              console.log(res);
              //   console.log("Add Pipe Info: " + res.data);
              this.clearForm(1);
              this.togglePopup(false);
              this.fetchPipeList();
            });
        }
      } else alert("Line number cannot be empty");
    },
    editInfo() {
      var data = this.currentEditInfo;
      if (confirm("Confirm Edit?")) {
        axios
          .post("http://localhost/infoUpdate.php", JSON.stringify(data))
          .then((res) => {
            console.log("Update Pipe Info: " + res.data);
            this.viewBtn(data.id);
            this.isEdit = false;
            this.isView = true;
          });
      }
    },
    deleteInfo(id) {
      if (confirm("Confirm Delete?")) {
        axios.get("http://localhost/infoDelete.php?id=" + id).then((res) => {
          console.log("Delete Pipe Info: " + res.data);
          this.togglePopup(false);
          this.fetchPipeList();
        });
      }
    },
  },
};
</script>

<style lang="scss" scoped>
</style>