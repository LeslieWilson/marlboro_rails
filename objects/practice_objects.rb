class Person
def initialize(name, age, mood)
    @name = name
    @age = age
    @mood = mood
end

def naptime_behavior
    "#{@name} is acting #{@mood} for naptime and that's because they are #{@age} years old"
end

def sleep_attempt
    if @age > 3
        "#{@name} refuses to sleep!"
    elsif @age <3
        "#{@name} is going to bed perfectly"
    end
end


person = Person.new("michelle", 1, "happy")
person = Person.new("chris", 4, "sad")

puts person.naptime_behavior
puts person.sleep_attempt


end




# class Spaceship
#   def initialize(name, captain, fuel)
#     @name = name
#     @captain = captain
#     @fuel = fuel
#   end
#
#   def captains_announcement
#     "#{@name} will be captained by #{@captain} for the flight."
#   end
#
#   def launch
#     if @fuel > 50
#       "#{@name} has launched into orbit!"
#     elsif @fuel > 25
#       "It was a little touch and go at first, but #{@name} managed to make it into orbit!"
#     else
#       "#{@name} struggled to take flight and promptly crashed back down to the surface."
#     end
#   end
# end
#
# ship = Spaceship.new("Serenity", "Malcolm Reynolds", 45)
#
# puts ship.captains_announcement
# puts ship.launch
