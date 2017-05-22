document.addEventListener("DOMContentLoaded", function(event) { 

  var app2   = new Vue({
    el: '#app2',
    data: {
      meal: [],
      mealCreated: '',
      AvgCalories: 0
    },
    mounted: function() {
      $('#calendar').fullCalendar({
        // put your options and callbacks here
        events: '/api/v1/dashboard/meals',
        eventColor: '#094220'
      }); 
      
      var id = window.location.href.split('/').slice(-1)[0];
      $.get('/api/v1/dashboard/meals/' + id, function(response) {
        this.meal = response;
        this.mealCreated = moment(this.meal.created).format('LLLL'); 

      }.bind(this));


      $.get('/api/v1/profiles', function(response) {
        this.AvgCalories = response[0].AvgCalories;

      }.bind(this));


    }

  });
});


