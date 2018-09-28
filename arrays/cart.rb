require 'pry'
possible_items = ['old paperback', 'potato', 'red onion', 'dried lemon', 'medicinal herbs', 'saffron']

puts "here is a list of items you can buy"

possible_items.each do |item|
    puts "#{item}"
end



pick = " "
shopping_cart = []
dont_have = []


while true
puts "what do you want to buy"
pick = gets.chomp

if pick == 'finished'
    break
elsif possible_items.include?(pick)
    shopping_cart << pick
else
    puts "sorry don't have it"
    dont_have << pick

end
end


puts "here is a list of items in your cart"
shopping_cart.each do |item|
    puts "#{item}"

end

puts "btw we noticed you put these items in there, we'll let you know if we have them"
    dont_have.each do |item|
        puts "#{item}"

end
