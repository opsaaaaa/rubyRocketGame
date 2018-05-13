
def drive hyp, deg
  rad = deg * Math::PI / 180
  opp = hyp * Math.sin(rad)
  adj = hyp * Math.cos(rad)
  return opp, adj
end


a = drive 3, 90

puts a[1]
