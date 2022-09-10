require_relative "produto"
require_relative "impresso"

# Diz que o Livro é um produto, tem os comportamentos de um produto
# Isto é herança de comportamento
class Livro < Produto

  # Diz que o Livro se comporta como produto impresso, tem os comportamentos de um produto
  # Isto é herdar comportamento através de mixins e polimorfismo
  include Impresso

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, possui_sobrecapa, editora)
    super(titulo, preco, ano_lancamento, editora)
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
  end

  def matches?(query)
    ["livro","impresso"].include?(query)
  end
end
