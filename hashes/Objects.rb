def car_description(color, model)
    "the car is #{color} and is from japan having imported as model #{model}"
end

    def ship_car(model)
        "#{model} is sent out now!"
    end


model = {
type: "impreza",
year: 2015
}

puts car_description(model[:type], model[:year])
puts ship_car(model[:model])




#
# def captains_announcement(ship, captain)
#   "#{ship} will be captained by #{captain} for the flight."
# end
#
# def launch_ship(ship)
#   "#{ship} has launched into orbit!"
# end
#
# ship = {
#   name: "Serenity",
#   captain: "Malcolm Reynolds"
# }
#
# puts captains_announcement(ship[:name], ship[:captain])
# puts launch_ship(ship[:name])
