<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> 
      <router-link to="/ledger">Business Ledger</router-link>
      <router-link to="/clients">Clients</router-link> 
      <router-link to="/projects">Projects</router-link>
      <router-link to="/expenses">Expense</router-link>
      <router-link to="/revenue">Revenue</router-link>
      <router-link to="/wood">Wood Inventory</router-link>
      <router-link to="/timeclock">Time Clock</router-link>
      <router-link to="/shoppinglist">Shopping List</router-link>
      
      <div id="nav-icons">
      <router-link to="/userprofile"><i class="fas fa-user"></i></router-link>
      <router-link to="/settings"><i class="fas fa-cog"></i></router-link>
      </div>
    
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
 
</style>
