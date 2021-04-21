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
    <div class="hero-foot">
      <div class="container">
        <p style="color: white; font-size: 60px; font-weight: bold;">แผนผังการเดิน BTS</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 pb-3 has-text-centered" style="height: 500px">
          <div class="columns p-5"> 
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #333333;" @click="route = 1">รวม</button>
            </div>
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #76AD2D;" @click="route = 2">สายสุขุมวิท</button>
            </div>
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #147976;">สายสีลม</button>
            </div>
            <div class="column">
              <button class="button button-custom is-fullwidth" style="background: #A38607;">สายสีทอง</button>
            </div>
          </div>
          <img v-if="route == 1" src="../assets/ARL.png">
          <img v-if="route == 2" src="">
          <img v-if="route == 3" src="">
          <img v-if="route == 4" src="">
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
  background: url('../assets/BTSbackground.svg') no-repeat center center fixed;
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

.is-multiline {
  min-height: 2.25em;
  white-space: unset;
  flex-direction: column;
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