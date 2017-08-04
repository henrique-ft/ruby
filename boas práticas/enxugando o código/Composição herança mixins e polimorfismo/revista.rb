require_relative "produto"
require_relative "impresso"

class Revista < Produto

	# Diz que a Revista se comporta como produto impresso, tem os comportamentos de um produto
	# Isto é herdar comportamento através de mixins e polimorfismo
	include Impresso

	def initialize(titulo, preco, ano_lancamento, possui_reimpressao, numero, editora) 
		super(titulo, preco, ano_lancamento, editora)
		@possui_reimpressao = possui_reimpressao
		@numero = numero
	end

    def matches?(query)
      ["revista","impresso"].include?(query)
    end
end