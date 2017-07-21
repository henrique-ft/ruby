
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

class Conversor
   def string_para_alfanumerico(nome)
       nome.gsub /[^\w\s]/,''
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


# Imagine que agora obtivemos uma array contendo os preços de alguns livros. 
# Desejamos formatar esse valor para um string que represente um valor monetário em reais. 
# Por exemplo, em vez de:
#
#     precos = [30.0, 40.0, 70.0, 59.0]
#     puts precos.to_s
#     => [30.0, 40.0, 70.0, 59.0]
#
# Gostaríamos de obter:
#
#     puts precos.to_s
#     => ["R$30,00", "R$40,00", "R$70,00", "R$59,00"]
#
# Como poderíamos resolver essa questão? 
# Pensando que a maioria dos números de nossa aplicação serão relativos a valores dos livros, 
# poderíamos abrir alguma classe já existente ou criar uma nova classe de conversor?
#
# Poderíamos abrir a classe Floar adicionando um NOVO MÉTODO. 
# Ou seja, nesse caso não há problemas, pois não estamos modificando comportamentos, estamos adicionando.

class Float
    def para_dinheiro
      valor = "R$" << self.to_s.tr('.', ',')
      valor << "0" unless valor.match /(.*)(\d{2})$/
      valor
    end
end

puts precos = [30.00, 40.00, 70.00, 59.00]
precos_string = []
precos.each do |preco|
puts preco.class
precos_string << preco.para_dinheiro
end
puts precos_string.to_s

# Desejamos mostrar uma mensagem para o usuário no seguinte estilo: "Olá! Há x títulos distintos na lista de livros!"

# Onde x é o número e títulos que há em nossa array. 
# Poderíamos usar livros_computacao.length para mostrar quantos títulos há na array; contudo repetições seriam consideradas. 
# Será que nesse contexto não seria melhor exibir o tamanho da array sem contar títulos que se repetem?
# Para isso, seria interessante alterar o método length na classe Array ou poderíamos alterar o método somente no objeto livros_computacao? 
# É de responsabilidade de todo objeto array não considerar valores repetidos ou somente do objeto livros_computacao?

# Nesse caso seria interessante modificar o método length somente no objeto livros_computacao. 
# Basicamente, apenas para esse objeto no contexto que temos é interessante que repetições não sejam consideradas.
# Aparentemente não são todos os objetos do tipo Array que devem desconsiderar elementos repetidos na contagem.

# Abrindo o objeto livros_computacao e modificando o comportamento no método length

def livros_computacao.length
	unique = []
	self.each do |item|
	  unique.push(item) unless unique.include?(item)
	end
	unique.length
end