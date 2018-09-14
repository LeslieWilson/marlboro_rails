puts "this is a game of rock paper scissors. type 'start'"
input = gets.chomp
if input == "start"
computer_roll_1 = rand(3)+1
puts computer_roll_1
end

if computer_roll_1 == 1
    puts "you got rock!"
elsif computer_roll_1 == 2
    puts "you got scissors!"
elsif computer_roll_1 == 3
    puts "you got paper!"
end

# elsif computer_roll_1 == 1
#     puts "Rock"
# end



# elsif computer_roll == 2
#     puts "paper"
# elsif computer_roll == 3
#     puts "scissors"
