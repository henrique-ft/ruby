require_relative "produto"

class Ebook

	# Diz que o Ebook se comporta como produto, tem os comportamentos de um produto
	# Isto é herdar comportamento através de mixins e polimorfismo
	include Produto

	def initialize(titulo, preco, ano_lancamento, editora) 
	  	@titulo = titulo
		@ano_lancamento = ano_lancamento
		@preco = calcula_preco(preco)
		@editora = editora
	end

    def matches?(query)
      ["ebook","digital"].include?(query)
    end
end