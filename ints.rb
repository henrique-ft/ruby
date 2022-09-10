# Ruby permite avaliar expressões aritméticas tradicionais

puts 3*(1+5)/8


# No Ruby temos 3 tipos  numéticos:

# Fixnum

puts 99.class

# Bignum

puts 999999999999999.class

# Float

puts 9.0.class

#Soma

puts "-Soma----------------"
puts 3 + 2
puts 3.4 + 2.2
puts 1 + 9999999999999999
puts 3 + 3.8

#Subtração

puts "-Subtração-----------"
puts 3 - 2
puts 3.4 - 2.2
puts 1 - 9999999999999999
puts 3 - 3.8

#Divisão  obs: Se fizermos uma divisão cujo os números sejam fixnum e o resultado não seja um número inteiro(float), este será arredondado para baixo.

puts "-Divisão-------------"
puts 3 / 2
puts 3.4 / 2.2
puts 1 / 9999999999999999
puts 3 / 3.8

#Multiplicação

puts "-Multiplicação-------"
puts 3 * 2
puts 3.4 * 2.2
puts 1 * 9999999999999999
puts 3 * 3.8

#Potência

puts "-Potência------------"
puts 3 ** 2
puts 3.4 ** 2.2
puts 1 ** 9999999999999999
puts 3 ** 3.8

#Módulo(Resto)

puts "-Módulo(Resto)-------"
puts 3 % 2
puts 3.4 % 2.2
puts 1 % 9999999999999999
puts 3 % 3.8

# O ruby também tem os operadores += *= -= /=

oi = 4

puts "Operadores += *= -= /="

oi += 5 

puts oi

oi *= 2

puts oi

oi -= 1 

puts oi

oi /= 2

puts oi


fim = gets