class AddedFood < ApplicationRecord
  belongs_to :user
  belongs_to :food 
  belongs_to :meal, optional: true
end
