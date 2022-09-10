# Transforma em array e usa o método select para filtrar todos os pares

(1..10).to_a.select do |x|
  x.even?
end

# É como se fosse o filter

(1..10).to_a.select {|x| x.even?}

# Syntax sugar do ruby, quando você coloca o & na frente de um symbolo, você consegue escapar uma parte da sintaxe

(1..10).to_a.select(&:even?)

# Retorna somente as palavras que tem 5 letras ou mais

arr = %w(The quick brown fox jumped ober the lazy dog)

arr.select {|x| x.length > 5}

# itera sobre cada letra e verifica se é vogal. o operador =~ verifica se bate ocm o regex, se sim retorna true, se não retorna false.

%w(a b c d e f g).select {|v| v =~ /[aeiou]/}
