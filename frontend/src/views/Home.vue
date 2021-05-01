<template>
  <div id="hero" class="hero is-fullheight">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,700;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Montserrat:ital,wght@0,700;1,900&display=swap" rel="stylesheet">
    <div class="hero-head">
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item">
            <img src="http://localhost:3000/img/RMTS.png" width="112" height="28" @click="$router.push('/home');">
          </a>
        </div>
      </nav>
    </div>
    <div class="hero-body m-0 p-0">
      <div class="container has-text-centered">
        <img src="http://localhost:3000/img/RMTSlogo.png" width="600">
      </div>
    </div>
    <div class="hero-foot has-text-centered">>
      <div class="has-background-custom" style="border-radius: 50px 0px 0px 0px;">
        <div class="container pt-3 pb-3">
          <div class="columns m-0 p-6 has-text-centered">
            <div class="column is-3 is-offset-3">
              <div class="button button-custom is-large is-fullwidth font-button" @click="$router.push('/route_search');">ค้นหาเส้นทาง</div>
            </div>
            <div class="column is-3">
              <div class="button button-custom is-large is-fullwidth font-button" @click="$router.push('/map_select');">ดูแผนผังทางเดินรถ</div>
            </div>
          </div>
        </div>
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

.fontadmin{
  font-family: 'Montserrat', sans-serif;
  font-style: italic;
  background: linear-gradient(85.2deg, #505EE0 4.87%, #48C5B5 95.68%);
  background-clip: text;
  -webkit-text-fill-color: transparent;
}

.fontunversal{
  font-family: 'Montserrat', sans-serif;
  font-style: bold;
  font-size: 24;
}

.font-button{
  font-family: 'Kanit', sans-serif;
  font-weight: bold;

}
input {
  border: 0;
  outline: 0;
  background: transparent;
  border-bottom: 3px solid #505EE0;
}
</style>

<script>
export default {
  data() {
    return {
      loginPage: false,
      email: "",
      password: ""
    };
  },
  created() {
    document.title = this.$route.meta.title;
  },
}
</script>


