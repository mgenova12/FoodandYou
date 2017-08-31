# Food & You

Food & You is an app that allows users to track their nutritional intake. It implements USDA's [API] to give accurate nutritional information.

# Motivation

People spend hundreds of dollars on groceries every month, but don’t have a great understanding of how much they’re actually consuming and in what quantities. This app allows users to feed data about their purchases and give them a nutritional break down of what they ate. It also records the foods you eat and gives you recommendations. 

# Tech

Food & You uses a number of open source projects to work properly:

* [Ruby on Rails] - Server-side web application framework written in Ruby
* [VueJS] - The Progressive JavaScript Framework
* [Bootstap] - The most popular HTML, CSS, and JS library in the world
* [PostgreSQL] - Powerful, open source object-relational database system
* [Bcrypt] -  A password hashing function
* [Vue Select] - A native Vue.js select component
* [Paper Clip] - Easy file attachment library for ActiveRecord
* [High charts] - Interactive JavaScript charts
* [Full Calendar] - Open source JavaScript jQuery plugin for event calendars

# Screenshots

![alt text](https://cdn.rawgit.com/mgenova12/Nutrition-app/fed55ee9/app/assets/images/Food%26you.jpg)

# Features

* User login/signup
* Interactive Graph
* Autocomplete searching
* Calorie recommendations
* Meal Calendar
* User profiles
* BMI/Calorie calculator 


# Code Example

**Adding a Food**
```javascript
     if (this.selected && this.foodSearch) {
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
         document.getElementById("searchError").innerHTML = '';
       }.bind(this));

     } else {
       document.getElementById("searchError").innerHTML = 'Please search a food or add quantity!';
     }

     this.foodSearch = '';
     this.selected = '';

```

**User Sign up**
```ruby
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/dashboard'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end    

  end

```



   [API]: <https://ndb.nal.usda.gov/ndb/doc/>
   [VueJS]: <https://vuejs.org/>
   [Ruby on Rails]: <http://rubyonrails.org/>
   [BootStap]: <http://getbootstrap.com/>
   [Full Calendar]: <https://fullcalendar.io/>
   [High Charts]: <https://www.highcharts.com/>
   [PostgreSQL]: <https://www.postgresql.org/>
   [Vue Select]: <http://sagalbot.github.io/vue-select/>
   [Paper Clip]: <https://github.com/thoughtbot/paperclip/>
   [Bcrypt]: <https://github.com/codahale/bcrypt-ruby/>
   
   
   

