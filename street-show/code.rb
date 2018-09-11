# YOUR CODE GOES HERE

# Knife_Juggling = 11.87
# Torch_Juggling = 16.5
# Hand_Balancing = 3.00
# Human_Blockhead = 1.18
#
#
# sum = Knife_Juggling + Torch_Juggling + Hand_Balancing + Human_Blockhead
#
# average = sum/12
#
#
#
#
# puts "Hello everyone my assistant will help us run this show. Whats your name dude?"
# name = gets.chomp
# puts "ok cool interesting!kh and whats your fav numeber?"
# number = gets.chomp
#
# puts "sweet!"

# puts "whats your name? "
# input = gets.chomp
# if input == "richard"
#     puts "hello, richard"
# elsif input == "suzy"
#     puts "hello suzy"
# else puts "I don't know who you are"
# end

# require 'pry'
# print "whats your lucky number? "
# input= gets.chomp
#
# # binding.pry
#
# if input.to_i % 2 == 0
#     puts "that's a great lucky number"
# else
#     puts "not lucky"
# end


# dinner_total = 178
# tip_expected = 0.2
# tip = dinner_total*tip_expected
#
# puts "you should tip #{tip_expected}"
# puts "the total bill is #{dinner_total}"
# puts "your tip then is #{tip}"

require 'pry'
puts "what activity would you like to do?"
binding.pry
if (rand(4)) == 1
    puts "ok jetskiing"
elsif (rand(4)) == 2
    puts "ok animals!"
elsif (rand(4)) == 3
    puts "kk sailing"
end
