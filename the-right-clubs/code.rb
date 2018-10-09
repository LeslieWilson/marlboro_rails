REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)
possible_club_selections.each do |n|
puts "use the #{n}!"

end

missing_clubs = possible_club_s

if possible_club_selections.include?(:putter || :driver || :sand_wedge) == false
puts "#{} is not included in your bag!"
end



# the_rest = available_clubs - possible_club_selections
# the_rest.each do |n|
#     puts "warning! you don't have #{n}"
# end

# if possible club selections does not contain a putter, driver or wedge, print a variable that has what is not in there
