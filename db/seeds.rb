# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 20.times do 

#   Food.create(
#     name: Faker::Food.ingredient,
#     quanity: rand(100),
#     calories: rand(2000),
#     protein: rand(50),
#     totalfat: rand(200),
#     sugar: rand(100),
#     sodium: rand(500)
#     )

# end

# 3.times do 
#    User.create(
#    first_name: Faker::Name.first_name,
#    last_name: Faker::Name.last_name,
#    email: Faker::Internet.email,
#    password_digest: "password"
#    )
# end


# 20.times do 
#   Meal.create(
#   user_id: rand(3),
#   total_calories: rand(2000),
#   total_protein: rand(2000),
#   total_totalfat: rand(2000),
#   total_sugar: rand(2000),
#   total_sodium: rand(2000),
#   total_cholesterol: rand(2000)
#   )
# end

# 40.times do 
# AddedFood.create(
#     user_id: rand(3),
#     food_id: rand(20),
#     meal_id: rand(22) 
#   )
# end

(42040..36633).each do |num|

foods = Unirest.get("https://api.nal.usda.gov/ndb/V2/reports?ndbno=#{num}&type=f&format=json&api_key=").body

@test = foods['foods']

next if @test == [{"error"=>"No data for ndbno #{num}"}]

if @test[0]['food']['nutrients'][0]['measures'] == [] || @test[0]['food']['nutrients'][0]['measures'] == [nil]
  next
else 
  @serving_size = @test[0]['food']['nutrients'][0]['measures'][0]['qty']
end


if @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "208" || nutrient['nutrient_id'] == 208 } == [] 
   @calories = 0 
else 
   @calories = @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "208" || nutrient['nutrient_id'] == 208}[0]['value'] 
end 


 if @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "203" || nutrient['nutrient_id'] == 203} == [] 
   @protein = 0 
 else 
   @protein = @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "203" || nutrient['nutrient_id'] == 203}[0]['value']  
 end 


if @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "204" || nutrient['nutrient_id'] == 204} == [] 
   @totalfat = 0 
else 
   @totalfat = @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "204" || nutrient['nutrient_id'] == 204}[0]['value']  
end 


if @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "269" || nutrient['nutrient_id'] == 269} == [] 
   @sugar = 0 
else 
   @sugar = @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "269" || nutrient['nutrient_id'] == 269}[0]['value']  
end 


if @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "307" || nutrient['nutrient_id'] == 307} == [] 
   @sodium = 0 
else 
   @sodium = @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "307" || nutrient['nutrient_id'] == 307}[0]['value']  
end 


if @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "601" || nutrient['nutrient_id'] == 601} == []  
   @cholestl = 0 
else 
   @cholestl = @test[0]['food']['nutrients'].select{|nutrient| nutrient['nutrient_id'] == "601" || nutrient['nutrient_id'] == 601}[0]['value'] 
end 


Food.create!(
    name: @test[0]['food']['desc']['name'],
    serving_size: @serving_size,
    unit: @test[0]['food']['nutrients'][0]['measures'][0]['label'],
    calories: @calories,
    protein: @protein,
    totalfat: @totalfat,
    sugar: @sugar,
    sodium: @sodium,
    cholesterol: @cholestl
  )

end



