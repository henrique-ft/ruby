class Produto

  attr_reader :titulo, :ano_lancamento, :preco, :editora

  def initialize(titulo, preco, ano_lancamento, editora)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def to_csv
    puts "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  # As classes que incluirem este módulo vão ganhar um método privado.
  # Ele será privado ao objeto.
  # Um método privado em Ruby é privado ao objeto, e não ao módulo ou classe onde ele foi definido

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
