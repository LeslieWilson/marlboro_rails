# greeting = "my name is leslie"
# puts greeting
# require "pry"
# binding.pry
# puts greeting

# require "pry"
# puts "enter the loop"
# 5.times do
#     puts "during the loop"
#     binding.pry
# end
# puts "after the loop"

require "pry"

first_die = rand(6) +1
second_die = rand(6) +1

while first_die != second_die
    puts "rolling again for doubles!"
    puts "#{first_die} : #{second_die}"
    first_die = rand(6) +1
    second_die = rand(6) +1
    binding.pry if second_die == 6
end

puts "doubles! #{first_die} : #{second_die}"
