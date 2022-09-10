# Blocos e Programação Funcional

contas = [1,2,3,4,5]

class Banco
  def initialize(contas)
    @contas = contas
  end

  def status
    saldo = 0
    for conta in @contas
      saldo += conta
    end
    saldo
  end
end

banco = Banco.new(contas)
puts banco.status

puts "-------------------"

# Block é um objeto que ao ter o método call invocado, chamará o bloco que foi passado. O bloco funciona exatamente como a definição de uma função em ruby:
# ele pode receber parâmetos e ser invocado. Nesse caso o bloco é chamado atravéz do método call em cada laço do for.

class Banco
  def status(&block)
    saldo = 0
    for conta in @contas
      saldo += conta
      block.call(saldo)
    end
  end
end

# Qualquer tipo de execução, como outros cálculos, que eu desejar fazer para cada saldo, posso fazê-lo passando blocos distintos

banco.status do |parametro|
  puts parametro
end

puts "-------------------"

banco.status do |parametro|
  parametro = (parametro ** 2) / 2
  puts parametro
end

# Também posos chamar um bloco dentro de um bloco

puts "-------------------"

def Mine(&block)
  block.call do |y|
    puts y
  end
end

Mine do |&block|
  x = 1
  block.call(x)
end

# O Ruby também tem outra sintaxe para escrever blocos, trocando o do e o end por {}

def Minecraft(&block)
  block.call { |y|
    puts y
  }
end

Minecraft { |&block|
  x = 1
  block.call(x)
}

puts "-------------------"

# Agora voltando ao banco, se eu escrever apenas banco.status sem passar o bloco, vai dar erro.
# Para verificar se o bloco foi passado como parâmetro podemos usar a função block_given?

class Banco
  def status(&block)
    saldo = 0
    for conta in @contas
      saldo += conta

      if block_given?
        block.call(saldo)
      end
    end
    saldo
  end
end

puts banco.status

# Para chamar o bloco associado, existe uma outra abordagem, usando a palacra yield, nessa abordagem não é necessário receber o argumento &block

puts "--------------------"

class Banco
  def status
    saldo = 0

    for conta in @contas
      saldo += conta
      if block_given?
        y = yield(saldo)
        puts y
      end
    end

    saldo
  end
end

banco.status do |x|
  x *= 2
end

fim = gets
