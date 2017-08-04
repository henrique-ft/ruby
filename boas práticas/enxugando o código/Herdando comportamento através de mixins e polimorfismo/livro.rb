require_relative "produto"

class Livro

	# Diz que o Livro se comporta como produto, tem os comportamentos de um produto
	# Isto é herdar comportamento através de mixins e polimorfismo
	include Produto

	def initialize(titulo, preco, ano_lancamento, possui_reimpressao, possui_sobrecapa, editora) 
	  	@titulo = titulo
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@possui_sobrecapa = possui_sobrecapa
		@preco = calcula_preco(preco)
		@editora = editora
	end

    def matches?(query)
      ["livro","impresso"].include?(query)
    end

	def possui_reimpressao?
		@possui_reimpressao
	end
end