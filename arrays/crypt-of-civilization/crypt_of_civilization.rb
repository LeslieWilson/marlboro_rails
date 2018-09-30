crypt_of_civilization = ["Comptometer", "Box of phonographic records", "Plastic savings bank", "Set of scales", "Toast-O-Later", "Sample of aluminum foil", "Donald Duck doll"]

extra = ["Container of beer", "Lionel model train set", "Ingrham pocket watch"]


real_crypt = crypt_of_civilization + extra

number = real_crypt.count
puts number

first = real_crypt[0]
puts first

last = real_crypt[-1]
puts last

second = real_crypt[1]
puts second

third = real_crypt[2]
puts third

sectolast = real_crypt[-2]
puts sectolast

index = real_crypt.index("Toast-O-Later")
puts index

puts real_crypt.include?('Container of beer')
puts real_crypt.include?('Toast-O-Lator')
puts real_crypt.include?('Plastic bird')



wlength = real_crypt.sort_by{|w| w.length}
puts wlength

puts real_crypt.sort
puts "===="

puts real_crypt.sort {|first, second| second <=> first}


#why use sort by as opposed to sort
puts "===="
real_crypt.shift
real_crypt.pop

real_crypt.de
puts real_crypt
