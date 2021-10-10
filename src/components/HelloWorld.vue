<template>
  <div class="hello">
    <div class="demo">
      <p>{{ msg }}</p>
      <button v-on:click="getWeatherForecast">Get WeatherForecast</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: null
    }
  },
  methods : {
    getWeatherForecast()
    {
      axios
          .get('https://localhost:44391/WeatherForecast')
          .then(response => (this.msg = response))
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
