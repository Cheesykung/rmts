<template>
  <div id="hero" class="hero is-fullheight">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
    <div class="hero-head">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item">
            <img src="./image/RMTS.png" width="112" height="28">
          </a>
        </div>
      </nav>
    </div>
    <div class="hero-foot" style="margin-top: 8%">
      <div class="container">
        <p style="color: white; font-size: 60px; font-weight: bold;">แผนผังการเดิน MRT</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 pb-3 has-text-centered">
          <div class="columns p-5"> 
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #333333;" @click="route = 1">รวม</button>
            </div>
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #1D398D;" @click="route = 2">สายเฉลิมรัชมงคล</button>
            </div>
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #5C2C90;" @click="route = 3">สายฉลองรัชธรรม</button>
            </div>
          </div>
          <img v-if="route == 1" src="../assets/ARL.png">
          <img v-if="route == 2" src="../assets/background.svg">
          <img v-if="route == 3" src="../assets/background.svg">
        </div>
      </div>
      <div class="has-background-dark has-text-centered p-3">
        <p style="color: white">Copyright © 2020 Sephora Digital SEA Pte Ltd</p>
      </div>
    </div>
  </div>
</template>

<style>
#hero {
  background: url('../assets/MRTbackground.svg') no-repeat center center fixed;
  background-size: cover;
  height: 100%;
  overflow: hidden;
  font-family: 'Kanit', sans-serif;
}

.button-custom {
  border-radius: 42px;
  font-family: 'Kanit', sans-serif;
  font-size: 25px;
  color: white;

  width: 309.28px;
  height: 52.46px;
}

.button-custom:hover, .button-custom:focus {
  transition: 0.1s;
  font-size: 27px;
  color: white;
}

.has-background-custom {
  background: #ECF0F3;
}
</style>

<script>
export default {
  data() {
    return {
      route: 1
    };
  },
}
</script>