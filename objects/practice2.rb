# array = [25,36,12,89,3,95]
#
# new_array =[]
# array.each do |n|
#     if n % 2 == 0
#         new_array << n
# end
# end
#
# puts new_array

#
# answer = array.reject{|n| n % 2 == 0}
# puts answer

# new_array = []
#
# new_array = array.map do |n|
#     n += 10
# end
# puts new_array



numbers = []
sum = 0

while sum <= 99
    sum +=1
    numbers << sum
end

counter = 0
new_num = numbers.each do |n|
counter = counter + n
end

puts counter
