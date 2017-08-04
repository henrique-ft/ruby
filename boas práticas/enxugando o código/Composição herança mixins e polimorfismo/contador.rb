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