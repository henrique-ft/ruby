# Encapsulamento na orientação a objetos significa esconder o estado interno do objeto do mundo externo.

# O encapsulamento é importante não só para que fique claro qual objeto tem
# responsabilidade sobre qual informação, mas também para tornar os objetos
# menos dependentes ou acoplados uns aos outros. Objetos muito acoplados
# dificultam a evolução de um sistema já que alterar uma única classe pode ter
# muitos efeitos colaterais em qualquer outro método que usa instâncias daquele tipo.

class Livro
  attr_reader :titulo, :ano_lancamento, :preco
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @preco = calcula_preco(preco)
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  def to_csv
    puts "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

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

class Estoque
  # Podemos tirar o attr_reader da nossa classe livros, pois assim garantimos que o livro deverá ser inserido atravéz do método 'adiciona' da nossa classe.
  # Caso mantivessemos o attr_reader, seria possível ler o array livros e utilizar o método <<, nativo do ruby, para adicionar livros à classe.
  # attr_reader :livros
  def initialize
    @livros = []
  end

  # Grande parte da funcionalidade do nosso método exporta_csv, consiste em realizar chamadas de atributos para a intância de livro
  # Se um objeto depende muito do estado interno de algum outro, estamos quebrando o encapsulamento.
  # Podemos encapsular a chamada aos atributos do livro, para que o próprio livro tenha a capacidade de se exportar em csv
  # def exporta_csv
  # 	@livros.each do |livro|
  # 		puts "#{livro.titulo}, #{livro.ano_lancamento}, #{livro.preco}"
  # 	end
  # end

  # Dessa forma a nossa classe estoque não tem mais acesso as propriedades de um livro
  # Quando ela precisar, diz para o livro fazer algo
  # No caso, devolver as informações na forma CSV
  # Nosso método agora utiliza o princípio TELL DONT'T ASK
  # Ele diz para o livro fazer alguma coisa, e não pede.
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

  def adiciona(livro)
    @livros << livro if livro
  end

end

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)

# Nesse caso, o que acontece se inserirmos um livro nulo na aplicação? Recebemos um erro!
# Para isso, é necessário criar um método adiciona na classe estoque
# estoque = Estoque.new
# estoque.livros << algoritmos << arquitetura
# estoque.livros << Livro.new("The Pragmatic Programmer", 100, 1999, true)
# estoque.livros << Livro.new("Programming Ruby", 100, 2004, true)
# estoque.livros << nil

estoque = Estoque.new
estoque.adiciona algoritmos
estoque.adiciona arquitetura
estoque.adiciona Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.adiciona Livro.new("Programming Ruby", 100, 2004, true)
estoque.adiciona nil

estoque.exporta_csv

baratos = estoque.mais_baratos_que(80)

baratos.each do |livro|
  puts livro.titulo
end
