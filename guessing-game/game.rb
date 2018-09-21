# require 'pry'
#
#
# puts "what level would you like? choose 'easy' or 'hard'"
# level_choice = gets.chomp
#
# if level_choice == "easy"
#     puts "a random number between 1 and 10 has been chosen, and you need to guess it! put your guess in below"
#     guess = gets.chomp.to_i
# end
#
# while random_easy = rand(10) && random_hard = rand(20)
#     if level_choice == "easy" && guess != random_easy
#         puts "nope, try again!"
#         guess = gets.chomp
#         binding.pry
# end
# end

require 'pry'
random_easy = rand(10) && random_hard = rand(20)

puts "what level would you like? choose 'easy' or 'hard'"
level_choice = gets.chomp

if level_choice == "easy"
    puts "a random number between 1 and 10 has been chosen, and you need to guess it! put your guess in below"
    guess = gets.chomp.to_i
end

while level_choice == "easy"
    if guess != random_easy
        puts "nope, try again!"
        guess = gets.chomp.to_i
        binding.pry
    elsif guess == random_easy
        puts "you guessed it!"
        break


end
end
