require_relative "contador"

class Estoque

	attr_reader :livros

  def initialize
  	@livros = []
  	@vendas = []
  	@livros.extend Contador
  end

  # REFATORAÇÃO 1
  #
  # Podemos generalizar os métodos quantidade_de_vendas_por ... pois se continuarmos seguindo esse padrão iremos repetir várias vezes o mesmo código
  
  # def quantidade_de_vendas_de_titulo(produto)
  # 	@vendas.count {|venda| venda.titulo == produto.titulo}
  # end

  # def livro_que_mais_vendeu_por_titulo
  # 	@vendas.sort {|v1,v2|
  # 		quantidade_de_vendas_de_titulo(v1) <=> quantidade_de_vendas_de_titulo(v2)
  # 	}.last
  # end

  # def livro_que_mais_vendeu_por_ano
  # 	@vendas.sort {|v1,v2|
  # 		quantidade_de_vendas_de_ano(v1) <=> quantidade_de_vendas_de_ano(v2)
  # 	}.last
  # end

  # REFATORAÇÃO 2
  #
  # Podemos generalizar ainda mais esses métodos, 
  # observe que o trecho de código quantidade_de_vendas_por(v1, &:titulo) <=> quantidade_de_vendas_por(v2, &:titulo) 
  # se repete em todas as funções
  #
  # def quantidade_de_vendas_por(produto , &campo)
  # 	@vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  # end

  # def livro_que_mais_vendeu_por_titulo
  # 	@vendas.sort {|v1,v2|
  # 		quantidade_de_vendas_por(v1, &:titulo) <=> quantidade_de_vendas_por(v2, &:titulo)
  # 	}.last
  # end

  # def livro_que_mais_vendeu_por_ano
  # 	@vendas.sort {|v1,v2|
  # 		quantidade_de_vendas_por(v1, &:ano_lancamento) <=> quantidade_de_vendas_por(v2, &:ano_lancamento)
  # 	}.last
  # end

  # def livro_que_mais_vendeu_por_editora
  # 	@vendas.sort {|v1,v2|
  # 		quantidade_de_vendas_por(v1, &:editora) <=> quantidade_de_vendas_por(v2, &:editora)
  # 	}.last
  # end

  # REFATORAÇÃO 3
  #
  # Agora queremos Revistas e Ebooks no nosso sistema, logo também queremos os métodos _que_mais_vendeu_por, logo duplicaremos
  #
  # Repare que da maneira abaixo, o código também está se repetindo entre os métodos, mudando apenas uma string.
  # Para resolver esse problema podemos extrair o método e adicionar um parâmetro a mais

  # def livro_que_mais_vendeu_por(&campo)
  #   @vendas.select {|l| l.tipo == "livro"}.sort {|v1,v2|
  #     quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
  #   }.last
  # end

  # def quantidade_de_vendas_por(produto , &campo)
  #   @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  # end

  # def livro_que_mais_vendeu_por_titulo
  #   livro_que_mais_vendeu_por(&:titulo)
  # end

  # def livro_que_mais_vendeu_por_ano
  #   livro_que_mais_vendeu_por(&:ano)
  # end

  # def livro_que_mais_vendeu_por_editora
  #   livro_que_mais_vendeu_por(&:editora)
  # end


  # def revista_que_mais_vendeu_por(&campo)
  #   @vendas.select {|l| l.tipo == "revista"}.sort.sort {|v1,v2|
  #     quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
  #   }.last
  # end

  # def revista_que_mais_vendeu_por_titulo
  #   revista_que_mais_vendeu_por(&:titulo)
  # end

  # def revista_que_mais_vendeu_por_ano
  #   revista_que_mais_vendeu_por(&:ano)
  # end

  # def revista_que_mais_vendeu_por_editora
  #   revista_que_mais_vendeu_por(&:editora)
  # end

  ############

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|l| l.tipo == tipo}.sort {|v1,v2|
      quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
    }.last
  end

  def quantidade_de_vendas_por(produto , &campo)
    @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  end

  def livro_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("livro", &:titulo)
  end

  def livro_que_mais_vendeu_por_ano
    que_mais_vendeu_por("livro", &:ano)
  end

  def livro_que_mais_vendeu_por_editora
    que_mais_vendeu_por("livro", &:editora)
  end

  def revista_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("revista", &:titulo)
  end

  def revista_que_mais_vendeu_por_ano
    que_mais_vendeu_por("revista", &:ano)
  end

  def revista_que_mais_vendeu_por_editora
    que_mais_vendeu_por("revista", &:editora)
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

	def <<(livro)

		@livros << livro if livro
		self # Faz o método devolver ele mesmo e não o @livro
	end

	def vender(livro)
		@livros.delete livro
		@vendas << livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end

end
