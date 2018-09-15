require 'pry'

puts "this is a game of rock paper scissors. type 'start'"
input = gets.chomp
if input == "start"
puts "player input your number! 1 for paper, 2 for scissors, 3 for rock"
player_roll = gets.chomp
computer_roll = rand(3)+1
end
while computer_roll == 1 && player_roll == 1
    puts "you both got rock"
if computer_roll == 1 && player_roll == 1
    puts "#{player_roll}: #{computer_roll} comp got rock, player got rock, tie!"
elsif computer_roll == 2 && player_roll == 2
    puts "#{player_roll}: #{computer_roll} comp got scissors, player got scissors, tie!"
elsif computer_roll == 3 && player_roll == 3
    puts "#{player_roll}: #{computer_roll} you both got paper, tie!"
elsif computer_roll == 1 && player_roll == 2
    puts "#{player_roll}: #{computer_roll}, player got rock comp got scissors, player wins "
elsif computer_roll == 1 && player_roll == 3
    puts "#{player_roll}: #{computer_roll} player got rock comp got paper,comp wins! "
elsif computer_roll == 3 && player_roll == 1
    puts "#{player_roll}: #{computer_roll} comp paper, player rock, comp wins "
else computer_roll == 3 && player_roll == 2
    puts "#{player_roll}: #{computer_roll}comp paper, player scissors, player wins "
end

# elsif computer_roll_1 == 1
#     puts "Rock"
# end


# elsif computer_roll == 2
#     puts "paper"
# elsif computer_roll == 3
#     puts "scissors"
