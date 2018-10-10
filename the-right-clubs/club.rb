# stuff = {"driver"=> 200,
# "four_wood"=>180,
# "five_wood" => 170,
# "two_iron"=>170,
# "three_iron" => 160,
# "four_iron" => 150,
# "five_iron" =>140,
# "six_iron" =>130,
# "seven_iron"=> 120,
# "eight_iron"=> 110,
# "nine_iron" =>95,
# "pitching_wedge" =>80,
# "sand_Wedge" => 20,
# "putter"=>0}
#
# driver 200
# four wood 180
# five wood 170
# two iron 170
# three iron 160
# four iron 150
# five iron 140
# six iron 130
# seven iron 120
# eight iron 110
# nine iron 95
# pitching wedge 80
# sand Wedge 20
# putter 0


container = []
File.open('golfclubs.txt').each do |line|
    split_lines = line.split(" ")
    container << split_lines

# split_lines.each do |l|
#
#
#
#  end
end

hash = {}
container.each do |i|
    if i.length == 2

    hash[i[0]] = [i[1].to_i]
else
    hash[i[0]+ "_"+i[1]] = [i[2].to_i]

end
end

puts "how far away are you"
input = gets.chomp.to_i

newArray = []

hash.values.each do |n|
    if input >= n[0]
        newArray << [n[0]]

    end

end
puts "youre #{newArray[0].to_s.gsub("[", "").gsub("]", "")} feet away! you should use the #{hash.key(newArray[0])}!"

# string = {newArray[0].to_s}
# string.gsub(/"[" | "]"/){|m| string|m|}

# if input <= hash.values
#     print "use the #{hash.values}"
# end
# end
# print hash.values
