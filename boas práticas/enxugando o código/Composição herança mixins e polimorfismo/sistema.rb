require_relative "livro"
require_relative "revista"
require_relative "ebook"
require_relative "estoque"

class Conversor
  def string_para_alfanumerico(nome)
    nome.gsub /[^\w\s]/,''
  end
end

# Após separado a classe Livro em Revista, Ebook e Livro, não precisamos mais da variável tipo

# algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", "livro")
# arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "", "livro")
# programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "", "livro")
# ruby = Livro.new("Programming Ruby", 100, 2004, true, "",true, "livro")
# revistona = Livro.new("Revista de Ruby", 10, 2012, true, "", "revistas")
# online_arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 50, 2012, true, "", "ebook")

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "",true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "",true)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "",false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "",false)
revistona = Revista.new("Revista de Ruby", 10, 2012, true, "",3)
online_arquitetura = Ebook.new("Introdução a Arquitetura e Design de Software", 50, 2012, "")

estoque = Estoque.new

estoque << algoritmos << algoritmos
estoque << arquitetura
estoque << programmer
estoque << ruby << ruby << ruby

estoque.vender ruby
estoque.vender algoritmos
estoque.vender algoritmos
estoque.vender online_arquitetura
puts estoque.livro_que_mais_vendeu_por_titulo.titulo

