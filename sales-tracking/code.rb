# puts "entering the park, running to the lake"
# lap_count = 0
#
# while lap_count < 3 do
#     lap_count += 1
#     puts "thats lap #{lap_count} around the park"
# end
#
# puts "now through the rest of the park"
#
# puts "wahts your favorite number? we'll count up to it from 1"
# fav_num_str = gets.chomp
# fav_num = fav_num_str.to_i
#
# counter = 0
# while counter < fav_num do
#     counter += 1
#     puts counter
# end
#
# continue = true
# while(continue) do
#     puts "here we're in the loop, go again? (t/f)"
#     check = gets.chomp
#     if check =='f'
#         puts "the end"
#
#     end
# end
#
#
# 10.times do
#     puts "hello friend"
# end

##in this excercise I want to write a loop that accepts user inputs and adds them, prompting if they have anything else to add befrore providing the sum.

#require 'pry'
# value = 0
# continue = true
#
# while continue == true do
#     puts "please input a value to sum"
#     new_value = gets.chomp.to_i
#     value = value + new_value
#
#     puts "would you like to input another value"
#     input = gets.chomp
#    binding.pry
#     if input == "f"
#         continue == false
#         puts "the sum of your values is #{value}"
# end
# end


# checking multiple conditionals to see if the loop should continue
# run while loop prompting user for input while either the tax or registration is due

# require 'pry'
# tax_due = true
# reg_due = true
#
# while (tax_due || reg_due) do
#     if tax_due
#         puts "please pay taxes (y/n)"
#         payment = gets.chomp
#         binding.pry
#         if payment == "y"
#             tax_due = false
#             puts "thank you for payment"
# end
# else
#     puts "please pay registration (y/n)"
#     payment = gets.chomp
#     binding.pry
#     if payment == "y"
#         reg_due = false
#         puts "ok you're all squared away"
#
#     end
# end
# end


# print "provide a character"
# character = gets.chomp
#
# if "aeiou".index(character)
#
#     puts "its a vowel"
# else
#     puts "its not a vowel"
#
# end

# print "do you want to continue(y/n)"
# character = gets.chomp
# if character != 'y' && character !='n'
# # if "yn".index(character).nil?
#     puts "please specify"
# end

# require 'pry'
#
# puts "provide a character, if you hit y we will add numbers together, no, we will scold you, and anything other than that, you're done with the program"
# character = gets.chomp
#
# while character != 'y' && character != 'n'
#     puts "please specify 'y' or 'n'"
#     character = gets.chomp
# end
#
# if character == 'y'
#     puts "ok we're going to add two numbers for you"
#     print "whats the first number?"
#     number_1 = gets.chomp
#     binding.pry
#     print "ok! whats the second number"
#     number_2 = gets.chomp
#
#     puts "the sum in #{number_1.to_i + number_2.to_i}"
# elsif character == 'n'
#     puts "you put a different number in"
# end
require 'pry'
puts "give me your numbers!"
total = 0.0
input = gets.chomp.to_f

while input < 100 do
    total = total + input
    binding.pry
end
puts "you're at 100!"

 puts "you've reached 100!"
    if total >= 125
        twenty_five_mores = ((total - 100)/25).to_icommuni
        twenty_five_mores.times do
            puts "you've earned another 25!"

        end
    end
