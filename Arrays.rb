# Arrays

lista = Array.new
lista << "posição 1"
lista << "posição 2"
lista << "posicao 3"

puts lista.size()

lista2 = [1,2,3,"maça","teste"]

puts lista2.size()

# Arrays associativos (Hashes)

puts "-------------------------"

dicionario = Hash.new
dicionario["jerônimo"] = "teste"
dicionario["umnumero"] = 1
dicionario["qualquercoisa"] = true

puts dicionario.size
puts dicionario["jerônimo"]

# Símbolos também podem ser chaves em Hashes

config = Hash.new
config[:porta] = 80



fim = gets