

# puts "give me a distance(hyp)"
# hyp = gets.chomp.to_i
# puts "give me a rotation in deg(theta)"
# rotDeg = gets.chomp.to_i


# rot = rotDeg / Math::PI * 180
# opp = hyp * Math.sin(rot)
# adj = hyp * Math.cos(rot)

degs = [ 0, 90, 180, 270, 360 ]
rads = []

puts "convert degs to rads"
puts "------"
puts "degrees = radians"
puts "------"
i = 0

degs.each do |deg|
  rads[i] = deg * Math::PI / 180
  puts "#{deg} = #{rads[i]}"
  i += 1
end

i = 0
puts "converting back"
puts "------"


rads.each do |rad|
  degs[i] = rad / Math::PI * 180
  puts "#{degs[i]} = #{rad}"
  i += 1
end
