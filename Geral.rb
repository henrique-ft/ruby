# --------------------------------------------
# Pegar dados do usuário

puts "\n\nOlá mundo, digite seu nome..\n\n"
nome = gets.chomp # tira o /n
puts nome.inspect

puts "Digite a idade"
idade = gets.to_i # converte para inteiro
puts idade + 1

# Condicionais

if idade > 7

  puts "você não é mais criança"
else

  puts "Cê tem menos que sete anos"
end

unless idade < 5

  puts "Você tem menos de 5 anos"
end

case idade

when 2
  puts "2 anos"

when 3
  puts "3 anos"
end

(idade == 1)? (puts "ums") : (puts "não um")

# Operadores

puts 1 + 2
puts 2 * 2
puts 5 - 3
puts 4 / 4
puts 2 ** 3
puts 5 % 2

# Estruturas de repetição

a = 0;

while a < 10

  a += 1
  puts a
end

until a == 0

  a -= 1
  puts a
end

for i in 0..5

  puts i
end

[1,2,3,4].each do |j|

  puts j
end

# Arrays

v = [1,2,3,4]
puts v.class
puts v.inspect
puts v
puts v[2]

a = Array.new
a.push(4)
puts a.inspect

nomes = %w(henrique fernandez teixeira)
puts nomes.class
puts nomes

# Hashes

hash = {"a" => 123, "b" => 456 }
puts hash.class
puts hash.inspect
puts hash
puts hash["a"]
puts hash["b"]
hash.merge!({"c" => 766}) # Quando tem a exclamação ele muda o valor realmente da variável, e não apenas transforma para uma ação

# Strings

puts "Ruby" + "On" + "Rails" # Concatenação com o +, um novo objeto é gerado
puts "Ruby" << "On" << "Rails" # Concatenação com o << você mantém o mesmo objeto

txt = "Henrique Fernandez"
puts txt.object_id

txt = txt + " Teixeira"
puts txt.object_id

txt = txt << " da Silva"
puts txt.object_id

texto = "Ruby" << "On" << "Rails"
puts texto.gsub('Ruby', 'Php')
puts texto

puts texto.gsub!('Ruby', 'Php') # Quando tem a exclamação ele muda o valor realmente da variável, e não apenas transforma para uma ação
puts texto

str = "Pão,Café,Bolacha"
strarray = str.split(",")
strarrayjoin = strarray.join(",")

str = "Pão Café Bolacha"
strarray = str.split # Sem parâmetros é separado por espaço
strarrayjoin = strarray.join # Sem parâmetros é juntado por espaço

# Symbols
# Symbols são strings imutáveis
# Qualquer palavra que começa com : é um símbolo
# É boa prática usar em hashes

:simbolo.class

h = { :a => 123, :b => "Henrique"}

h = { a: 123, b: "Henrique"} # É a mesma coisa que o de cima, ele ja entende a: e b: como hashes

# Métodos

def menu

  puts "------------------"
  puts "|      MENU      |"
  puts "------------------"
end

def custom_menu(x)

  puts "#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}"
  puts "|      MENU      |"
  puts "#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}#{x}"
end

def soma(x, y)

  puts x + y
end

custom_menu('~')
soma(4,5)

# Os parênteses são opcionais no ruby

custom_menu '~'
soma 4,s5

# Constantes
# Qualquer palavra que esteja em letra maiúscula

ROR = "Ruby on Rails" # A constante foi criada para usar menos recurso computacional que a variável
ror = "Ruby on Rails"

# Eval
# Interpreta um texto como sendo da linguagem ruby

eval("3 + 5")

# Ranges

(-22..10).each do |x|

  puts x
end

# Classes
# O nome da classe sempre deverá iniciar com a letra maiúscula

class Pessoa

  def initialize(nome) # __construct

    @nome = nome # Atributos da classe, todo atributo no ruby é privado por padrão, porém você pode torna-lo publico criando métodos acessores
    @idade = 0
  end

  def imprimir_nome

    @nome # O retorno é implícito, a última linha da função
  end

  def mudar_nome novo_nome # Também não é obrigatório os parenteses em declarações de métodos em classes

    @nome = novo_nome
  end

  def idade # Método acessor da variável nome (get)

    @idade
  end

  def idade=(idade) # Método acessor da variável nome (set)

    @idade = idade
  end

  def apresente_se

    puts "Ola eu nasci de uma classe pessoa"
  end

  def qual_o_seu_numero?

    puts self.object_id
  end
end

pessoa = Pessoa.new "oi"
pessoa.apresente_se
pessoa.mudar_nome "bye"
puts pessoa.imprimir_nome

class Pessoa2

  attr_accessor :idade # Cria automaticamente os métodos acessores de idade

  def initialize(nome) # __construct

    @nome = nome # Atributos da classe, todo atributo no ruby é privado por padrão, porém você pode torna-lo publico criando métodos acessores
    @idade = 0
  end

  def imprimir_nome

    @nome # O retorno é implícito, a última linha da função
  end

  def mudar_nome novo_nome # Também não é obrigatório os parenteses em declarações de métodos em classes

    @nome = novo_nome
  end

  def apresente_se

    puts "Ola eu nasci de uma classe pessoa"
  end

  def qual_o_seu_numero?

    puts self.object_id
  end
end

class PessoaJuridica < Pessoa # Herança

  attr_accessor :cnpj # Herda os atributos de Pessoa e acrescenta @cnpj
end

# Modulos
# Dentro de um módulo você pode ter métodos, constantes e outras classes
# Ao invés disso, você diz qual a funcionalidae de um módulo específico que você deseja adicionar a uma classe ou a um objeto específico
# Você pode injetar módulos em uma classe ()
# Agem como namespace, permitindo que você defina métodos cujos nomes não irão colidir com aqueles definidos em outras partes de um programa
# (Diferente do php, você pode criar funções em módulos(namespaces))

module Frete

  TABELA_FRETE = {"BA" => 1.95, "SP" => 3.87, "PE" => 2.56}

  def imprimir_tabela_frete

    puts "-- Tabela de Frete --"

    TABELA_FRETE.each do |k,v|

      puts "#{k} - #{v}"
    end

    puts "---------------------"
  end

  def calcular_valor_final(valor_produto, uf)

    valor_produto * TABELA_FRETE[uf]
  end

  class ClasseDentroDoModulo

    attr_accessor :classe_dentro_do_modulo_atributo
  end
end

class Venda

  include Frete # Agora venda tem todos os métodos e constantes do módulo fret
end

# -----------------------------------------
