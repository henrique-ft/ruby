# O print mostra um valor mas não pula linha, o método gets pega um valor inserido no terminal, ele recebe apenas strings

print "Digite o nome do restaurante:"
nome = gets

# O puts mostra um valor e pula uma linha

puts "-----------------------"
print "Nome do restaurante: "
print nome

mensagem = "Bom dia,"
mensagem2 = "amigo"

# O operador << concatena uma string com outra na mesma variável

mensagem << " hey"

mensagem << mensagem2

# A concatenação também pode ser feita com o +

mensagem = mensagem + " tchal"
puts "----------------------"
puts mensagem

# Interpolação de Strings, prefira sempre a interpolação ao invés da concatenaão (+) ou do append (<<). É mais elegante e mais rápido
# Em strings definidas com aspas simples não é possível o fazer uso da interpolação por isso prefira sempre o uso de Strings com aspas duplas ex: print 'oi #{nome}' não funcionaria

string_qualquer = 'o'

puts "----------------------"
puts "Estou interpolando uma string com uma variável: #{string_qualquer}"
puts "Estou interpolando uma variável juntando com outra string: #{string_qualquer + 'i'}"


# O método capitalize coloca a primeira letra de uma String em caixa alta. No Ruby strings também são objetos.

outronome = "henrique"
puts "----------------------"
puts outronome.capitalize

# Se você quiser que esse método altere definitivamente o valor do objeto string outronome, use o caracter ! no final da função o caracter (!) é chamado de bang

puts "----------------------"
puts outronome
outronome.capitalize!
puts outronome

# Converte todos os caracteres de uma string para UPCASE

puts "----------------------"
puts "Astros".upcase

# Converte todos os caracteres de uma string para downcase

puts "----------------------"
puts "Astros".downcase

# Converte todos os caracteres de uma string para sWAPCASE

puts "----------------------"
puts "Astros".swapcase

# Reverte todos os caracteres

puts "----------------------"
puts "Astros".reverse

# Reverte todos os caracteres e transforma em UPCASE

puts "----------------------"
puts "Astros".reverse.upcase

# Substitui a primeira ocorrência de azul por vermelho

puts "----------------------"
puts "O carro é azul".sub "azul", "vermelho"

# Substitui as ocorrências de azul por vermelho

puts "----------------------"
puts "O carro é azul. Minha blusa é azul".sub "azul", "vermelho"

# Remove os espaços no começo e no fim de uma string

puts "----------------------"
puts "  O carro é azul. Minha blusa é azul    ".strip

# Como no ruby tudo é objeto temos um método chamado class que mostra a classe de tal objeto

puts "----------------------"
puts outronome.class

# Operador ||= verifica se a variável ja foi preenchida, caso não foi, ou a variável seja null atribui o valor.

puts "----------------------"
nome ||= "foi preenchida antes"
puts nome

maisumnome = nil
maisumnome ||= "não tinha sido preenchida antes"
puts maisumnome


# http://ruby-doc.org/core-2.4.0/String.html para todos os métodos de strings

fim = gets
