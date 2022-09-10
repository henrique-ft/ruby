# Operadores Booleanos --------------------------------------------------------------------------------------

# Equal

puts 3 == 3

# Less or equal than

puts 3 <= 3

# Greater or equal than

puts 3 >= 3

# Less than

puts 3 < 3

# Greater than

puts 3 > 3

# and

puts (3 == 3) && (4 == 4)

# or

puts (3 == 3) || (3 == 4)


# if ---------------------------------------------------------------------------------------------------------

# O if do ruby aceita qualquer expressão booleana, no entando, cada objeto em ruby possui um "valor booleano".
# Os únicos objetos de valor booleano false são o próprio false e o nil.
# Portanto, qualquer valor pode ser usado como argumento do if

variavel = nil

if variavel
  puts("só iria imprimir se variável != null (nil)")
end

if variavel == nil
  puts("variável é nula")
else
  puts("variável não é nula")
end

if 10 > 0
  puts("dez maior que zero")
elsif 5 > 0
  puts("cinco maior que zero")
end

unless idade < 5
  puts "Você tem menos de 5 anos"
end

# Condicionais inline

x = 0
y = 0

# Se x for igual a i, 3 é atribuido a y

if x == 1 then y = 3 end


# Switch -----------------------------------------------------------------------------------------------------------

# Não funciona porque a variável que vem do console sempre chega como string

puts "--------------------------------"

variavel_switch = gets

case variavel_switch

when 3
  puts "teste"
when 4
  puts "é o número 4"
when 5
  puts "é o número 5"
end

puts variavel_switch.class

# Funciona

variavel_switch = 4

case variavel_switch

when 3
  puts "teste"
when 4
  puts "é o número 4"
when 5
  puts "é o número 5"
end


# For --------------------------------------------------------------------------------------------------------------

# Ranges
# O Ruby fornece uma maneira de trabalharmos com sequências de uma forma bem simples: (1..3) # Range representando números de 1 a 3.
# ('a'..'z') # Range representando letras minúsculas do alfabeto

puts "--------------------------------"

for i in ('a'..'z')
  puts i
end

puts "--------------------------------"

for i in (1..5)
  puts i
end

puts "--------------------------------"

for i in (0..5)
  puts i
end

# -------------------------------------------------------------------------------------------------------------------


fim = gets
