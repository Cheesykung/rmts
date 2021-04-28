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
    <div class="hero-foot"  style="margin-top: 8%">
      <div id="page-name" class="container p-1">
        <p style="color: white; font-size: 5vw; font-weight: bold;">แผนผังการเดิน ARL</p>
      </div>
      <div class="has-background-custom pb-5" style="border-radius: 50px 0px 0px 0px;">
        <div class="container p-1 has-text-centered">
          <img src="../assets/ARL01.svg" style="padding-top: 2.5%">
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
  background: url('../assets/ARLbackground.svg') no-repeat center center fixed;
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

  width: 413px;
  height: 150px;
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
      loginPage: false
    };
  },
  created() {
    document.title = this.$route.meta.title;
  }
}
</script>