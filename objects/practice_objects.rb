
class Fluffball
    attr_accessor :owner, :name, :size, :activity

def initialize (owner, name, size, activity, speed)
    @owner = owner
    @name = name
    @size = size
    @activity = activity
    @speed = speed

end

def jump
    @speed += 10

end



# class Person
#     attr_accessor :first_name, :middle_name, :last_name
#
#
#     def initialize (first_name, middle_name, last_name)
#         @first_name = first_name
#         @middle_name = middle_name
#         @last_name = last_name
#     end
# end


#
# require'pry'
# class Circle
#     attr_reader :radius
#     attr_reader :diameter
#
#
#
#     def initialize(radius,diameter)
#         @radius = radius
#         @diameter = diameter
#     end
#
#
# binding.pry



# class Person
#     def initialize(name, middle_name= nil, last_name = nil)
#         if last_name.nil? & middle_name.nil?
#             full_name = name.split
#             @first_name = full_name[0]
#             @middle_name = full_name[1]
#             @last_name = full_name[2]
#         else
#         @first_name = name
#         @middle_name = middle_name
#         @last_name = last_name
#     end
#
#     def summary
#         "Hi #{@first_name} #{@middle_name} #{@last_name}"
#     end
# end
# end
#
#     person = Person.new('john','lois', 'smith')
#     puts person.summary
#
#     other_person = Person.new('maggie ann rosenthol')
#     puts other_person.summary








#
# class Book
#     def initialize (title, author, category)
#         @title = title
# @author = author
#         @category = category
#
# end
#
#
#
# def summary
#     "#{@title} by #{@author} genre #{@category}"
# end
# end
#
#
# book = Book.new('user stories applied', 'mike cohn', 'technical')
# puts book.summary
#
#
# other_book = Book.new('pragmatic thinking', 'andy hunt','technical')
#
# puts other_book.summary


# class Rectangle
#     def initialize(length, width)
#     @length = length
#     @width = width
# end
#
#
# def length
#     @length
# end
#
# def width
#     @width
# end
#
# def perimeter
#     @length * 2 + @width * 2
# end
#
# def summary
#     {
#         length: self.length,
#         width: self.width,
#         perimeter: self.perimeter,
#         area: self.length * self.width
#     }
# end
# end
#
# my_rectangle = Rectangle.new(3, 9)
# print my_rectangle.perimeter
# print my_rectangle.summary
#

# class Person
# def initialize(name, age, mood)
#     @name = name
#     @age = age
#     @mood = mood
# end
#
# def naptime_behavior
#     "#{@name} is acting #{@mood} for naptime and that's because they are #{@age} years old"
# end
#
# def sleep_attempt
#     if @age > 3
#         "#{@name} refuses to sleep!"
#     elsif @age <3
#         "#{@name} is going to bed perfectly"
#     end
# end
#
#
# person = Person.new("michelle", 1, "happy")
# person = Person.new("chris", 4, "sad")
#
# puts person.naptime_behavior
# puts person.sleep_attempt
#
#
# end




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
