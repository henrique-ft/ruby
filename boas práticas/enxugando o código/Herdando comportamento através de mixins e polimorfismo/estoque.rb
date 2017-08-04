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
 
  # REFATORAÇÃO 4

  # Os métodos ainda estão muito parecidos, e o código ainda está muito repetido, o único parâmetro que muda é o segundo
  # Entõa vamos a mais uma refatoração, deixando o segundo parâmetro mais genérico
  
  # def livro_que_mais_vendeu_por_titulo
  #   que_mais_vendeu_por("livro", &:titulo)
  # end

  # def livro_que_mais_vendeu_por_ano
  #   que_mais_vendeu_por("livro", &:ano)
  # end

  # def livro_que_mais_vendeu_por_editora
  #   que_mais_vendeu_por("livro", &:editora)
  # end

  # def revista_que_mais_vendeu_por_titulo
  #   que_mais_vendeu_por("revista", &:titulo)
  # end

  # def revista_que_mais_vendeu_por_ano
  #   que_mais_vendeu_por("revista", &:ano)
  # end

  # def revista_que_mais_vendeu_por_editora
  #   que_mais_vendeu_por("revista", &:editora)
  # end

  # ULTIMA REFATORAÇÃO

  # Com o Ruby, temos um método chamado method missing, que recebe um symbol equivalente ao nome de um método que foi chamado na aplicação e não existe na classe.

  # def livro_que_mais_vendeu_por(&campo)
  #   que_mais_vendeu_por("livro", &campo)
  # end

  # def revista_que_mais_vendeu_por(&campo)
  #   que_mais_vendeu_por("revista", &campo)
  # end

  def method_missing(name)
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym
      que_mais_vendeu_por(tipo, &campo)
    else
      super
    end
  end

  # Toda vez que usamos o method missing, temos que sobrescrever também o método respond_to?, para garantir que ele retorne True caso chame um método que seja chamado com o method_missing

  def respond_to?(name)
    name.to_s.match "(.+)_que_mais_vendeu_por_(.+)" || super
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

  private

  # Sem Duck Typing

  #  def que_mais_vendeu_por(tipo, &campo)
  #    @vendas.select {|produto| produto.tipo == tipo}.sort {|v1,v2|
  #      quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
  #   }.last
  #  end

  # Com Duck Typing

  # O matches pergunta se o produto pertence a categoria que você esta criando
  # Ou seja, em cada classe: Revista, Livro ou Ebook terá de ser implementado um método matches? que retorna true ou false
  # O método matches? recebe um parâmetro chamado query, através desse parâmetro o método verifica se o objeto faz parte
  # do grupo de comportamento esperado, se ele, em sentido figurado, 'mesmo se for um ser humano, tem uma fantasia de pato e faz quack'
  # No caso em questão, se ele tem o comportamento que a nossa aplicação espera, ou seja, se ele é um ebook, um livro ou uma revista
  #
  #
  # def matches?(query)
  #   ["ebook","digital"].include?(query)
  # end
  #
  # Não importa para quem eu estou perguntando
  # Importa que você tenha o método matches? e que o método matches me diga se você é de tal categoria ou não

    def que_mais_vendeu_por(tipo, &campo)
      @vendas.select {|produto| produto.matches?(tipo)}.sort {|v1,v2|
        quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
      }.last
    end

    def quantidade_de_vendas_por(produto , &campo)
      @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
    end

end
