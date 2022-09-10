# Procs

# Cria uma instância de proc, um proc pode receber um bloco, como argumento do método construtor

full_name = Proc.new { |first, last| first + " " + last }

puts full_name["Henrique","Fernandez"]
puts full_name.call("Henrique","Fernandez")

# ou

full_name2 = Proc.new do |first|
  first * 5
end

puts full_name2["henrique"]
puts full_name2.call("Henrique")
