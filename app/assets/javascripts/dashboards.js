document.addEventListener("DOMContentLoaded", function(event) { 
  Vue.component('v-select', VueSelect.VueSelect);
  var app = new Vue({
    el: '#app',
    data: {
      food: [],
      addedFoods: [],
      chartFoods: [],
      foodSearch: '',
      selected: '',
      calTotal: 0,
      proTotal: 0,
      sugarTotal: 0,
      fatTotal: 0,
      sodiumTotal: 0,
      cholesterolTotal: 0,
      options: [],
      hidden: true
    },
    mounted: function() { 

      $.get('/api/v1/dashboard', function(response) {
        this.food = response;
        for (var i = 0; i < response.length; i++) {
          this.options.push(response[i].name);
        }
      }.bind(this));

      $.get('api/v1/dashboard/added_foods', function(response) {
        this.addedFoods = response;

        if (this.addedFoods.length > 0) {
          this.hidden = false;
        } else {
          this.hidden = true;
        }
 
        for (var y = 0; y < this.addedFoods.length; y++) {
          $.get('/api/v1/dashboard/addedFoodSearch',{foodId: this.addedFoods[y].food_id, quantity: this.addedFoods[y].quantity}, function(response) {

            this.chartFoods.push(response);

            for (var i = 0; i < this.addedFoods.length; i++) {

              chart.addSeries({                        
                name: this.chartFoods[i].name,
                data:[
                  (parseInt(this.chartFoods[i].calories) * parseInt(this.chartFoods[i].quantity)), 
                  (parseInt(this.chartFoods[i].protein) * parseInt(this.chartFoods[i].quantity)), 
                  (parseInt(this.chartFoods[i].sugar) * parseInt(this.chartFoods[i].quantity)), 
                  (parseInt(this.chartFoods[i].sodium) * parseInt(this.chartFoods[i].quantity)), 
                  (parseInt(this.chartFoods[i].totalfat) * parseInt(this.chartFoods[i].quantity)), 
                  (parseInt(this.chartFoods[i].cholesterol) * parseInt(this.chartFoods[i].quantity))
                ]
              });
              this.chartFoods = [];
            }
          }.bind(this));
        }
      }.bind(this));

    },
    methods: {
      search: function(event) {
        event.preventDefault();
        if (this.foodSearch) {
          $.get('/api/v1/dashboard/search',{search: this.foodSearch}, function(response) {
            this.food = response;
          }.bind(this));
        } else {
          document.getElementById("searchError").innerHTML = 'Please enter a valid food!';
        }
      },
      quantity: function() {
        var quantity = this.selected.number;
        
        var calTotal = 0;
        var foodCalories = this.food.calories;
        calTotal = foodCalories * quantity;
        this.calTotal = calTotal;

        var proTotal = 0;
        var foodProtein = this.food.protein;
        proTotal = foodProtein * quantity;
        this.proTotal = proTotal;

        var sugarTotal = 0;
        var foodSugar = this.food.sugar;
        sugarTotal = foodSugar * quantity;
        this.sugarTotal = sugarTotal;

        var fatTotal = 0;
        var foodFat = this.food.totalfat;
        fatTotal = foodFat * quantity;
        this.fatTotal = fatTotal;

        var sodiumTotal = 0;
        var foodSodium = this.food.sodium;
        sodiumTotal = foodSodium * quantity;
        this.sodiumTotal = sodiumTotal;

        var cholesterolTotal = 0;
        var foodCholesterol = this.food.cholesterol;
        cholesterolTotal = foodCholesterol * quantity;
        this.cholesterolTotal = cholesterolTotal;
      },
      addFood: function() {
        if (this.selected && this.foodSearch && (document.getElementById("didCalorieSearch").innerHTML !== '<p>  </p>')) {

          var parameters = {
            name: this.food.name,
            id: this.food.id,
            quantity: this.selected.number
          };
          $.post('api/v1/dashboard/added_foods', parameters, function(response) {
            this.addedFoods.push(response);  

            chart.addSeries({                        
              name: response.name,
              data:[
                this.calTotal, 
                this.proTotal,  
                this.sugarTotal, 
                this.sodiumTotal, 
                this.fatTotal, 
                this.cholesterolTotal
              ]
            });  
            if (this.addedFoods.length > 0) {
              this.hidden = false;
            } else {
              this.hidden = true;
            } 
          }.bind(this));

        } else {
          document.getElementById("searchError").innerHTML = 'Please search a food or add quantity!';
        }

        this.foodSearch = '';
        this.selected = '';
      },
      removeFood: function(addedFood) {
        chart.series[this.addedFoods.indexOf(addedFood)].remove(true);
 
        this.addedFoods.splice(this.addedFoods.indexOf(addedFood), 1);
        $.ajax({
          url: "api/v1/dashboard/added_foods/" + addedFood.id,
          type: 'DELETE',
          success: function(result) {
          // Do something with the result
            console.log(result);
          }
        });

        if (this.addedFoods.length > 0) {
          this.hidden = false;
        } else {
          this.hidden = true;
        }
      },
      savedMeal: function() {
        if (this.addedFoods.length > 0) {
          $.post('api/v1/dashboard/meals', function(response) {
            console.log(response);
          });
          window.location = "/my_meals";
        } else {
          document.getElementById("searchError").innerHTML = 'You must first add a food!';

        }
      },
    }

  });

var chart = Highcharts.chart('container', {
  chart: {
    borderColor: '#fff',
    borderWidth: 1,    
    style: {
      color: "#fff"
    },    
    backgroundColor: {
      linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
      stops: [
          [0, 'rgb(56, 45, 7)'],
          [1, 'rgb(56, 45, 7)']
      ]
    },    
    type: 'column'
  },
  title: {
    text: 'Foods',
    style: {
      color: "#fff"
    }    
  },
  subtitle: {
    text: 'Source: usda.gov',
    style: {
      color: "#fff"
    }    
  },
  xAxis: {
    categories: [
      'Calories',
      'Protein',
      'Sugar',
      'Sodium',
      'Total Fat',
      'Cholesterol'
    ],
    crosshair: true,    
    labels: {
      style: {
        color: "#fff"
      }      
    }
  },
  yAxis: {
    min: 0,
    title: {
      text: 'Amount',
      style: {
        color: "#fff"
      }
    },
    labels: {
      style: {
        color: "#fff"
      }      
    }    
  },
  legend: {
    itemStyle: {
      color: '#FFF'
    },
    itemHoverStyle: {
      color: '#CCC'
    },
    itemHiddenStyle: {
      color: '#CCC'
    }
  },
  labels: {
    style: {
      color: '#CCC'
    }
  },  
  tooltip: {
    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
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
  series: [
  ],
});


});







