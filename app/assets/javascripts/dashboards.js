document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      food: [

      ] 
    },
    mounted: function() {
      console.log('mounted is working'); 
      $.get('/api/v1/dashboard', function(response) {
        this.food = response;
      }.bind(this));
    },
    methods: {
      search: function(event) {
        event.preventDefault();
        console.log(event);
        console.log('Search function is works');
      $.get('/api/v1/dashboard/search', function(response) {
        // this.food = response;
        console.log(response);
      }.bind(this));
      }
    }


  });
});