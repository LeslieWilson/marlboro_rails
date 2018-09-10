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

puts "would you like to roll the dice? "
input = gets.chomp
if input == "yes"
    dice1 = rand(6) + 1
    dice2 = rand(6) + 1
    total = dice1 + dice2
    print "you rolled : "
    puts total
else
    puts "ok I won't"
end
