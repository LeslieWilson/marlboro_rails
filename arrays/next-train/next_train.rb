
trains = []

File.readlines('./test.txt').each { |line| trains << line.split(",") }

trains.each do |t|
  t.each do |w|
    w.tr!("\n", '')
  end
end
print trains


puts "what time are you leaving? "
leaving = gets.chomp.to_i



if leaving <= 2
    puts "ok take "


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
