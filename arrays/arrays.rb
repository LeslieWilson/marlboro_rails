



numbers = [2,3,4,6,3,4,2,4]
numbers.sort!



numbers.inject(0) do |sum, num|
    sum += num





#
#
#
#
#
# instructors = ['dan', 'dt', 'jarvis']
# greeting = instructors.map do |instructors|
#     "Hi #{instructors}"
# end
#
# puts greeting.inspect


# used the map operation to do the same thing I could do with an each block

# numbers = [2,3,4,5,3,2]
#
#
# doubled_array = numbers.map do |num|
#     num * 2
# end
# puts doubled_array.inspect





# numbers = [2,3,4,5,3,2]
#
# doubled_array = []
#
# numbers.each do |number|
# doubled_array << number * 2
# end
#
# puts doubled_array.inspect




# instructors = ['dan', 'dt', 'jarvis']
#
# not_d_instructors = instructors.reject do |instructor|
#      instructor[0] == "d"
# end
# puts not_d_instructors.inspect


# instructors = ['dan', 'dt', 'jarvis']
#
# d_instructors = instructors.select do |instructor|
#      instructor[0] == "d"
# end
# puts d_instructors.inspect

# instructors = ['dan', 'dt', 'jarvis']
#
# d_instructors = instructors.find_all do |instructor|
#      instructor[0] == "d"
# end
# puts d_instructors


# learned that any time theres a method that takes a block, its going to be pretty prescriptive in terms of the number of arguments that get passed to the pipes.



#
# instructors = ['dan', 'dt', 'jarvis']

#
# dan is in position one
# dt is in postion two
#
#
# position = 1
# instructors.each do |instructor|
#     puts "#{instructor} is in position #{position}"
#     position += 1
# end
#

# the below version requires a block with two arguments
# instructors.each_with_index do |instructor, index|
#     puts "#{instructor}is in position#{index+1}"
# end

# instructors.each do |instructor|
#     puts "hi #{instructor}"
# end
#
# two different ways to do it- above is better
#
# index = 0
# while index < instructors.size
#     puts "hi #{instructors[index]}"
#     index += 1
#
# end

#
# ["bridget", "barney", "sam", "ella"].each {|name| puts (name.index('b')== 0)? "#{name} starts with b" : ""}
#
# ["bridget", "barney", "sam", "ella"].each do |name|
#     if name.index('b') == 0
#         puts "#{name} starts with 'b'"
#     end
# end
#
#
#
# names_to_greet = ['sally', 'sam', 'suzi']
# names_to_greet.each { |name| puts "Hi #{name}"}
#
#
#
#
#
# numbers = [1,2,3,4,5]
#
#
#
# doubled_numbers = []
#
# numbers.each do |number|
#     doubled_numbers << number * 2
# end
#
#
# doubled_numbers.each do |number|
#     puts number
# end
#
#
#
#
# numbers.each do |number|
#     puts number
# end
#
#
#
# see above for .each version
#
# numbers = [1,2,3,4,5]
# current_index = 0
# max_index = numbers.length - 1
#
# while current_index <= max_index
#     puts numbers[current_index]
#     current_index += 1
# end
#
#




# ary = ["leslie", 'nate', 'dog']
# i = 0
# while i < array.length
#     print array[i]
#     i +=1
#
# end
#
# puts "my to do list"
# to_do = ["buy milk", "learn arrays", "learn ruby"]
#
# to_do.each do |item|
#     print "YES"
#     puts item
# end
#
# puts "my list of people i like"
# array_1 = ['michele', 'paul', 'mike']
# i = 0
# while i < array_1.length
#     print "*"
#     puts array_1[i]
#     i += 1
# end
