<template>
  <div id="hero" class="hero is-fullheight">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
    <div class="hero-head">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item">
            <img src="http://localhost:3000/img/RMTS.png" width="112" height="28" @click="$router.push('/');">
          </a>
        </div>
      </nav>
    </div>
    <div class="hero-foot" style="margin-top: 8%">
      <div id="page-name" class="container p-1">
        <p style="color: white; font-size: 5vw; font-weight: bold;">แผนผังการเดิน BTS</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container p-1 has-text-centered">
          <div class="columns is-centered pt-5 pr-5 pl-5"> 
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #333333;" @click="route = 1">รวม</button>
            </div>
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #3E3EEA;" @click="route = 2">สายเหนือ</button>
            </div>
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #299629;" @click="route = 3">สายตะวันออกเฉียงเหนือ</button>
            </div>
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #FFC700;" @click="route = 4">สายใต้</button>
            </div>
          </div>
          <div class="columns is-centered pb-5 pr-5 pl-5"> 
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #800080;" @click="route = 5">สายตะวันออก</button>
            </div>
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #E0159B;" @click="route = 6">สายวงเวียนใหญ่ - มหาชัย</button>
            </div>
            <div class="column is-3">
              <button class="button button-custom is-fullwidth" style="background: #2BABFF;" @click="route = 7">สายบ้านแหลม - เขตเมือง</button>
            </div>
          </div>
          <img v-if="route == 1" src="../assets/ARL.png">
          <img v-if="route == 2" src="../assets/background.svg">
          <img v-if="route == 3" src="">
          <img v-if="route == 4" src="">
          <img v-if="route == 5" src="../assets/ARL.png">
          <img v-if="route == 6" src="../assets/background.svg">
          <img v-if="route == 7" src="">
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
  background: url('http://localhost:3000/img/SRTbackground.svg') no-repeat center center fixed;
  background-size: cover;
  height: 100%;
  overflow: hidden;
  font-family: 'Kanit', sans-serif;
}

.button-custom {
  border-radius: 42px;
  font-family: 'Kanit', sans-serif;
  font-size: 22px;
  color: white;

  height: 52.46px;
}

.button-custom:hover, .button-custom:focus {
  transition: 0.3s;
  font-size: 23px;
  color: white;
}

.has-background-custom {
  background: #ECF0F3;
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
      route: 1
    };
  },
  created() {
    document.title = this.$route.meta.title;
  }
}
</script>