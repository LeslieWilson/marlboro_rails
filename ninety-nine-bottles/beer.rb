


base = 100
start_num = base - 1
end_num = start_num - 1


puts "start to start"
start = gets.chomp

while start != nil and start_num !=0 and start_num < 100
    start_num = base - 1
    end_num = start_num -1
    base = base - 1
puts  "#{start_num} bottles of beer on the wall, #{start_num} bottles of beer, if one falls down then pass it around #{end_num} bottles of beer"

end
