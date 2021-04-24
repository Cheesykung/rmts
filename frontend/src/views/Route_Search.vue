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
      <div class="container">
        <p style="color: white; font-size: 10vh; font-weight: bold;">ค้นหาเส้นทาง</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 p-5">
          <div class="columns is-centered">
            <div class="column is-4">
              <div class="field">
                <div class="is-large">
                  <label class="label universal">ต้นทาง</label>
                </div>
                <div class="field-body">
                  <div class="field">
                    <div class="control">
                      <input class="input is-large" type="text" placeholder="โปรดระบุ">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="column is-4">
              <div class="field">
                <div class="is-large">
                  <label class="label universal">ปลายทาง</label>
                </div>
                <div class="field-body">
                  <div class="field">
                    <div class="control">
                      <input class="input is-large" type="text" placeholder="โปรดระบุ">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="columns is-centered">
            <div class="column is-4">
              <label class="label universal">วันเดินทาง</label>
              <input class="input is-large" type="date">
            </div>
            <div class="column is-4"></div>
          </div>
          <div class="has-text-centered">
            <div class="button button-custom ">ค้นหาเส้นทาง</div>
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
  
  width: 342px;
  height: 90px;
}
.universal {
  font-size: 20px;
  font-family: 'Kanit', sans-serif;
}

.has-background-custom {
  background: #ECF0F3;
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