
# No Ruby é possível abrir uma classe qualquer e alterar o comportamento dela dinamicamente
# Mas isso é muito perigoso, é importantíssimo manter a compatibilidade, não quebrar o que ja existe.

# Ao abrir uma classe, temos que conhecer exatamente como ela funciona por completo.

class Livro
	attr_reader :titulo, :ano_lancamento, :preco
	def initialize(titulo, preco, ano_lancamento, possui_reimpressao) 
	  @titulo = titulo
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)
	end

	def possui_reimpressao?
		@possui_reimpressao
	end

	def to_csv
		puts "#{@titulo}, #{@ano_lancamento}, #{@preco}"
	end

	private

	def calcula_preco(preco)
		if @ano_lancamento < 2006
			if @possui_reimpressao
				preco * 0.9
			else
				preco * 0.95
			end
		elsif @ano_lancamento <= 2010
			preco * 0.96
		else
			preco
		end
	end
end

# Errado

# Ao abrir uma classe, estamos nos acoplando fortemente a tudo o que ela contém, conteve e conterá.
# Um desenvolvedor pode usar nosso código numa versão antiga ou futura do Ruby e nossas mudanças têm que manter compatibilidade com todas elas, o que é muito difícil.
# Portanto, é importante estarmos atentos sempre que abrimos alguma classe e alteramos seu comportamento. 
# Devemos sempre prestar atenção no retorno dos métodos, uma vez que podemos introduzir bugs no sistema. Em nosso exemplo, quebramos o contrato do método <<.

# class Array
#   attr_reader :maximo_necessario
#   def << (livro)
#     push (livro)
#     if @maximo_necessario.nil? || @maximo_necessario < size
#       @maximo_necessario = size
#     end
#     self
#   end
# end

# Certo

# É possível alterar o comportamento de um único objeto atravéz de módulos.

module Contador
	attr_reader :maximo_necessario
	def <<(livro)
		push(livro)
		if @maximo_necessario.nil? || @maximo_necessario < size
			@maximo_necessario = size
		end
		self # Retorna a própria classe após a execução da lógica do método
	end
end

class Estoque

	attr_reader :livros

  def initialize
  	@livros = []

  	# Estendeu o módulo Contador, ou seja @livros ganhou automaticamente os métodos << e maximo_necessário
  	# O módulo foi incluido nos nossos livros dinamicamente, em tempo de execução
  	@livros.extend Contador
  end

  def exporta_csv
		@livros.each do |livro|
			puts livro.to_csv
		end
	end

	def mais_baratos_que(valor)
		@livros.select do |livro|
			livro.preco <= valor
	  end
	end

	def total
		@livros.size
	end

	# def adiciona(livro)
	# 	@livros << livro if livro
	# end

	def <<(livro)

		@livros << livro if livro
		self # Faz o método devolver ele mesmo e não o @livro
	end

	# def delete(livro)
	# 	@livros.delete livro
	# end

	def remove(livro)
		@livros.delete livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end

end

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)

estoque = Estoque.new

estoque << algoritmos 
# puts estoque.livros.maximo_necessario # maneira errada, o certo é mandar o objeto fazer alguma coisa, e não ficar pedindo dados dele.
puts estoque.maximo_necessario 
estoque << arquitetura
# puts estoque.livros.maximo_necessario # maneira errada, o certo é mandar o objeto fazer alguma coisa, e não ficar pedindo dados dele.
puts estoque.maximo_necessario 
estoque << programmer
# puts estoque.livros.maximo_necessario # maneira errada, o certo é mandar o objeto fazer alguma coisa, e não ficar pedindo dados dele.
puts estoque.maximo_necessario 
estoque << ruby
# puts estoque.livros.maximo_necessario # maneira errada, o certo é mandar o objeto fazer alguma coisa, e não ficar pedindo dados dele.
puts estoque.maximo_necessario 
# estoque.livros.delete algoritmos # maneira errada, o certo é mandar o objeto fazer alguma coisa, e não ficar pedindo dados dele.
estoque.remove algoritmos

# É possível alterar também, o comportamento de um único objeto.
# Podemos criar um array de números que extende o contador

numbers = []
numbers.extend Contador
numbers << 13
numbers << 15
numbers << 17

puts numbers.maximo_necessario
