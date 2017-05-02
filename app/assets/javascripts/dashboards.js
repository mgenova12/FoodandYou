document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      food: [

      ],
      foodSearch: '' 
    },
    mounted: function() {
      console.log('mounted is working'); 
      $.get('/api/v1/dashboard', function(response) {
        this.food = response;
      }.bind(this));
    },
    methods: {
      // isValidFood: function(inputFood) {
      //   return inputFood.name.toLowerCase().indexOf(this.foodSearch.toLowerCase()) > -1;
      // }
      search: function(event) {
        event.preventDefault();
        console.log('Search function is works');
        console.log(event);
        console.log(this.foodSearch);
      $.get('/api/v1/dashboard/search', function(response) {
        console.log('this works too');
        console.log(response);
        this.food = response;
      }.bind(this));
      }
    }


  });
});