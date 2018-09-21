
puts "hi, what do you want today"
input_1 = gets.chomp
puts "how many do you want"
input_2 = gets.chomp
sum = input_2.to_i
random = rand(14)+1


if input_2.index('tons') != nil
print "#{input_1}\n" * random
elsif sum != "tons"
    print "#{input_1}\n" * sum
puts "ok! come again"

end



# puts "how many sides does your dice have?"
# sides = gets.chomp.to_i
# dice_1 = rand(sides) + 1
# dice_2 = rand(sides) + 1
# total = dice_1 + dice_2
#
#
# puts "type e to roll, s to stop"
#
# while input = 'e'
#     input = gets.chomp
#     dice_1 = rand(sides) + 1
#     dice_2 = rand(sides) + 1
#     total = dice_1 + dice_2
#     puts "#{dice_1} : #{dice_2}, your total is #{total}. Roll again?"
# end



#
# sum = 0
#
#
# while sum < 100
#     sum += 1
#     if sum % 2 != 0
#         puts "#{sum}"
#
# end
# end






# require 'pry'
# puts "can I get you anything?"
# input = nil
#
# while input != 'no' do
#     input = gets.chomp
#     puts "can I get you anything?"
# binding.pry
# end
#
# puts "ok, bye!"


# grocery_list = "grocery list\n"
# grocery_list += "--------\n"
#
# input = ""
#
# while input != "done" do
#     print "please enter an item (or done):"
#
#     input = gets.chomp
#
#     if input !="done"
#     grocery_list += "* #{input}\n"
# end
# end
#
#
# puts "\n\n"
# puts grocery_list


# total_price = 0.0
#
# input = nil
# while input != "done" do
#     puts "\nThe current total is :$ #{total_price}"
#     puts "whats the price of the item? press dne w finished"
#     input = gets.chomp
#
#     if input !="done"
#     total_price += input.to_f
#
# end
#
# end
#
# puts "the total is: #{total_price}"

# puts "do 3 laps!"
# lap_count = 0
# while lap_count < 3
#     puts "now doing #{lap_count}"
# lap_count = lap_count + 1
# end

# 3.times do |lap count|
#     puts "times based #{lap_count}"
# end
# puts "we're out"


# print "please specify y/n"
# yes_orno_ = gets.chomp
# conditional
# while yes_orno != "y" && yes_orno !='n'
#     print "please specify y/n"
#operation that can potentially change the conditional
#     yes_or_no =gets.chomp
# end

# BETTER VERSION OF ABOVE:
#
# yes_orno = nil
# while yes_orno!= "y" && yes_orno !='n'
#     print "please specify y/n"
#
#     yes_orno= gets.chomp
# end

# puts "entering the loop"
# random = 0
# while random !=6
#     puts "were in the loop"
#     random = rand(6)+1
# puts "you rolled #{random}"
# end
