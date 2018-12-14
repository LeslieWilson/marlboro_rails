require 'pry'

def add_some_numbers
    puts "type a number you would like to add"
    array_of_numbers = []
    sum =  0
    input = 0
    while input != ''
        input = gets.chomp
        array_of_numbers << input.to_i
    end
    array_of_numbers.each do |num|
        sum += num
    end
    return sum
end

puts add_some_numbers




















# puts "this is a game of rock paper scissors. type 'start'"
# input = gets.chomp
# if input == "start"
# puts "player input your number! 1 for paper, 2 for scissors, 3 for rock"
# player_roll = gets.chomp
# computer_roll = rand(3)+1
# end
# if computer_roll == player_roll
#     puts 'tie'
# elsif computer_roll > player_roll && computer_roll < 3
#     puts ''
# elsif computer_roll == 3
#     puts 'maybe'
# end







#computer_roll == 1 && player_roll == 1
#     puts "you both got rock"
# elsif computer_roll == 2 && player_roll == 2
#     puts "comp got scissors, player got scissors, tie!"
# elsif computer_roll == 3 && player_roll == 3
#     puts "you both got paper, tie!"
# elsif computer_roll == 1 && player_roll == 2
#     puts " player got rock comp got scissors, player wins "
# elsif computer_roll == 1 && player_roll == 3
#     puts "player got rock comp got paper,comp wins! "
# elsif computer_roll == 3 && player_roll == 1
#     puts "comp paper, player rock, comp wins "
# else computer_roll == 3 && player_roll == 2
#     puts "comp paper, player scissors, player wins "

# elsif computer_roll_1 == 1
#     puts "Rock"
# end


# elsif computer_roll == 2
#     puts "paper"
# elsif computer_roll == 3
#     puts "scissors"
