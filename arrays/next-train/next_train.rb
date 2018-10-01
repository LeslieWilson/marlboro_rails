
trains = []

File.readlines('./test.txt').each { |line| trains << line.split(",") }

trains.each do |t|
  t.each do |w|
    w.tr!("\n", '')
  end
end






puts "what time are you leaving? "
leaving = gets.chomp.to_f

if leaving <= 2
    puts "ok take #{trains[0][0]} leaving at #{trains[0][1]}"
elsif leaving <= 5
    puts "ok take #{} leaving at #{}"
elsif leaving <= 7#{}
    puts "take #{} leaving at #{}"
elsif leaving <= 8.5
    puts "take #{} leaving at #{}"
elsif leaving <= 9
    puts "take #{} leaving at #{}"
elsif leaving <=10
    puts "take #{} leaving at #{}"
elsif leaving <= 11.5
    puts "take #{} leaving at #{}"
end


# trains.each do |t|
#     t.each do |w|
#         w.tr('\n', '')
#
#     end
# end
#
# print trains
#
#
#
#
# item.each do |i|
#     i.each do |n|
#         n.tr('\n', '')
#
#     end
# end


#
# train_numbers = trains.split {|train| train.split[0]}
#
# puts train_numbers
#
# trains.split(',')
# puts trains

#
# train_numbers == trains.index(0)
# print train_numbers
