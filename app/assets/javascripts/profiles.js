document.addEventListener("DOMContentLoaded", function(event) { 

  var app3   = new Vue({
    el: '#app3',
    data: {
      profiles: [],
      BMI: 0,
      AvgCalories: 0
    },
    mounted: function() {

      $.get('api/v1/profiles', function(response) {
        console.log(response);
        this.profiles = response;
        console.log('AGE');
        console.log(this.profiles[0].height);
        this.BMI = Math.round((this.profiles[0].weight / (this.profiles[0].height * this.profiles[0].height)) * 703);


      }.bind(this));

    }

  });
});