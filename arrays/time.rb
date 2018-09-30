
creatures = ["human", "dwarf", "elf"]
creatures.all? {|name| name.length >= 5}




# authors = ["leslie", "paul", "rob"]
#
# author_types= authors.map! do |person|
#     "#{person} author"
# end
# puts author_types

# authors = ["leslie", "paul", "rob"]
#
# authors.each_with_index do |author, index|
#     puts "#{index + 1}) #{author}\n"
# end


# time_capsule=[]
# number_collector= []
#
#
# while true
# puts "what do you want to add to the timec capsule? say 'finished' when you're done."
# item = gets.chomp
# if item == 'finished'
#     break
# else
#     #store number of items alongside the string
#     time_capsule << item
# end
# end
#
# puts "Here's a list of things in your time capsule:"
# time_capsule.each do |item|
#     puts "#{item}"
# end


#
#          puts "and how many will you have?"
#          number = gets.chomp.to_i
#          number_collector << number
#          puts "anything else?"
#
#     end
# end
#
# puts "Here's a list of things in your time capsule:"
# puts "* #{time_capsule}(#{number})"
