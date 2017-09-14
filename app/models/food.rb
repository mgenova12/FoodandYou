class Food < ApplicationRecord
  has_many :added_foods
  has_many :users, through: :added_foods
  has_many :meals, through: :added_foods
end
