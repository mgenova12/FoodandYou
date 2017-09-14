class User < ApplicationRecord
  has_secure_password
  
  has_many :added_foods
  has_many :foods, through: :added_foods
  has_many :meals, through: :added_foods
end
