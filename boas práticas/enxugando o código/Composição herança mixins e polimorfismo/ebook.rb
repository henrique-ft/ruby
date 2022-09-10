require_relative "produto"

class Ebook < Produto

  # Diz que o Ebook se comporta como produto, tem os comportamentos de um produto
  # Isto é herdar comportamento através de mixins e polimorfismo
  # include Produto

  def initialize(titulo, preco, ano_lancamento, editora)
    super(titulo, preco, ano_lancamento, editora)
  end

  def matches?(query)
    ["ebook","digital"].include?(query)
  end
end
