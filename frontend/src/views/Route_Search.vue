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
        <p style="color: white; font-size: 6vw; font-weight: bold;">ค้นหาเส้นทาง</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 p-5">
          <div class="columns is-centered mb-0">
            <div class="column is-4">
              <p class="form-font">ต้นทาง</p>
              <div class="field has-addons">
                <div class="control">
                  <div class="select is-medium">
                    <select name="">
                      <option value="Argentina">ARL</option>
                      <option value="Argentina">BTS</option>
                      <option value="Argentina">MRT</option>
                      <option value="Argentina">SRT</option>
                    </select>
                  </div>
                </div>
                <div class="control is-expanded">
                  <div class="select is-fullwidth is-medium">
                    <select name="">
                      <option value="Argentina">ARL</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="column is-4">
              <p class="form-font">ปลายทาง</p>
              <div class="field has-addons">
                <div class="control">
                  <div class="select is-medium">
                    <select name="">
                      <option value="Argentina">ARL</option>
                      <option value="Argentina">BTS</option>
                      <option value="Argentina">MRT</option>
                      <option value="Argentina">SRT</option>
                    </select>
                  </div>
                </div>
                <div class="control is-expanded">
                  <div class="select is-fullwidth is-medium">
                    <select name="">
                      <option value="Argentina">ARL</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="columns is-centered mt-0">
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
          </div>
          <div class="has-text-centered p-5">
            <div class="button button-custom">ค้นหาเส้นทาง</div>
          </div>
        </div>
      </div>
      <div class="has-background-dark has-text-centered p-3">
        <p style="color: white">Copyright © 2020 Sephora Digital SEA Pte Ltd</p>
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
  font-size: 21px;
  padding: 1%;
}

@media screen and (max-width: 768px) {
  #page-name {
    text-align: center;
  }
}
</style>

<script>
export default {
  data() {
    return {
      loginPage: false
    };
  },
  created() {
    document.title = this.$route.meta.title;
  },
}
</script>