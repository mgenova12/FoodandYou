document.addEventListener("DOMContentLoaded", function(event) { 

  var app3   = new Vue({
    el: '#app3',
    data: {
      profiles: [],
      BMI: 0,
      AvgCalories: 0
    },
    mounted: function() {

      $.get('/api/v1/profiles', function(response) {
        this.profiles = response;
        this.BMI = response[0].bmi;
        this.AvgCalories = response[0].AvgCalories;

      }.bind(this));

    }
  });
});