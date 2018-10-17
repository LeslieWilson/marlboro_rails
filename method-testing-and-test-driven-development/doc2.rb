def read_file(filename)
  # Given a filename, read the file and return a list of lists
  # for words in each line [['word1', 'word2'], ...].
  lines = []
  File.open(filename).each do |line|
      words = line.split(" ")
          lines << words
  end
  return lines
end

def make_club_hash(lines)
  # turn [['short', 'putter', '3'], ...] into {3 => 'short putter', ...}
  clubs = {}
  lines.each do |line|
    key = line.pop.to_i
    value = line.join(' ')
    clubs[key] = value
  end
  return clubs
end

def find_key(clubs, distance)
  # given a distance, find the right key in clubs that matches that distance
  distances = clubs.keys.sort
  distances.each do |d|
    if distance <= d
      return d
    end
  end
end

def main()
  # Make the hash of distance => club_name from the file.
  clubs = make_club_hash( read_file('golfclubs.txt') )

  # Talk to the nice user.
  puts "how far away are you"
  input = gets.chomp.to_i

  # Get the right distance
  distance = find_key(clubs, input)

  # ... and talk back.
  puts "You're #{distance} feet away! You should use the #{clubs[distance]}!"
end
