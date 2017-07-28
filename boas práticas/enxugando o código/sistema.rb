require_relative "livro"
require_relative "estoque"

class Conversor
   def string_para_alfanumerico(nome)
       nome.gsub /[^\w\s]/,''
   end
end

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", "livro")
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "", "livro")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "", "livro")
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", "livro")
revistona = Livro.new("Revista de Ruby", 10, 2012, true, "", "revistas")

estoque = Estoque.new

estoque << algoritmos << algoritmos
estoque << arquitetura
estoque << programmer
estoque << ruby << ruby << ruby

estoque.vender ruby
estoque.vender algoritmos
estoque.vender algoritmos
puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo


