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
    <div class="hero-foot" style="margin-top: 5%">
      <div id="page-name" class="container p-1">
        <p style="color: white; font-size: 5vw; font-weight: bold;">เส้นทางที่สามารถไปได้</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 p-5">
          <div class="columns is-centered mb-0">
            <div class="column is-4">
              <p class="form-font">ต้นทาง</p>
              <div class="field has-addons">
                <div class="control">
                  <div class="button is-medium is-static">{{ start_type }}</div>
                </div>
                <div class="control is-expanded">
                  <div class="button is-fullwidth is-medium is-static">{{ start }}</div>
                </div>
              </div>
            </div>
            <div class="column is-4">
              <p class="form-font">ปลายทาง</p>
              <div class="field has-addons">
                <div class="control">
                  <div class="button is-medium is-static">{{ des_type }}</div>
                </div>
                <div class="control is-expanded">
                  <div class="button is-fullwidth is-medium is-static">{{ des }}</div>
                </div>
              </div>
            </div>
          </div>
          <div class="columns is-centered mt-0">
            <div class="column is-7 form-font">
              <div v-for="(route,index) in routes" :key="index">
                <div class="columns has-background-white m-1">
                  <div class="column is-5 has-text-centered">
                    <span>
                      <p>เส้นทางที่ {{ index + 1 }}</p>
                      <a @click="RouteDisplay(index)">แสดง</a>
                    </span>
                  </div>
                  <div class="column is-4 has-text-centered">
                    <p>รวม {{ route.total_time }} นาที</p>
                    <p id="transit-font">{{ route.total_transit }} จุดเปลี่ยนเส้นทาง</p>
                  </div>
                  <div class="column is-3 has-text-centered" style="color: #505EE0">
                    <p>รวม {{ route.total_cost }} บาท</p>
                  </div>
                </div>
                <template v-if="route_display.includes(index)">
                  <div class="columns has-background-white m-1" v-for="(path,index) in route.fullpath" :key="index">
                    <div class="column is-5 has-text-centered">
                      <span>
                        <p>{{ path.name }}</p>
                        <p>{{ path.type }}</p>
                      </span>
                    </div>
                    <div class="column is-4 has-text-centered">
                      <p id="transit-font">เวลาโดยประมาณ</p>
                      <p>~ {{ path.time }} นาที</p>
                    </div>
                  </div>
                </template>
              </div>
            </div>
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

.has-background-custom {
  background: #ECF0F3;
}

.form-font {
  font-size: 20px;
  padding: 1%;
  font-family: 'Kanit', sans-serif;
  font-weight: bold;
}

#transit-font {
  font-size: 14px; 
  font-weight: 600; 
  color: #B3B7BC;
}

.is-static {
  opacity: 1; 
  background-color: white; 
  color: black
}

@media screen and (max-width: 768px) {
  #page-name {
    text-align: center;
  }
}
</style>

<script>
export default {
  name: "route_result",
  data() {
    return {
      routes: [],
      route_display: [],
      start: "",
      start_type: "",
      des: "",
      des_type: "",
    };
  },
  created() {
    document.title = this.$route.meta.title;
    this.routes = this.$route.params.routes
    this.start = this.$route.params.start,
    this.start_type = this.$route.params.start_type,
    this.des = this.$route.params.des,
    this.des_type = this.$route.params.des_type
  },
  methods: {
    RouteDisplay(index) {
      if(this.route_display.includes(index)) {
        const temp = this.route_display.indexOf(index)
        this.route_display.splice(temp, 1)
      }
      else {
        this.route_display.push(index)
      }
    }
  }
  /*computed: {
    PathLength() {
      return this.fullpath.length
    },
    Route() {
      return this.fullpath.slice(1, this.PathLength-1)
    },
    TotalTime() {
      let time = 0
      this.fullpath.map(item => {
        time += item.time
      })
      return time
    }
  }*/
}
</script>

