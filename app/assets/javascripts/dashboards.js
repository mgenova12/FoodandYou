document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      food: [

      ],
      foodSearch: '',
      selected: '',
      calTotal: 0,
      proTotal: 0,
      sugarTotal: 0,
      fatTotal: 0,
      sodiumTotal: 0,
      cholesterolTotal: 0
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
        console.log('Search function is works');
        console.log(event);
        console.log(this.foodSearch);
      $.get('/api/v1/dashboard/search',{search: this.foodSearch}, function(response) {
        console.log('this works too');
        console.log(response);
        this.food = response;
      }.bind(this));
      },
      quantity: function() {
        var quantity = this.selected.number;
        
        var calTotal = 0;
        var foodCalories = this.food.calories;
        console.log(foodCalories);
        console.log('The selected number is ' + quantity);
        calTotal = foodCalories * quantity;
        console.log('This is the calTotal for number selected ' + calTotal);
        this.calTotal = calTotal;

        var proTotal = 0;
        var foodProtein = this.food.protein;
        console.log(foodProtein);
        console.log('The selected number is ' + quantity);
        proTotal = foodProtein * quantity;
        console.log('This is the proTotal for number selected ' + proTotal);
        this.proTotal = proTotal;

        var sugarTotal = 0;
        var foodSugar = this.food.sugar;
        console.log(foodSugar);
        console.log('The selected number is ' + quantity);
        sugarTotal = foodSugar * quantity;
        console.log('This is the sugarTotal for number selected ' + sugarTotal);
        this.sugarTotal = sugarTotal;

        var fatTotal = 0;
        var foodFat = this.food.totalfat;
        console.log(foodFat);
        console.log('The selected number is ' + quantity);
        fatTotal = foodFat * quantity;
        console.log('This is the fatTotal for number selected ' + fatTotal);
        this.fatTotal = fatTotal;

        var sodiumTotal = 0;
        var foodSodium = this.food.sodium;
        console.log(foodSodium);
        console.log('The selected number is ' + quantity);
        sodiumTotal = foodSodium * quantity;
        console.log('This is the sodiumTotal for number selected ' + sodiumTotal);
        this.sodiumTotal = sodiumTotal;

        var cholesterolTotal = 0;
        var foodCholesterol = this.food.cholesterol;
        console.log(foodCholesterol);
        console.log('The selected number is ' + quantity);
        cholesterolTotal = foodCholesterol * quantity;
        console.log('This is the cholesterolTotal for number selected ' + cholesterolTotal);
        this.cholesterolTotal = cholesterolTotal;
      }

    }


  });
});