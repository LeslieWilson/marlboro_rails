
puts "hi, input the amount of snow your received in cubic ft and I'll give you a quote"
input = gets.chomp
if input.to_f >= 0 && input.to_i <= 49
    puts "that will be 20 bucks plz"
elsif input.to_f >= 50 && input.to_i <= 149
    puts "that will be 50 bucks plz"
elsif input.to_f >=150 && input.to_i <= 299
    puts "that will be 100 bucks please thanks"
elsif input.to_f >=300
    puts "thats a ton of snow. cost ya 150"
end
