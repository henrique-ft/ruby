# Inject

# Sem o método inject

[2, 3, 4, 5, 6, 7].each do |i|
  total += i
end

# Com o método inject

[2, 3, 4, 5, 6, 7].inject(&:+)
