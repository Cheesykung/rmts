<template>
  <div id="hero" class="hero is-fullheight">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">

    <div class="hero-head">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item">
            <img src="./image/RMTS.png" width="112" height="28" @click="$router.push('/home');">
          </a>
        </div>
      </nav>
    </div>
    <div class="hero-foot">
      <div id="page-name" class="container p-1">
        <p style="color: white; font-size: 5vw; font-weight: bold;">ค้นหาเส้นทาง</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 p-5">
          <div class="columns is-centered mb-0">
            <div class="column is-4">
              <p class="form-font">ต้นทาง</p>
              <div class="field has-addons">
                <div class="control">
                  <div class="select is-medium">
                    <select v-model="start_type">
                      <option value="ARL">ARL</option>
                      <option value="BTS">BTS</option>
                      <option value="MRT">MRT</option>
                      <option value="SRT">SRT</option>
                    </select>
                  </div>
                </div>
                <div class="control is-expanded">
                  <div class="select is-fullwidth is-medium">
                    <select v-model="$v.start.$model">
                      <option v-for="(station,index) in startStationList" :key="index" :value="station.station_name">
                        {{ station.station_name }}
                      </option>
                    </select>
                  </div>
                  <template v-if="$v.start.$error">
                    <p class="help is-danger" v-if="!$v.start.required">กรุณากรอกข้อมูล</p>
                  </template>
                </div>
              </div>
            </div>
            <div class="column is-4">
              <p class="form-font">ปลายทาง</p>
              <div class="field has-addons">
                <div class="control">
                  <div class="select is-medium">
                    <select v-model="des_type">
                      <option value="ARL">ARL</option>
                      <option value="BTS">BTS</option>
                      <option value="MRT">MRT</option>
                      <option value="SRT">SRT</option>
                    </select>
                  </div>
                </div>
                <div class="control is-expanded">
                  <div class="select is-fullwidth is-medium">
                    <select v-model="des">
                      <option v-for="(station,index) in desStationList" :key="index" :value="station.station_name">
                        {{ station.station_name }}
                      </option>
                    </select>
                  </div>
                  <template v-if="$v.des.$error">
                    <p class="help is-danger" v-if="!$v.des.required">กรุณากรอกข้อมูล</p>
                  </template>
                </div>
              </div>
            </div>
          </div>
          <!-- <div class="columns is-centered mt-0">
            <div class="column is-4">
              <p class="form-font">วันเดินทาง</p>
              <div class="field has-addons">
                <div class="control is-expanded">
                  <div class="is-fullwidth">
                    <input class="input is-medium" type="date">
                  </div>
                </div>
              </div>
            </div>
            <div class="column is-4"></div>
          </div> -->
          <div v-if="error" class="columns is-centered mt-0">
            <div class="column is-4 has-text-centered">
              <div class="box has-background-danger">
                <p style="color: white; font-size: 24px">ไม่มีเส้นทางที่เชื่อมต่อกัน</p>
              </div>
            </div>
          </div>
          <div class="has-text-centered p-5">
            <div class="button button-custom" @click="route_search();">ค้นหาเส้นทาง</div>
          </div>
        </div>
      </div>
      <div class="has-background-dark has-text-centered p-3">
        <p style="color: white">Copyright © 2021 Railway Mass Transit System</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
#hero {
  background: url('../assets/background.svg') no-repeat center center fixed;
  background-size: cover;
  height: 100%;
  overflow: hidden;
  font-family: 'Kanit', sans-serif;
}

.button-custom {
  background: linear-gradient(87.58deg, #505EE0 0%, #48C5B5 99.48%);
  box-shadow: 18px 18px 30px #D1D9E6, -18px -18px 30px #FFFFFF;
  border-radius: 160px;
  color: white;
  padding: 30px;
  font-size: 25px;
  font-family: 'Kanit', sans-serif;
  font-weight: 500;
  
  width: 330px;
  height: 90px;
}
.universal {
  font-size: 20px;
  font-family: 'Kanit', sans-serif;
}

.has-background-custom {
  background: #ECF0F3;
}

.form-font {
  font-size: 24px;
  padding: 1%;
  font-family: 'Kanit', sans-serif;
  font-weight: bold;
}

@media screen and (max-width: 768px) {
  #page-name {
    text-align: center;
  }
}

select {
  font-family: 'Kanit', sans-serif;
}
</style>

<script>
import axios from "axios";
import { required } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
      stations: [],
      possible_routes: [],
      start: "",
      start_type: "ARL",
      des: "",
      des_type: "ARL",
      error: null
    };
  },
  created() {
    document.title = this.$route.meta.title;
    axios
    .get(`http://localhost:3000/stations`)
    .then((response) => {
      this.stations = response.data.stations
      console.log(response.data.stations)
    })
    .catch((error) => {
      this.error = error
      console.log(this.error)
    })
  },
  methods: {
    route_search() {
      this.$v.$touch();
      if(!this.$v.$invalid) {
        axios
        .get(`http://localhost:3000/search`, {
          params: {
            start: this.start,
            start_type: this.start_type,
            des: this.des,
            des_type: this.des_type,
          }
        })
        .then((response) => {
          this.possible_routes = response.data.routes;
          console.log(this.possible_routes)
          this.$router.push({
            name: 'route_result',
            params: { 
              routes: this.possible_routes,
              start: this.start,
              start_type: this.start_type,
              des: this.des,
              des_type: this.des_type,
            }
          });
        })
        .catch((error) => {
          this.error = error;
          console.log(this.error)
        });
      }
    },
  },

  validations: {
    start: {
      required
    },
    des: {
      required
    }
  },

  computed: {
    startStationList() {
      return this.stations.filter(data => {
        return data.type == this.start_type
      })
    },
    desStationList() {
      return this.stations.filter(data => {
        return data.type == this.des_type
      })
    }
  }
}
</script>