<template>
  <div id="hero" class="hero is-fullheight">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
    <div class="hero-head">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item" @click="$router.push('/');">
            <img src="http://localhost:3000/img/RMTS.png" width="112" height="28">
          </a>
        </div>
      </nav>
    </div>
    <div class="hero-foot">
      <div id="page-name" class="container p-1">
        <p style="color: white; font-size: 6vw; font-weight: bold;">แผนผังการเดินรถไฟ</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-5 pb-1">
          <div class="columns m-0 is-centered">
            <div class="column is-3">
              <div class="button button-custom is-medium is-fullwidth is-multiline font-button" @click="$router.push('/arl_map');">
                <span><img src="http://localhost:3000/img/train1.svg" width="300" height="28"></span>
                <span>รถไฟฟ้าเชื่อมท่าอากาศยาน (ARL)</span>
              </div>
            </div>
            <div class="column is-3">
              <div class="button button-custom is-medium is-fullwidth is-multiline font-button" @click="$router.push('/bts_map');">
                <span><img src="http://localhost:3000/img/train2.svg" width="300" height="28"></span>
                <span>รถไฟฟ้าบีทีเอส (BTS)</span>
              </div>
            </div>
          </div>
          <div class="columns m-0 is-centered">
            <div class="column is-3">
              <div class="button button-custom is-medium is-fullwidth is-multiline font-button" @click="$router.push('/mrt_map');">
                <span><img src="http://localhost:3000/img/train3.svg" width="300" height="28"></span>
                <span>รถไฟฟ้ามหานคร (MRT)</span>
              </div>
            </div>
            <div class="column is-3">
              <div class="button button-custom is-medium is-fullwidth is-multiline font-button" @click="$router.push('/srt_map');">
                <span><img src="http://localhost:3000/img/train4.svg" width="300" height="28"></span>
                <span>รถไฟไทย (SRT)</span>
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
  background: url('http://localhost:3000/img/background.svg') no-repeat center center fixed;
  background-size: cover;
  height: 100%;
  overflow: hidden;
  font-family: 'Kanit', sans-serif;
}

.button-custom {
  background: #ECF0F3;
  box-shadow: -10px -10px 22px #FFFFFF, 10px 10px 22px #D1D9E6;
  border-radius: 42px;
  font-family: 'Kanit', sans-serif;

  height: 150px;
}
.font-button{
  font-family: 'Kanit', sans-serif;
  font-weight: bold;

}

.has-background-custom {
  background: #ECF0F3;
}

.is-multiline {
  min-height: 2.25em;
  white-space: unset;
  flex-direction: column;
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