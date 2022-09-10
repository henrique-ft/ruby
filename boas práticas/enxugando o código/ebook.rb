class Ebook
  attr_reader :titulo, :ano_lancamento, :preco, :editora
  def initialize(titulo, preco, ano_lancamento, editora)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def matches?(query)
    ["ebook","digital"].include?(query)
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
