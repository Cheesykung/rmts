<template>
  <div id="hero" class="hero is-fullheight">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">

    <div class="columns is-gapless">
      <div class="column is-3 login-page has-background-white" v-if="loginPage == true" name="move">
        <div id="login" class="container p-5">
          <div class="has-text-centered">
            <p style="font-weight: 900; font-size: 45px;">ONLY ADMIN</p>
          </div >
          <div class="mt-3">
            <label style="font-weight: bold; font-size: 24px; line-height: 29px;" for="email">Email</label>
            <input type="text" class="input">
          </div>
          <div class="mt-3">
            <label style="font-weight: bold; font-size: 24px; line-height: 29px;" for="password">Password</label>
            <input type="text" class="input">
          </div>
          <div class="has-text-centered mt-6">
            <button id="login-button" class="button is-large is-fullwidth">LOG IN</button>
          </div>
        </div>
      </div>
      
      <div class="column main-page" :class="{'is-9':loginPage}">
        <nav class="navbar" role="navigation" aria-label="main navigation">
          <div class="navbar-brand">
            <a class="navbar-item">
              <img src="./image/RMTS.png" width="112" height="28" @click="$router.push('/home');">
            </a>
          </div>
          <div class="navbar-end">
          <div class="navbar-item">
            <div>
              <button class="button" @click="loginPage = !loginPage"><strong>Login</strong></button>
              </div>
            </div>
          </div>
        </nav>
        <div class="has-text-centered">
          <img src="../assets/RMTSlogo.png" width="632">
        </div>
        <div class="has-background-custom" style="border-radius: 50px 0px 0px 0px;">
          <div class="container pt-3 pb-3">
            <div class="columns m-0 p-6 has-text-centered">
              <div class="column is-3 is-offset-3">
                <div class="button button-custom is-large is-fullwidth">ค้นหาเส้นทาง</div>
              </div>
              <div class="column is-3">
                <div class="button button-custom is-large is-fullwidth" @click="$router.push('/map_select');">ดูแผนผังทางเดินรถ</div>
              </div>
            </div>
          </div>
        </div>
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
  background: #ECF0F3;
  box-shadow: -10px -10px 22px #FFFFFF, 10px 10px 22px #D1D9E6;
  border-radius: 77px;
  font-family: 'Kanit', sans-serif;
  flex-direction: column;
  white-space: unset;

  height: 100px;
}

.has-background-custom {
  background: #ECF0F3;
}

#login {
  top: 20%;
}

#login-button {
  background: linear-gradient(87.58deg, #505EE0 0%, #48C5B5 99.48%);
  box-shadow: 15px 15px 30px #D1D9E6, -15px -15px 30px #FFFFFF;
  border-radius: 160px;
  color: white;
  font-family: 'Kanit', sans-serif;
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


