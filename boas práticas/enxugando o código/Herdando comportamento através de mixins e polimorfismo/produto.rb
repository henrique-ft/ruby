module Produto

	attr_reader :titulo, :ano_lancamento, :preco, :editora

	def to_csv
		puts "#{@titulo}, #{@ano_lancamento}, #{@preco}"
	end

	# As classes que incluirem este módulo vão ganhar um método privado.
	# Ele será privado ao objeto.
	# Um módulo não têm métodos privados somente para ele
	# Se a palavra private estivesse sido incluida dentro do escopo de uma classe e se Produto fosse uma superclasse de ebook, revista e livro, e não um módulo,
	# produto, revista e livro não teriam acesso a esse método

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