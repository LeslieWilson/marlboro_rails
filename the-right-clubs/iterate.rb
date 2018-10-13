chunk = [4,6,2,3,1,5,6].chunk {|n| n.even?}.each{|even, ary| p [even,ary]
}
puts chunk


map = (1..4).map {|i| i*i}
puts map


collection = (1..4).collect { "leslie"}
puts collection


cycle = ['leslie', 'paul', 'maria']
cycle.cycle(2) {|a| puts a }
puts cycle


each_slice = (1..10).each_slice(2) {|a| p a}
puts each_slice


each_with_index = Hash.new
%w(leslie paul maria).each_with_index {|item, index|
each_with_index[item] = index
}
puts each_with_index
