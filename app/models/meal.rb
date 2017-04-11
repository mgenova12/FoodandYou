class Meal < ApplicationRecord
  has_many :added_foods
  has_many :users, through: :added_foods
  has_many :foods, through: :added_foods

end
