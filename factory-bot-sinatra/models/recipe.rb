class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true
  validates :cooking_time, numericality: { greater_than: 0 }
  validates :servings, numericality: { greater_than: 0 }
end


def self.quick_recipes
  where("cooking_time < ?", 30)
end
