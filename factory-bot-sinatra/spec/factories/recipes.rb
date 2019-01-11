FactoryBot.define do
  factory :recipe do
    name { "Green Eggs & Ham" }
    description { "Would you eat them in a box? Would you eat them with a fox?" }
    instructions { "Eggs + Ham + Food coloring" }
    servings { 4 }
    cooking_time { 45 }

  end
end
