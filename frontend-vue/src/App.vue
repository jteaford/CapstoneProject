<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> <span>|</span>
      <router-link to="/clients">Clients</router-link> <span>|</span>
      <router-link to="/projects">Projects</router-link> <span>|</span>
      <router-link to="/ledger">Business Ledger</router-link>
    </div>
    <div class="container">
    <router-view/>
    </div>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
}

#nav {
  padding: 30px 30px 30px 100px;
  display: flex;
  background-color: black; 
  margin-bottom: 10vh;
}

#nav a {
  font-weight: lighter;
  color: white;
  padding-right: 5vw;
}

#nav span {
  padding-right: 5vw;
  color: white;
}

#nav a.router-link-exact-active {
  color: #666666;
}

 
</style>
