# Grep é um método poderoso do Ruby para buscar informações em arrays, collections e estruturas de dados similares
# Retorna um array contendo os elementos encontrados, ou um array vazio

arr = [1, 2, 3, 4, 5, 6, 1, 7]

puts arr.grep 1 # [1, 1]

arr2 = ['hey.rb', 'there.rb', 'index.html']

# Retorna todos os elementos com final .rb e depois corta o .rb deles

puts arr2.select{|x| x =~ /\.rb/ }.map{|x| x[0..-4] }

# Com o grep

puts arr2.grep(/(.*)\.rb/){$1}