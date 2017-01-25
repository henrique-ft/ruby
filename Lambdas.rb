# Lambdas

first_name = lambda { |first, last| first + " " + last }

puts first_name["Henrique","Fernandez"]
puts first_name.call("Henrique","Fernandez")

# ou

first_name2 = ->(first, last){ first + " " + last }

puts first_name2["Henrique","Fernandez"]
puts first_name.call("Henrique","Fernandez")