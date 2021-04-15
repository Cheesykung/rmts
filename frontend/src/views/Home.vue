<template>
  <div id="hero" class="hero is-fullheight">
    <nav class="navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="https://bulma.io">
          <img src="./image/RMTSNeon.png" width="112" height="28">
        </a>
      </div>
    </nav>
    <div class="has-background-custom" style="border-radius: 50px 0px 0px 0px; bottom: 0;">
      <div class="container pt-4 pb-4">
        <div class="columns m-0 p-6 has-text-centered">
          <div class="column is-3 is-offset-3">
            <button class="button is-large is-fullwidth">ค้นหาเส้นทาง</button>
          </div>
          <div class="column is-3">
            <button class="button is-large is-fullwidth">ดูแผนผังทางเดินรถ</button>
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
}

.button {
  background: #ECF0F3;
  box-shadow: -18px -18px 30px #FFFFFF, 18px 18px 30px #D1D9E6;
  border-radius: 77px;
}

.has-background-custom {
  background: #ECF0F3;
}
</style>