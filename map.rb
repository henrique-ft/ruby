# Map

# Converte todas as string do array para inteiros

puts ['1', '23.0', '0', '4'].map {|x| x.to_i}
puts ['1', '23.0', '0', '4'].map {&:to_i}

# Associa cada resultado do map com o valor antigo em uma hash 
# A função Hash[] cria um novo hash de acordo com o array passado

puts Hash[['1','2.1','3.33','0.9'].map{|x| [x,x.to_i]}]
