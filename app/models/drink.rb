class Drink < ApplicationRecord
  belongs_to :category
  belongs_to :container

  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  validates :name, :category, :container, :instructions, :image, presence: true
end
