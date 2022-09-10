class Revista
  attr_reader :titulo, :ano_lancamento, :preco, :editora
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, numero, editora)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @numero = numero
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def matches?(query)
    ["revista","impresso"].include?(query)
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
