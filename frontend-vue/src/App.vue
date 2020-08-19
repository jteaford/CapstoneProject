<template>
  <div id="app">
    <nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="https://bulma.io">
      <img src="./assets/Cleveland-Custom-Carpentry-Logo-Reverse-02.png">
    </a>

    <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <router-link class="navbar-item" to="/">Home</router-link>

      <router-link class="navbar-item" to="/ledger">Business Ledger</router-link>

      <router-link class="navbar-item" to="/clients">Clients</router-link> 

      <router-link class="navbar-item" to="/projects">Projects</router-link>

      <router-link class="navbar-item" to="/expenses">Expenses</router-link>

      <router-link class="navbar-item" to="/revenues">Revenues</router-link>

      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          More
        </a>

        <div class="navbar-dropdown">
          <router-link class="navbar-item" to="/wood">Wood Inventory</router-link>

          <router-link class="navbar-item" to="/shoppinglist">Shopping List</router-link>
          
        </div>
      </div>
    </div>

    

    <div class="navbar-end">
      <div class="navbar-item"><router-link class="button is-primary" to="/timeclock">Time Clock</router-link></div>
      <div class="navbar-item"><router-link to="/userprofile"><font-awesome-icon :icon="['fas', 'user']"/></router-link></div>
      <div class="navbar-item"><router-link to="/settings"><font-awesome-icon :icon="['fas', 'cog']"/></router-link></div>
    </div>
  </div>
</nav>
    
    <div class="container">
    <router-view/>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
}

#nav {
  
  display: flex;
  background-color: black; 
  margin-bottom: 10vh;
}

#nav a, i{
  font-weight: lighter;
  color: white;
  padding-right: 3vw;
}

#nav a.router-link-exact-active {
  color: #666666;
}

#nav-icons {
  display: flex;
  justify-content: flex-end;
}

nav.navbar {
  background-color: black;
  padding: 30px 30px 30px 50px;
  margin-bottom: 50px;
}

a.navbar-item:focus, a.navbar-item:focus-within, a.navbar-item:hover, a.navbar-item.is-active, .navbar-link:focus, .navbar-link:focus-within, .navbar-link:hover, .navbar-link.is-active {
    background-color: black;
    color: white
}

@media screen and (min-width: 1024px) {
  .navbar-item.has-dropdown:focus .navbar-link, .navbar-item.has-dropdown:hover .navbar-link, .navbar-item.has-dropdown.is-active .navbar-link {
    background-color: black;
    color: white;
  }
}

@media screen and (min-width: 1024px){
  .navbar-dropdown {
    background-color: black;
    color: white;
  }
}

@media screen and (min-width: 1024px){
  .navbar-dropdown a.navbar-item:focus, .navbar-dropdown a.navbar-item:hover {
    background-color: black;
    color: white;
  }
}

.navbar-link:not(.is-arrowless)::after {
  border-color: #666666;
}

.button.is-primary {
  background-color: #666666;
}

.button.is-primary:hover, .button.is-primary.is-hovered {
  background-color: #999999;
}

.navbar-end a {
  color: whitesmoke;
}
</style>
