document.addEventListener("DOMContentLoaded", function(event) { 

  var app = new Vue({
    el: '#app2',
    data: {
      meals: []
    },
    mounted: function() {
      $.get('/api/v1/dashboard/meals', function(response) {
        console.log('mounted is woring ');
        console.log(response);
        this.meals = response;
      }.bind(this));     
    }


  });
});