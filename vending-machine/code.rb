
# stuff_in_vending= "yellow", "green","blue","violet"
#
# puts "what do you want? "
# input = gets.chomp
# if input == input
#     puts stuff_in_vending.index(input)
# elsif input == input && stuff_in_vending.index == nil
#     puts "we don't carry that"
# end



stuff_in_vending= "yellow", "green","blue","violet"

puts "what do you want? "
input = gets.chomp
if stuff_in_vending.include?(input)
    puts stuff_in_vending.index(input)
else
    puts "oh sorry we don't have that"


end
