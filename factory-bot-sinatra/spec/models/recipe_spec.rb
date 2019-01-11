require "spec_helper"

RSpec.describe Recipe, type: :model do
    describe ".quick_recipes" do
      it "returns recipes with a cooking time less than 30 min" do
        pb_and_j = Recipe.create! do |r|
          r.name = "Peanut Butter & Jelly Sandwich"
          r.instructions = "It's Peanut Butter Jelly Time!"
          r.cooking_time = 5
          r.servings = 1
        end

        pot_roast = Recipe.create! do |r|
          r.name = "Pot Roast"
          r.instructions = "Put the roast in a pot, turn on the stove, and wait."
          r.cooking_time = 240
          r.servings = 12
        end

        cheerios = Recipe.create! do |r|
          r.name = "A Bowl of Cheerios"
          r.instructions = "bloop"
          r.cooking_time = 2
          r.servings = 1
        end

        results = Recipe.quick_recipes

        expect(results).to include(pb_and_j)
        expect(results).to include(cheerios)

        expect(results).to_not include(pot_roast)
      end
    end
end
