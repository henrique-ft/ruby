# --------- Errado ----------

# class Livro
# 	attr_accessor :titulo, :preco, :ano_lancamento
# end

# livro_rails =  Livro.new
# livro_rails.preco = 70
# livro_rails.preco = "Agile Development With Rails"
# livro_rails.ano_lancamento = 2011

# livro_ruby =  Livro.new
# livro_ruby.preco = 60
# livro_ruby.preco = "Programming Ruby 1.9"
# livro_ruby.ano_lancamento = 2010

# def imprime_nota_fiscal(livros)

# 	livros.each do |livro|

# 		# Podemos mudar o valor de livro em qualquer lugar da aplicação?? isso está totalmente errado 

# 		livro.preco = 1
# 		puts "Titulo : #{livro.titulo} - Preço: #{livro.preco}"
# 	end
# end

# livros = [livro_rails, livro_ruby]

# imprime_nota_fiscal livros

# --------- Certo ----------

# O calculo do preco estava jogado em toda a aplicação no exemplo anterior.
# se não houvessemos controlado o escopo da variavel preço do nosso livro, iríamos correr atrás em cada um dos pontos que faria alteração, para verificar se influenciaria ou não a nova promoção.
# Quando agrupamos os valores junto com o comportamento da classe livro, sabemos que se precisarmos mudar alguma coisa relacionada a classe livro, temos que mudar lá, é o único ponto da aplicação.
# O correto é o valores da classe livro serem acessiveis apenas no escopo da classe, fora do escopo é disponibilizado apenas a sua leitura.
# Dessa vorma os dados de um livro estão juntos com o comportamento ligado a ele. 
# Essa é a base de Orientação a Objetos: dados e comportamento que são relacionados ficam no mesmo lugar

class Livro
	attr_reader :titulo, :ano_lancamento, :preco
	def initialize(titulo, preco, ano_lancamento) # Garantimos que se um objeto existe, ele foi criado corretamente, recebendo seus valores essenciais no construtor
	  @titulo = titulo
		@ano_lancamento = ano_lancamento
		@preco = calcula_preco(preco)
	end

	private

	def calcula_preco(preco)
		if @ano_lancamento < 2000
			preco =* 0.7
		else
			preco
		end 
	end
end

livro_rails = Livro.new("Agile Development With Rails", 70, 2011)
livro_ruby = Livro.new("Programming Ruby 1.9", 60, 2010)

def imprime_nota_fiscal(livros)
	livros.each do |livro|
		puts "Titulo : #{livro.titulo} - Preço: #{livro.preco}"
	end
end

livros = [livro_rails, livro_ruby]

imprime_nota_fiscal livros

def livro_para_newsletter(livro)
	if livro.ano_lancamento < 1999
		puts "Newsletter/Liquidação"
		puts livro.titulo
		puts livro.preco
	end
end

algoritmos = Livro.new("Algoritmos", 100, 1998)

livro_para_newsletter algoritmos