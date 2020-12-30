require 'ostruct'

class Author

  attr_accessor :first_name, :last_name, :genre

  def author

    OpenStruct.new(first_name: first_name, last_name: last_name, genre: genre)
  end

  # O método method_missing é chamado sempre que na instância, for solicitado um método que não existe na declaração da classe.
  # Nesse caso, se não existir o método, ele recebe o nome e verifica se começa com 'author_', se sim chama um método com um nome com o que vier depois do 'author_'
  # Se não, chama o method missing default com o super

  def method_missing(method_name, *arguments, &block)

    if method_name.to_s =~ /author_(.*)/

      author.send($1, *arguments, &block)
    else

      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)

    # Fez a mesma lógica que o método method_missing, porém de uma maneira reduzida
    method_name.to_s.start_with?('author_') || super
  end

end

author = Author.new
author.first_name = 'cal'
author.last_name = 'newport'
author.genre = 'Computer Science'

# Você não tem nenhum método chamado author_genre

p author.author_genres

# Retorna true, pois inspect é um método disponível em qualquer classe do ruby

p author.respond_to?(:inspect)

# Retorna false, pois não está declarado na classe, logo usar o method missing, pode ser má prática
# Implementando respond_to_missing? melhora a situação, também é um método mágico que é ativado quando usamos o respond_to

p author.respond_to?(:author_genre)
