major_cities = {BC: ["Vancouver", "Victoria", "Prince George"], AB: ["Edmonton", "Calgary"]}

major_cities.each do |key,value|
  print "#{key} has #{value.length} main cities: "
  for x in 0...value.length
    if x == value.length-1
      print "and #{value[x]}."
      puts ""
    else
      print "#{value[x]},"
    end
  end
end
