# Loops

# While

i = 0

while i < 10
  puts "Hey There"
  i += 1
end

# Each, é o método mais usado para loops em ruby

arr = [23,124,3457,832,3]

arr.each do |x|
  p x
end

arr.each { |x|
  p x
}

# O for existe no ruby, porém é muito pouco usado.

for i in 0..42
  p i
end
