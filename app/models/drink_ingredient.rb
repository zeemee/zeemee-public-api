class DrinkIngredient < ApplicationRecord
  belongs_to :drink
  belongs_to :ingredient

  validates :measurement, presence: true
end
