my_numbers = []


counter = 0
while counter < 100
added_counter = counter +=1
my_numbers << added_counter

end






my_numbers = my_numbers.map do |number|
    if
        (number % 5 == 0) && (number % 3 == 0)
        'Fizzbuzz'
    elsif
        number % 5 == 0
        'Buzz'
    elsif
        number % 3 == 0
        'Fizz'
    else
        number
    end
end


# my_numbers.each do |number|
#     if number == 3
# my_numbers.index |number| = "fizz"
# end
# end


# my_numbers.each do |number|
#     if number % 3
#         number.replace(["no"])
#     end
# end
#


# my_numbers.map {|number| number == % 3 ? 'Fizz' : number}

puts my_numbers
