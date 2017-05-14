document.addEventListener("DOMContentLoaded", function(event) { 

  var app2   = new Vue({
    el: '#app2',
    data: {
      meal: [],
    },
    mounted: function() {
      $('#calendar').fullCalendar({
        // put your options and callbacks here
        events: '/api/v1/dashboard/meals'
      }); 
      
      var id = window.location.href.split('/').slice(-1)[0];
      $.get('/api/v1/dashboard/meals/' + id, function(response) {
        console.log('mounted is working???');
        console.log(window.location.href );
        console.log(this.id);
        console.log(response);
        this.meal = response;
      }.bind(this)); 
      

    }


  });
});


