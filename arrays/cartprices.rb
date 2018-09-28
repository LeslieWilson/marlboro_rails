

while true
    puts "whats the price of thing"
    price = gets.chomp.to_f
    prices << price

    puts "anything else? y/n"
    confirmation = gets.chomp
    if confirmation.downcase == 'n'
        break
end
end

total = 0
prices.each do |price|
    total = total + price
end

puts "your total is #{total}"
