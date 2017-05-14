document.addEventListener("DOMContentLoaded", function(event) { 
  Vue.component('v-select', VueSelect.VueSelect);
  var app = new Vue({
    el: '#app',
    data: {
      food: [],
      addedFoods: [],
      foodSearch: '',
      selected: '',
      calTotal: 0,
      proTotal: 0,
      sugarTotal: 0,
      fatTotal: 0,
      sodiumTotal: 0,
      cholesterolTotal: 0,
      options: [],
    },
    mounted: function() {
      $.get('/api/v1/dashboard', function(response) {
        this.food = response;
        for (var i = 0; i < response.length; i++) {
          this.options.push(response[i].name);
        }
      }.bind(this));

      $.get('api/v1/dashboard/added_foods', function(response) {
        console.log('from addFood get response');
        this.addedFoods = response;
        console.log(this.addedFoods);
      }.bind(this)); 

    },
    methods: {
      search: function(event) {
        event.preventDefault();
      $.get('/api/v1/dashboard/search',{search: this.foodSearch}, function(response) {
        this.food = response;
      }.bind(this));
      },
      quantity: function() {
        var quantity = this.selected.number;
        
        var calTotal = 0;
        var foodCalories = this.food.calories;
        calTotal = foodCalories * quantity;
        console.log('This is the calTotal for number selected ' + calTotal);
        this.calTotal = calTotal;

        var proTotal = 0;
        var foodProtein = this.food.protein;
        proTotal = foodProtein * quantity;
        console.log('This is the proTotal for number selected ' + proTotal);
        this.proTotal = proTotal;

        var sugarTotal = 0;
        var foodSugar = this.food.sugar;
        sugarTotal = foodSugar * quantity;
        console.log('This is the sugarTotal for number selected ' + sugarTotal);
        this.sugarTotal = sugarTotal;

        var fatTotal = 0;
        var foodFat = this.food.totalfat;
        fatTotal = foodFat * quantity;
        console.log('This is the fatTotal for number selected ' + fatTotal);
        this.fatTotal = fatTotal;

        var sodiumTotal = 0;
        var foodSodium = this.food.sodium;
        sodiumTotal = foodSodium * quantity;
        console.log('This is the sodiumTotal for number selected ' + sodiumTotal);
        this.sodiumTotal = sodiumTotal;

        var cholesterolTotal = 0;
        var foodCholesterol = this.food.cholesterol;
        cholesterolTotal = foodCholesterol * quantity;
        console.log('This is the cholesterolTotal for number selected ' + cholesterolTotal);
        this.cholesterolTotal = cholesterolTotal;
      },
      addFood: function() {
        var parameters = {
          name: this.food.name,
          id: this.food.id,
          quantity: this.selected.number
        };
        $.post('api/v1/dashboard/added_foods', parameters, function(response) {
          this.addedFoods.push(response);
        }.bind(this));
        this.foodSearch = '';
      },
      removeFood: function(addedFood) {
        console.log('the removeFood function works');
        console.log(addedFood.id);
        this.addedFoods.splice(this.addedFoods.indexOf(addedFood), 1);
        $.ajax({
          url: "api/v1/dashboard/added_foods/" + addedFood.id,
          type: 'DELETE',
          success: function(result) {
          // Do something with the result
            console.log(result);
          }
        });
      },
      savedMeal: function() {
        console.log('saved meal function works!');
        $.post('api/v1/dashboard/meals', function(response) {
          console.log(response);
        });
      },

    }


  });

Highcharts.chart('container', {
  chart: {
    type: 'column'
  },
  title: {
    text: 'Foods'
  },
  subtitle: {
    text: 'Source: usda.gov'
  },
  xAxis: {
    categories: [
      'Calories',
      'Protein',
      'Sugar',
      'Total Fat',
      'Sodium',
      'Cholesterol'
    ],
    crosshair: true
  },
  yAxis: {
    min: 0,
    title: {
      text: 'Amount'
    }
  },
  tooltip: {
    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
    footerFormat: '</table>',
    shared: true,
    useHTML: true
  },
  plotOptions: {
    column: {
      pointPadding: 0.2,
      borderWidth: 0
    }
  },
  series: [{
    name: 'Tokyo',
    data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0]

  }, {
    name: 'New York',
    data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5]

  }, {
    name: 'London',
    data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3]

  }, {
    name: 'Berlin',
    data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5]

  }]
});


});







