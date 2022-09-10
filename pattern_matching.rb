case {a: 3, b: "oi", c: 0}
in {a: a}
  p a # prints 3
end

case {a: 3, b: "oi", c: 0}
in {b: b}
  p b # prints "oi"
end

case 67
in 0..100
  p 'it\'s a match!'
end

case {a: 3, b: "oi", c: 0}
in {b: b, x: 4}
  p b
in _
  p "Nothing found" # prints "Nothing found"
end

case 80
in 0..10
  p 'A small number'
in 11..50
  p 'An okay sized number'
in 51..100
  p 'A respectable sized number'
else
  p 'Number not in range :-('
end

make_it = 'better'

case make_it
in 'harder' | 'better' | 'faster' | 'stronger' => like_this
  p "Do it #{like_this}" # prints "Do it better"
end

arr = [0, 1, 2]

case arr
in [_, 1, 2] => a
  p a # prints [0, 1, 2]
end

arr = [0, 1, 2]

case arr
in [*, 2] => a
  p a  # prints [0, 1, 2], ignore everything before 2
end

# variable pinning
expectation = 18

case [1, 2]
in [^expectation, *rest]
  "matched. expectation was: #{expectation}"
else
  "not matched. expectation was: #{expectation}"
end

# Using deconstruct and deconstruct_keys

class Point
  def initialize(x, y)
    @x, @y = x, y
  end

  def deconstruct
    puts "deconstruct called"
    [@x, @y]
  end

  def deconstruct_keys(keys)
    puts "deconstruct_keys called with #{keys}"
    {x: @x, y: @y}
  end
end

case Point.new(1, -2)
in px, Integer  # subpatterns and variable binding works
  "matched: #{px}"
else
  "not matched"
end
# prints "deconstruct called"
#=> "matched: 1"

case Point.new(1, -2)
in x: 0.. => px
  "matched: #{px}"
else
  "not matched"
end
# prints: deconstruct_keys called with [:x]
#=> "matched: 1"

# *** Matching classes
class SuperPoint < Point
end

case Point.new(1, -2)
in SuperPoint[x: 1 => px]
  p "matched: #{px}"
else
  p "not matched"
end
#=> "not matched"

case SuperPoint.new(1, -2)
in SuperPoint[x: 1 => px]
  p "matched: #{px}"
else
  p "not matched"
end
#=> "matched: 1"

# *** Guards

case [1, 2]
in a, b if b == a*2
  "matched"
else
  "not matched"
end
#=> "matched"

case [1, 1]
in a, b if b == a*2
  "matched"
else
  "not matched"
end

# One line

{a: 1, b: 2} in {a: a_value}

p a_value # prints 1

case {a: 3, b: "oi", c: 0}
in {b: b, x: 4}
  p b # raises "NoMatchingPatternError"
end
